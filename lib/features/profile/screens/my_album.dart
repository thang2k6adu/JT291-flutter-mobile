import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jt291_flutter_mobile/components/layout/CustomAppBar.dart';
import 'package:jt291_flutter_mobile/data/providers/user_general/user_general_provider.dart';

class MyAlbumScreen extends ConsumerStatefulWidget {
  const MyAlbumScreen({super.key});

  @override
  ConsumerState<MyAlbumScreen> createState() => _MyAlbumScreenState();
}

class _MyAlbumScreenState extends ConsumerState<MyAlbumScreen> {
  final ImagePicker _picker = ImagePicker();
  final int _maxPhotos = 6;
  bool _isUploading = false;

  Future<void> _pickAndUpload() async {
    try {
      final picked = await _picker.pickMultiImage(imageQuality: 85);
      if (picked.isEmpty) return;

      setState(() {
        _isUploading = true;
      });

      final files = picked.map((x) => File(x.path)).toList();

      // Upload
      final notifier = ref.read(userGeneralProvider.notifier);
      final uploadedUrls = await notifier.uploadAttachments(files);
      if (uploadedUrls.isEmpty) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Upload failed.')),
          );
        }
        return;
      }

      // Merge with existing and cap at _maxPhotos
      final current = ref.read(userGeneralProvider).value?.profileUrls ?? const <String>[];
      final merged = List<String>.from(current)..addAll(uploadedUrls);
      if (merged.length > _maxPhotos) {
        merged.removeRange(_maxPhotos, merged.length);
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Album is limited to $_maxPhotos photos. Extra photos ignored.')),
          );
        }
      }

      // Save to profile
      await notifier.updateProfile({'profile_urls': merged});
      await notifier.refreshProfile();
    } catch (e) {
      print('Error: $e');
    } finally {
      if (mounted) {
        setState(() {
          _isUploading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final userAsync = ref.watch(userGeneralProvider);
    final profileUrls = userAsync.value?.profileUrls ?? const <String>[];

    final canAddMore = profileUrls.length < _maxPhotos;
    final itemCount = canAddMore ? profileUrls.length + 1 : profileUrls.length;

    return Scaffold(
      appBar: CustomAppBar(title: 'My Album'),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.fromLTRB(16, 0, 16, 24),
        child: SizedBox(
          width: double.infinity,
          height: 56,
          child: ElevatedButton(
            onPressed: null, // Save disabled per current design
            child: const Text('Save'),
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
                      final isAddTile = canAddMore && index == profileUrls.length;
                      if (isAddTile) {
                        return InkWell(
                          onTap: _isUploading ? null : _pickAndUpload,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: Colors.grey.shade300),
                            ),
                            child: Center(
                              child: _isUploading
                                  ? const SizedBox(
                                      height: 24,
                                      width: 24,
                                      child: CircularProgressIndicator(strokeWidth: 2),
                                    )
                                  : const Icon(
                                      Icons.add,
                                      color: Colors.black54,
                                      size: 36,
                                    ),
                            ),
                          ),
                        );
                      }

                      final url = profileUrls[index];
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.network(
                          url,
                          fit: BoxFit.cover,
                        ),
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
