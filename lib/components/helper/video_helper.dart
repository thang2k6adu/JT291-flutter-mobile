import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:video_compress/video_compress.dart';

class VideoHelper {
  VideoHelper({ImagePicker? imagePicker})
      : _imagePicker = imagePicker ?? ImagePicker();

  final ImagePicker _imagePicker;

  /// Pick video from gallery
  Future<XFile?> pickVideo({ImageSource source = ImageSource.gallery, int maxDurationSeconds = 300}) async {
    FocusManager.instance.primaryFocus?.unfocus();

    final XFile? videoFile = await _imagePicker.pickVideo(
      source: source,
      maxDuration: Duration(seconds: maxDurationSeconds),
    );

    if (videoFile == null) return null;

    return await compressVideo(videoFile);
  }

  /// Compress video using video_compress
  Future<XFile> compressVideo(XFile file) async {
    final MediaInfo? compressedVideo = await VideoCompress.compressVideo(
      file.path,
      quality: VideoQuality.MediumQuality, // LowQuality / MediumQuality / HighQuality
      deleteOrigin: false,
    );

    if (compressedVideo == null || compressedVideo.path == null) return file;

    // Convert to XFile
    return XFile(compressedVideo.path!);
  }
}
