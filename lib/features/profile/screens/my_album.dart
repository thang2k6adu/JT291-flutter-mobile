import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jt291_flutter_mobile/components/layout/CustomAppBar.dart';
import 'package:jt291_flutter_mobile/data/providers/user/user_general_provider.dart';

class MyAlbumScreen extends ConsumerStatefulWidget {
  const MyAlbumScreen({super.key});

  @override
  ConsumerState<MyAlbumScreen> createState() => _MyAlbumScreenState();
}

class _MyAlbumScreenState extends ConsumerState<MyAlbumScreen> {
  final ImagePicker _picker = ImagePicker();
  final int _maxPhotos = 6;

  bool _isPicking = false;
  bool _isSaving = false;
  bool _initialized = false;

  // Local working state
  List<String> _currentUrls = <String>[]; // existing images from server
  List<XFile> _pendingFiles = <XFile>[]; // newly selected images, not uploaded yet

  Future<void> _pickImages() async {
    if (_isPicking) return;
    setState(() {
      _isPicking = true;
    });
    try {
      final picked = await _picker.pickMultiImage(imageQuality: 85);
      if (picked.isEmpty) return;

      // Respect max size cap considering both existing and pending
      final remainingSlots = _maxPhotos - (_currentUrls.length + _pendingFiles.length);
      if (remainingSlots <= 0) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Album is limited to $_maxPhotos photos.')),
          );
        }
        return;
      }

      final toAdd = picked.take(remainingSlots).toList();
      setState(() {
        _pendingFiles.addAll(toAdd);
      });

      if (picked.length > remainingSlots && mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Only $remainingSlots more photo(s) allowed. Extra photos ignored.')),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error picking images: $e')),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isPicking = false;
        });
      }
    }
  }

  void _removeAt(int index) {
    // Index spans existing urls first, then pending files
    if (index < _currentUrls.length) {
      setState(() {
        _currentUrls.removeAt(index);
      });
    } else {
      final pendingIndex = index - _currentUrls.length;
      if (pendingIndex >= 0 && pendingIndex < _pendingFiles.length) {
        setState(() {
          _pendingFiles.removeAt(pendingIndex);
        });
      }
    }
  }

  Future<void> _save() async {
    if (_isSaving) return;
    setState(() {
      _isSaving = true;
    });

    try {
      final notifier = ref.read(userGeneralProvider.notifier);

      // Upload pending files (if any)
      List<String> uploadedUrls = <String>[];
      if (_pendingFiles.isNotEmpty) {
        final files = _pendingFiles.map((x) => File(x.path)).toList();
        uploadedUrls = await notifier.uploadAttachments(files);
        if (uploadedUrls.isEmpty) {
          if (mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Upload failed.')),
            );
          }
          return;
        }
      }

      // Merge and cap at max
      final merged = <String>[..._currentUrls, ...uploadedUrls];
      if (merged.length > _maxPhotos) {
        merged.removeRange(_maxPhotos, merged.length);
      }

      // Persist profile_urls
      await notifier.updateProfile({'profile_urls': merged});
      await notifier.refreshProfile();

      if (mounted) {
        setState(() {
          _pendingFiles.clear();
        });
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Saved successfully.')),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Save error: $e')),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isSaving = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final userAsync = ref.watch(userGeneralProvider);
    final serverUrls = userAsync.value?.profileUrls ?? const <String>[];

    if (!_initialized && serverUrls.isNotEmpty) {
      // Initialize local working state once when data arrives
      _initialized = true;
      _currentUrls = List<String>.from(serverUrls);
    }

    final totalItems = _currentUrls.length + _pendingFiles.length;
    final canAddMore = totalItems < _maxPhotos;
    final itemCount = canAddMore ? totalItems + 1 : totalItems; // + tile at end
    
    return Scaffold(
      appBar: CustomAppBar(title: 'My Album'),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.fromLTRB(16, 0, 16, 24),
        child: SizedBox(
          width: double.infinity,
          height: 56,
          child: ElevatedButton(
            onPressed: _isSaving ? null : _save,
            child: _isSaving
                ? const SizedBox(
                    height: 22,
                    width: 22,
                    child: CircularProgressIndicator(strokeWidth: 2, valueColor: AlwaysStoppedAnimation<Color>(Colors.white)),
                  )
                : const Text('Save'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.pinkAccent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ),
      ),
      body: SafeArea(
        minimum: EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 16),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Text(
                  'Show your best self',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    height: 2,
                  ),
                ),
                Text(
                  'Upload up to six of your best photos to make a fantastic first impression. Let your personality shine.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14),
                ),
                SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: itemCount,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                      childAspectRatio: 1,
                    ),
                    itemBuilder: (context, index) {
                      final isAddTile = canAddMore && index == totalItems;
                      if (isAddTile) {
                        return InkWell(
                          onTap: _isPicking ? null : _pickImages,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: Colors.grey.shade300),
                            ),
                            child: Center(
                              child: _isPicking
                                  ? const SizedBox(
                                      height: 24,
                                      width: 24,
                                      child: CircularProgressIndicator(strokeWidth: 2),
                                    )
                                  : const Icon(Icons.add, color: Colors.black54, size: 36),
                            ),
                          ),
                        );
                      }

                      final isExisting = index < _currentUrls.length;
                      return Stack(
                        fit: StackFit.expand,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: isExisting
                                ? Image.network(_currentUrls[index], fit: BoxFit.cover)
                                : Image.file(
                                    File(_pendingFiles[index - _currentUrls.length].path),
                                    fit: BoxFit.cover,
                                  ),
                          ),
                          Positioned(
                            top: 6,
                            right: 6,
                            child: InkWell(
                              onTap: () => _removeAt(index),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.black54,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                padding: const EdgeInsets.all(4),
                                child: const Icon(Icons.close, color: Colors.white, size: 18),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
