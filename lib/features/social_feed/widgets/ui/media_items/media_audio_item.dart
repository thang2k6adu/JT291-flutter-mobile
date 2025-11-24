import 'package:flutter/material.dart';
import 'package:jt291_flutter_mobile/data/models/social/post_media_model.dart';

class MediaAudioItem extends StatelessWidget {
  final PostMediaModel media;

  const MediaAudioItem({Key? key, required this.media}) : super(key: key);

  String _formatDuration(int? seconds) {
    if (seconds == null) return '00:00';
    final minutes = seconds ~/ 60;
    final secs = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${secs.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Container(
          color: Colors.grey[100],
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Audio icon
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: Color(0xFFFF69B4).withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.headphones,
                  size: 40,
                  color: Color(0xFFFF69B4),
                ),
              ),
              SizedBox(height: 16),
              
              // Audio badge
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: Color(0xFFFF69B4).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.audiotrack, size: 16, color: Color(0xFFFF69B4)),
                    SizedBox(width: 6),
                    Text(
                      'Audio',
                      style: TextStyle(
                        color: Color(0xFFFF69B4),
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              
              SizedBox(height: 8),
              
              // Duration
              Text(
                _formatDuration(media.duration),
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[600],
                  fontWeight: FontWeight.w500,
                ),
              ),
              
              SizedBox(height: 16),
              
              // Play button
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: Color(0xFFFF69B4),
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.play_arrow, size: 30, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

