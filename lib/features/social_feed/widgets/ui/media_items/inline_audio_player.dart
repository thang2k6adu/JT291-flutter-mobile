import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class InlineAudioPlayer extends StatefulWidget {
  final String audioUrl;

  const InlineAudioPlayer({
    Key? key,
    required this.audioUrl,
  }) : super(key: key);

  @override
  State<InlineAudioPlayer> createState() => _InlineAudioPlayerState();
}

class _InlineAudioPlayerState extends State<InlineAudioPlayer> {
  late AudioPlayer _audioPlayer;
  bool _isInitialized = false;
  bool _hasError = false;
  bool _isPlaying = false;
  Duration _duration = Duration.zero;
  Duration _position = Duration.zero;

  @override
  void initState() {
    super.initState();
    _initializeAudio();
  }

  Future<void> _initializeAudio() async {
    try {
      _audioPlayer = AudioPlayer();
      
      // Listen to player state
      _audioPlayer.onPlayerStateChanged.listen((state) {
        if (mounted) {
          setState(() {
            _isPlaying = state == PlayerState.playing;
          });
        }
      });

      // Listen to duration changes
      _audioPlayer.onDurationChanged.listen((duration) {
        if (mounted) {
          setState(() {
            _duration = duration;
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

      // Set the source
      await _audioPlayer.setSourceUrl(widget.audioUrl);
      
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

  @override
  Widget build(BuildContext context) {
    if (_hasError) {
      return Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Icon(Icons.error_outline, color: Colors.red, size: 24),
            SizedBox(width: 12),
            Text(
              'Failed to load audio',
              style: TextStyle(color: Colors.black54),
            ),
          ],
        ),
      );
    }

    if (!_isInitialized) {
      return Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            SizedBox(
              width: 24,
              height: 24,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: Colors.black54,
              ),
            ),
            SizedBox(width: 12),
            Text(
              'Loading...',
              style: TextStyle(color: Colors.black54),
            ),
          ],
        ),
      );
    }

    final progress = _duration.inMilliseconds > 0 
        ? _position.inMilliseconds / _duration.inMilliseconds 
        : 0.0;

    return Container(
      width: 250,
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey[300]!, width: 1),
      ),
      child: Row(
        children: [
          // Play/Pause button
          GestureDetector(
            onTap: _togglePlayPause,
            child: Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                _isPlaying ? Icons.pause : Icons.play_arrow,
                color: Colors.black,
                size: 28,
              ),
            ),
          ),
          
          SizedBox(width: 12),
          
          // Waveform visualization
          Expanded(
            child: GestureDetector(
              onTapDown: (details) {
                // Calculate position based on tap
                final ratio = details.localPosition.dx / (MediaQuery.of(context).size.width - 80);
                final seekPosition = _duration * ratio.clamp(0.0, 1.0);
                _seekTo(seekPosition);
              },
              child: _WaveformVisualizer(
                progress: progress,
                isPlaying: _isPlaying,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Compact waveform visualizer
class _WaveformVisualizer extends StatelessWidget {
  final double progress;
  final bool isPlaying;
  
  const _WaveformVisualizer({
    Key? key,
    required this.progress,
    required this.isPlaying,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _CompactWaveformPainter(
        progress: progress,
        isPlaying: isPlaying,
      ),
      child: Container(
        height: 36,
      ),
    );
  }
}

// Custom painter for compact waveform
class _CompactWaveformPainter extends CustomPainter {
  final double progress;
  final bool isPlaying;
  
  _CompactWaveformPainter({
    required this.progress,
    required this.isPlaying,
  });

  @override
  void paint(Canvas canvas, Size size) {
    const barCount = 30;
    final barWidth = 3.0;
    final spacing = (size.width - (barCount * barWidth)) / (barCount - 1);
    
    // Generate heights for waveform bars
    final heights = List.generate(barCount, (index) {
      // Create a natural wave pattern
      final baseHeight = size.height * 0.2;
      final variation = size.height * 0.6 * 
          ((index % 11 == 0) ? 1.0 : 
           (index % 7 == 0) ? 0.9 : 
           (index % 5 == 0) ? 0.7 : 
           (index % 3 == 0) ? 0.5 : 
           (index % 2 == 0) ? 0.3 : 0.4);
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
        ..color = isPlayed ? Colors.black : Colors.grey[400]!
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
  bool shouldRepaint(_CompactWaveformPainter oldDelegate) {
    return oldDelegate.progress != progress || oldDelegate.isPlaying != isPlaying;
  }
}

