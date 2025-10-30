import 'package:flutter/material.dart';

class AvatarFullscreenView extends StatelessWidget {
  const AvatarFullscreenView({super.key, required this.imageProvider});

  final ImageProvider imageProvider;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Center(
            child: InteractiveViewer(
              minScale: 1.0,
              maxScale: 4.0,
              child: AspectRatio(
                aspectRatio: 1,
                child: Image(
                  image: imageProvider,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SafeArea(
            child: Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: IconButton(
                  onPressed: () => Navigator.of(context).maybePop(),
                  icon: const Icon(Icons.close, color: Colors.white, size: 28),
                  splashRadius: 22,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


