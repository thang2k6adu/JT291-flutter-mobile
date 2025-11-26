import 'package:flutter/material.dart';
import 'package:jt291_flutter_mobile/core/theme/app_colors.dart';
import 'dart:async';

class AudioRecorderBottomSheet extends StatefulWidget {
  const AudioRecorderBottomSheet({super.key});

  @override
  State<AudioRecorderBottomSheet> createState() =>
      _AudioRecorderBottomSheetState();
}

class _AudioRecorderBottomSheetState extends State<AudioRecorderBottomSheet>
    with TickerProviderStateMixin {
  bool _isRecording = false;
  Duration _recordingDuration = Duration.zero;
  Timer? _timer;
  final TextEditingController _textController = TextEditingController();
  late AnimationController _dotsAnimationController;
  late List<AnimationController> _dotControllers;

  @override
  void initState() {
    super.initState();
    // Animation cho loading dots
    _dotsAnimationController = AnimationController(
      duration: Duration(milliseconds: 1200),
      vsync: this,
    )..repeat();
    
    // Tạo animation controllers cho từng dot
    _dotControllers = List.generate(5, (index) {
      return AnimationController(
        duration: Duration(milliseconds: 600),
        vsync: this,
      );
    });
    
    // Bắt đầu animation cho các dots
    _startDotsAnimation();
  }

  void _startDotsAnimation() {
    for (int i = 0; i < _dotControllers.length; i++) {
      Future.delayed(Duration(milliseconds: i * 100), () {
        if (mounted) {
          _dotControllers[i].repeat(reverse: true);
        }
      });
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    _textController.dispose();
    _dotsAnimationController.dispose();
    for (var controller in _dotControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void _startRecording() {
    setState(() {
      _isRecording = true;
      _recordingDuration = Duration.zero;
    });

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (mounted) {
        setState(() {
          _recordingDuration = Duration(seconds: _recordingDuration.inSeconds + 1);
        });
      }
    });

    // TODO: Implement actual audio recording logic
    // Example: _audioRecorder.startRecording();
  }

  void _stopRecording() {
    _timer?.cancel();

    // TODO: Save audio file and return path
    // Example: final audioPath = await _audioRecorder.stopRecording();
    
    Navigator.pop(context, {
      'duration': _recordingDuration,
      'filePath': 'path/to/audio/file.m4a', // Replace with actual path
      'note': _textController.text,
    });
  }

  void _cancelRecording() {
    _timer?.cancel();

    // TODO: Cancel and delete recording
    // Example: _audioRecorder.cancelRecording();
    
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.9,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          // Header với nút Hủy
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Colors.grey.shade200, width: 1),
              ),
            ),
            child: Row(
              children: [
                TextButton(
                  onPressed: _cancelRecording,
                  child: Text(
                    'Hủy',
                    style: TextStyle(
                      color: Colors.grey.shade800,
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Content
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  // Text input fiel
                  
                  SizedBox(height: 40),

                  // Loading dots (gray dots) - hiển thị khi đang record hoặc chưa record
                  Expanded(
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(5, (index) {
                          return AnimatedBuilder(
                            animation: _dotControllers[index],
                            builder: (context, child) {
                              return Container(
                                margin: EdgeInsets.symmetric(horizontal: 4),
                                width: 8,
                                height: 8,
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade400.withOpacity(
                                    0.3 + (_dotControllers[index].value * 0.7),
                                  ),
                                  shape: BoxShape.circle,
                                ),
                              );
                            },
                          );
                        }),
                      ),
                    ),
                  ),

                  SizedBox(height: 40),

                  // Red circular button ở bottom
                  GestureDetector(
                    onTap: _isRecording ? _stopRecording : _startRecording,
                    child: Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        shape: BoxShape.circle,

                      ),
                      child: Center(
                        child: Icon(
                          _isRecording ? Icons.stop : Icons.mic,
                          color: Colors.white,
                          size: 40,
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 40),
                ],
              ),
            ),
          ),

          // Bottom indicator bar
          Container(
            padding: EdgeInsets.all(16),
            child: Container(
              width: 134,
              height: 5,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(100),
              ),
            ),
          ),
        ],
      ),
    );
  }
}