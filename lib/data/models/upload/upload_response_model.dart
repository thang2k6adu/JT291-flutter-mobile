import 'package:freezed_annotation/freezed_annotation.dart';

part 'upload_response_model.freezed.dart';

/// Upload response model
@freezed
abstract class UploadResponseModel with _$UploadResponseModel {
  const factory UploadResponseModel({
    @JsonKey(name: 'file_url') String? fileUrl,
    String? url,
    int? duration, // in seconds
    String? filename,
    int? size,
    String? mimetype,
    @JsonKey(name: 'media_type') String? mediaType,
  }) = _UploadResponseModel;

  factory UploadResponseModel.fromJson(Map<String, dynamic> json) {
    // Handle both file_url and url, prefer url if both exist
    final fileUrl = json['file_url'] as String?;
    final url = json['url'] as String?;
    
    return UploadResponseModel(
      fileUrl: fileUrl,
      url: url ?? fileUrl, // Use url if available, fallback to file_url
      duration: (json['duration'] as num?)?.toInt(),
      filename: json['filename'] as String?,
      size: (json['size'] as num?)?.toInt(),
      mimetype: json['mimetype'] as String?,
      mediaType: json['media_type'] as String?,
    );
  }
}

