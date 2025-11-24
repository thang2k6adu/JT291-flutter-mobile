import 'package:flutter/material.dart';
import 'package:jt291_flutter_mobile/data/models/social/post_media_model.dart';
import 'package:jt291_flutter_mobile/features/social_feed/widgets/ui/media_items/inline_audio_player.dart';

class MediaAudioItem extends StatelessWidget {
  final PostMediaModel media;

  const MediaAudioItem({Key? key, required this.media}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16, 0, 16, 12),
      child: InlineAudioPlayer(
        audioUrl: media.url,
      ),
    );
  }
}

