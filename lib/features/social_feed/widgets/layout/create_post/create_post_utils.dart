import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Custom TextInputFormatter to handle backspace for deleting hashtags
class HashtagBackspaceFormatter extends TextInputFormatter {
  final Function()? onBackspaceAtStart;

  HashtagBackspaceFormatter(this.onBackspaceAtStart);

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    // Detect backspace: text length decreased and cursor is at start
    // This happens when user presses backspace at the beginning of text field
    if (newValue.text.length < oldValue.text.length &&
        newValue.selection.start == 0 &&
        newValue.selection.end == 0 &&
        onBackspaceAtStart != null) {
      // Trigger callback to delete last hashtag
      WidgetsBinding.instance.addPostFrameCallback((_) {
        onBackspaceAtStart?.call();
      });
    }
    return newValue;
  }
}

// Media button widget
class MediaButton extends StatelessWidget {
  final String icon;
  final VoidCallback onTap;

  const MediaButton({
    super.key,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Image.asset(
        icon,
        width: 22,
        height: 22,
        color: Colors.grey.shade600,
      ),
    );
  }
}

