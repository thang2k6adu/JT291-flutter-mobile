import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class AudioPlayerWidget extends StatefulWidget {
  final String audioUrl;

  const AudioPlayerWidget({
    Key? key,
    required this.audioUrl,
  }) : super(key: key);

  @override
  State<AudioPlayerWidget> createState() => _AudioPlayerWidgetState();
}

class _AudioPlayerWidgetState extends State<AudioPlayerWidget> {
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

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return '$minutes:$seconds';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            // Main content
            Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Loading indicator
                    if (!_isInitialized && !_hasError)
                      CircularProgressIndicator(
                        color: Colors.black,
                      ),

                    // Error message
                    if (_hasError)
                      Column(
                        children: [
                          Icon(
                            Icons.error_outline,
                            size: 48,
                            color: Colors.red,
                          ),
                          SizedBox(height: 16),
                          Text(
                            'Failed to load audio',
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),

                    // Audio player with waveform
                    if (_isInitialized && !_hasError)
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                        decoration: BoxDecoration(
                          color: Colors.grey[100],
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Row(
                          children: [
                            // Play/Pause button
                            GestureDetector(
                              onTap: _togglePlayPause,
                              child: Container(
                                width: 48,
                                height: 48,
                                decoration: BoxDecoration(
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
                            
                            SizedBox(width: 16),
                            
                            // Waveform visualization
                            Expanded(
                              child: GestureDetector(
                                onTapDown: (details) {
                                  // Calculate position based on tap
                                  final RenderBox box = context.findRenderObject() as RenderBox;
                                  final localPosition = details.localPosition;
                                  final width = box.size.width - 80; // Subtract button width and padding
                                  final ratio = (localPosition.dx - 80) / width;
                                  final seekPosition = _duration * ratio.clamp(0.0, 1.0);
                                  _seekTo(seekPosition);
                                },
                                child: AudioWaveformVisualizer(
                                  duration: _duration,
                                  position: _position,
                                  isPlaying: _isPlaying,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    
                    // Time display
                    if (_isInitialized && !_hasError)
                      Padding(
                        padding: EdgeInsets.only(top: 16, left: 16, right: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              _formatDuration(_position),
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              _formatDuration(_duration),
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            ),

            // Close button
            Positioned(
              top: 16,
              right: 16,
              child: GestureDetector(
                onTap: () => Navigator.of(context).pop(),
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.close,
                    color: Colors.black87,
                    size: 24,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Waveform visualizer widget
class AudioWaveformVisualizer extends StatelessWidget {
  final Duration duration;
  final Duration position;
  final bool isPlaying;
  
  const AudioWaveformVisualizer({
    Key? key,
    required this.duration,
    required this.position,
    required this.isPlaying,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final progress = duration.inMilliseconds > 0 
        ? position.inMilliseconds / duration.inMilliseconds 
        : 0.0;
    
    return CustomPaint(
      painter: WaveformPainter(
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
class WaveformPainter extends CustomPainter {
  final double progress;
  final bool isPlaying;
  
  WaveformPainter({
    required this.progress,
    required this.isPlaying,
  });

  @override
  void paint(Canvas canvas, Size size) {
    const barCount = 50;
    final barWidth = 3.0;
    final spacing = (size.width - (barCount * barWidth)) / (barCount - 1);
    
    // Generate random heights for waveform (in real app, this would come from audio data)
    final heights = List.generate(barCount, (index) {
      // Create a wave pattern
      final baseHeight = size.height * 0.3;
      final variation = size.height * 0.4 * 
          ((index % 7 == 0) ? 1.0 : 
           (index % 5 == 0) ? 0.8 : 
           (index % 3 == 0) ? 0.6 : 
           (index % 2 == 0) ? 0.4 : 0.5);
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
  bool shouldRepaint(WaveformPainter oldDelegate) {
    return oldDelegate.progress != progress || oldDelegate.isPlaying != isPlaying;
  }
}

