import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_media_model.freezed.dart';

/// Media type enum
enum MediaType {
  @JsonValue('image')
  image,
  @JsonValue('video')
  video,
  @JsonValue('audio')
  audio,
}

/// Extension to get string value from MediaType enum
extension MediaTypeExtension on MediaType {
  String get value {
    switch (this) {
      case MediaType.image:
        return 'image';
      case MediaType.video:
        return 'video';
      case MediaType.audio:
        return 'audio';
    }
  }
}

/// Post media model
@freezed
abstract class PostMediaModel with _$PostMediaModel {
  const factory PostMediaModel({
    required String id,
    required MediaType type,
    required String url,
    String? thumbnailUrl,
    int? width,
    int? height,
    int? duration, // for video/audio in seconds
  }) = _PostMediaModel;

  factory PostMediaModel.fromJson(Map<String, dynamic> json) {
    // Handle both 'url' and 'media_url' field names
    final url = json['url'] as String? ?? json['media_url'] as String?;
    if (url == null) {
      throw Exception('PostMediaModel: missing url or media_url field');
    }
    
    // Handle both 'type' and 'media_type' field names
    final mediaType = _mediaTypeFromJson(json['type'] ?? json['media_type']);
    
    return PostMediaModel(
      id: json['id'] as String,
      type: mediaType,
      url: url,
      thumbnailUrl: json['thumbnail_url'] as String?,
      width: (json['width'] as num?)?.toInt(),
      height: (json['height'] as num?)?.toInt(),
      duration: (json['duration'] as num?)?.toInt(),
    );
  }
}

/// Extension to add toJson method for PostMediaModel
extension PostMediaModelToJson on PostMediaModel {
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'media_type': type.value,
      'media_url': url,
      'thumbnail_url': thumbnailUrl,
      'width': width,
      'height': height,
      'duration': duration,
    };
  }
}

/// Helper function to parse MediaType from JSON
MediaType _mediaTypeFromJson(dynamic value) {
  if (value == null) {
    // Default to image if null
    return MediaType.image;
  }
  
  final String typeStr = value.toString().toLowerCase();
  switch (typeStr) {
    case 'image':
      return MediaType.image;
    case 'video':
      return MediaType.video;
    case 'audio':
      return MediaType.audio;
    default:
      // Default to image if unknown
      print('PostMediaModel: Unknown media_type "$value", defaulting to image');
      return MediaType.image;
  }
}



