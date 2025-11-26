import 'package:flutter/material.dart';
import 'dart:io';
import 'package:audioplayers/audioplayers.dart';

class CreatePostAudioPlayer extends StatefulWidget {
  final String audioPath;
  final Duration duration;
  final VoidCallback onRemove;
  final Function(AudioPlayer) onInitialized;

  const CreatePostAudioPlayer({
    super.key,
    required this.audioPath,
    required this.duration,
    required this.onRemove,
    required this.onInitialized,
  });

  @override
  State<CreatePostAudioPlayer> createState() => _CreatePostAudioPlayerState();
}

class _CreatePostAudioPlayerState extends State<CreatePostAudioPlayer> {
  late AudioPlayer _audioPlayer;
  bool _isInitialized = false;
  bool _hasError = false;
  bool _isPlaying = false;
  Duration _position = Duration.zero;

  @override
  void initState() {
    super.initState();
    _initializeAudio();
  }

  Future<void> _initializeAudio() async {
    try {
      // Kiểm tra file path có hợp lệ không
      if (widget.audioPath.isEmpty ||
          widget.audioPath == 'path/to/audio/file.m4a' ||
          widget.audioPath.contains('path/to')) {
        setState(() {
          _hasError = true;
        });
        return;
      }

      // Kiểm tra file có tồn tại không (nếu là local file)
      if (!widget.audioPath.startsWith('http://') &&
          !widget.audioPath.startsWith('https://')) {
        final file = File(widget.audioPath);
        if (!await file.exists()) {
          print('Audio file does not exist: ${widget.audioPath}');
          setState(() {
            _hasError = true;
          });
          return;
        }
      }

      _audioPlayer = AudioPlayer();

      // Listen to player state
      _audioPlayer.onPlayerStateChanged.listen((state) {
        if (mounted) {
          setState(() {
            _isPlaying = state == PlayerState.playing;
          });
        }
      });

      // Listen to position changes
      _audioPlayer.onPositionChanged.listen((position) {
        if (mounted) {
          setState(() {
            _position = position;
          });
        }
      });

      // Listen to completion
      _audioPlayer.onPlayerComplete.listen((event) {
        if (mounted) {
          setState(() {
            _position = Duration.zero;
            _isPlaying = false;
          });
        }
      });

      // Set the source (file path or URL)
      if (widget.audioPath.startsWith('http://') ||
          widget.audioPath.startsWith('https://')) {
        await _audioPlayer.setSourceUrl(widget.audioPath);
      } else {
        await _audioPlayer.setSourceDeviceFile(widget.audioPath);
      }

      widget.onInitialized(_audioPlayer);

      setState(() {
        _isInitialized = true;
      });
    } catch (e) {
      print('Error initializing audio: $e');
      setState(() {
        _hasError = true;
      });
    }
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  void _togglePlayPause() async {
    try {
      if (_isPlaying) {
        await _audioPlayer.pause();
      } else {
        await _audioPlayer.resume();
      }
    } catch (e) {
      print('Error toggling play/pause: $e');
    }
  }

  void _seekTo(Duration position) async {
    try {
      await _audioPlayer.seek(position);
    } catch (e) {
      print('Error seeking: $e');
    }
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return '$minutes:$seconds';
  }

  @override
  Widget build(BuildContext context) {
    if (_hasError) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.mic, color: Colors.grey.shade600, size: 24),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Audio Recording',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    _formatDuration(widget.duration),
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey.shade600,
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: widget.onRemove,
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.close, color: Colors.grey.shade700, size: 18),
              ),
            ),
          ],
        ),
      );
    }

    if (!_isInitialized) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          children: [
            const SizedBox(
              width: 24,
              height: 24,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: Colors.black54,
              ),
            ),
            const SizedBox(width: 12),
            const Text(
              'Loading...',
              style: TextStyle(color: Colors.black54, fontSize: 14),
            ),
          ],
        ),
      );
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        children: [
          Row(
            children: [
              // Play/Pause button
              GestureDetector(
                onTap: _togglePlayPause,
                child: Container(
                  width: 48,
                  height: 48,
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    _isPlaying ? Icons.pause : Icons.play_arrow,
                    color: Colors.white,
                    size: 24,
                  ),
                ),
              ),
              const SizedBox(width: 16),
              // Waveform visualization
              Expanded(
                child: GestureDetector(
                  onTapDown: (details) {
                    final RenderBox? box =
                        context.findRenderObject() as RenderBox?;
                    if (box != null) {
                      final localPosition = details.localPosition;
                      final width = box.size.width - 80;
                      final ratio = ((localPosition.dx - 80) / width).clamp(0.0, 1.0);
                      final seekPosition = widget.duration * ratio;
                      _seekTo(seekPosition);
                    }
                  },
                  child: _AudioWaveformVisualizer(
                    duration: widget.duration,
                    position: _position,
                    isPlaying: _isPlaying,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              // Remove button
              GestureDetector(
                onTap: widget.onRemove,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.close, color: Colors.grey.shade700, size: 18),
                ),
              ),
            ],
          ),
          // Time display
          Padding(
            padding: const EdgeInsets.only(top: 8, left: 64),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  _formatDuration(_position),
                  style: const TextStyle(
                    color: Colors.black54,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  _formatDuration(widget.duration),
                  style: const TextStyle(
                    color: Colors.black54,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Waveform visualizer widget
class _AudioWaveformVisualizer extends StatelessWidget {
  final Duration duration;
  final Duration position;
  final bool isPlaying;

  const _AudioWaveformVisualizer({
    required this.duration,
    required this.position,
    required this.isPlaying,
  });

  @override
  Widget build(BuildContext context) {
    final progress = duration.inMilliseconds > 0
        ? position.inMilliseconds / duration.inMilliseconds
        : 0.0;

    return CustomPaint(
      painter: _WaveformPainter(
        progress: progress,
        isPlaying: isPlaying,
      ),
      child: Container(
        height: 48,
      ),
    );
  }
}

// Custom painter for waveform
class _WaveformPainter extends CustomPainter {
  final double progress;
  final bool isPlaying;

  _WaveformPainter({
    required this.progress,
    required this.isPlaying,
  });

  @override
  void paint(Canvas canvas, Size size) {
    const barCount = 50;
    final barWidth = 3.0;
    final spacing = (size.width - (barCount * barWidth)) / (barCount - 1);

    // Generate random heights for waveform
    final heights = List.generate(barCount, (index) {
      final baseHeight = size.height * 0.3;
      final variation = size.height * 0.4 *
          ((index % 7 == 0)
              ? 1.0
              : (index % 5 == 0)
                  ? 0.8
                  : (index % 3 == 0)
                      ? 0.6
                      : (index % 2 == 0)
                          ? 0.4
                          : 0.5);
      return baseHeight + variation;
    });

    for (int i = 0; i < barCount; i++) {
      final x = i * (barWidth + spacing);
      final barHeight = heights[i];
      final y = (size.height - barHeight) / 2;

      // Determine if this bar is in the played portion
      final barProgress = (i + 1) / barCount;
      final isPlayed = barProgress <= progress;

      final paint = Paint()
        ..color = isPlayed ? Colors.black : Colors.grey[300]!
        ..strokeWidth = barWidth
        ..strokeCap = StrokeCap.round;

      // Draw bar
      canvas.drawLine(
        Offset(x, y),
        Offset(x, y + barHeight),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(_WaveformPainter oldDelegate) {
    return oldDelegate.progress != progress || oldDelegate.isPlaying != isPlaying;
  }
}

