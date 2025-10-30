import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jt291_flutter_mobile/components/layout/CustomAppBar.dart';
import 'package:jt291_flutter_mobile/data/services/user_general_service.dart';

class MyAlbumScreen extends ConsumerStatefulWidget {
  const MyAlbumScreen({super.key});

  @override
  ConsumerState<MyAlbumScreen> createState() => _MyAlbumScreenState();
}

class _MyAlbumScreenState extends ConsumerState<MyAlbumScreen> {
  final ImagePicker _picker = ImagePicker();
  final int _maxPhotos = 6;

  List<XFile> _selected = [];
  bool _isUploading = false;
  List<String> _uploadedUrls = [];

  Future<void> _pickImages() async {
    try {
      final images = await _picker.pickMultiImage(imageQuality: 85);
      if (images.isEmpty) return;

      final List<XFile> merged = List<XFile>.from(_selected)..addAll(images);
      if (merged.length > _maxPhotos) {
        merged.removeRange(_maxPhotos, merged.length);
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('You can upload up to 6 photos.')),
          );
        }
      }
      setState(() {
        _selected = merged.take(_maxPhotos).toList();
      });
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to pick images: $e')),
      );
    }
  }

  Future<void> _upload() async {
    if (_selected.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select at least one photo.')),
      );
      return;
    }

    setState(() {
      _isUploading = true;
    });
    try {
      final service = ref.read(userGeneralServiceProvider);
      final files = _selected.map((x) => File(x.path)).toList();
      final urls = await service.uploadAttachments(files);

      setState(() {
        _uploadedUrls = urls;
      });

      if (urls.isNotEmpty) {
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Upload successful.')),
        );
      } else {
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Upload failed.')),
        );
      }
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Upload error: $e')),
      );
    } finally {
      if (mounted) {
        setState(() {
          _isUploading = false;
        });
      }
    }
  }

  void _removeAt(int index) {
    setState(() {
      _selected.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'My Album'),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.fromLTRB(16, 0, 16, 24),
        child: SizedBox(
          width: double.infinity,
          height: 56,
          child: ElevatedButton(
            onPressed: _isUploading ? null : _upload,
            child: _isUploading
                ? const SizedBox(
                    height: 22,
                    width: 22,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    ),
                  )
                : const Text('Upload Photos'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Selected photos (${_selected.length}/$_maxPhotos)',
                            style: const TextStyle(fontWeight: FontWeight.w600),
                          ),
                          TextButton.icon(
                            onPressed: _isUploading ? null : _pickImages,
                            icon: const Icon(Icons.add_photo_alternate_outlined),
                            label: const Text('Add'),
                          ),
                        ],
                      ),
                      GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: _maxPhotos,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 12,
                          mainAxisSpacing: 12,
                          childAspectRatio: 1,
                        ),
                        itemBuilder: (context, index) {
                          final hasImage = index < _selected.length;
                          if (hasImage) {
                            final x = _selected[index];
                            return Stack(
                              fit: StackFit.expand,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.file(
                                    File(x.path),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Positioned(
                                  top: 6,
                                  right: 6,
                                  child: InkWell(
                                    onTap: _isUploading ? null : () => _removeAt(index),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.black54,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      padding: const EdgeInsets.all(4),
                                      child: const Icon(
                                        Icons.close,
                                        color: Colors.white,
                                        size: 18,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          } else {
                            final isFirstEmpty = _selected.isEmpty && index == 0;
                            return InkWell(
                              onTap: _isUploading ? null : _pickImages,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade200,
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(color: Colors.grey.shade300),
                                ),
                                child: Center(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(
                                        Icons.add_photo_alternate,
                                        color: isFirstEmpty ? Colors.red : Colors.grey,
                                        size: 36,
                                      ),
                                      const SizedBox(height: 6),
                                      Text(
                                        'Add photo',
                                        style: TextStyle(
                                          color: isFirstEmpty ? Colors.red : Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }
                        },
                      ),
                      if (_uploadedUrls.isNotEmpty) ...[
                        const SizedBox(height: 16),
                        const Text('Uploaded URLs', style: TextStyle(fontWeight: FontWeight.w600)),
                        const SizedBox(height: 8),
                        ..._uploadedUrls.map((u) => Text(
                              u,
                              style: const TextStyle(fontSize: 12, color: Colors.grey),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            )),
                      ],
                    ],
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
