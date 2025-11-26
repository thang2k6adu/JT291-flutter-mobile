import 'package:flutter/material.dart';
import 'package:jt291_flutter_mobile/core/theme/app_colors.dart';

class CreatePostHeader extends StatelessWidget {
  final bool isCreatingPost;
  final String? uploadProgressMessage;
  final VoidCallback onCancel;
  final VoidCallback onCreatePost;

  const CreatePostHeader({
    super.key,
    required this.isCreatingPost,
    this.uploadProgressMessage,
    required this.onCancel,
    required this.onCreatePost,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey.shade200, width: 1),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: onCancel,
                child: Text(
                  'Hủy',
                  style: TextStyle(
                    color: Colors.grey.shade800,
                    fontSize: 17,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              const Text(
                'Create a post',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
              ),
              TextButton(
                onPressed: isCreatingPost ? null : onCreatePost,
                style: TextButton.styleFrom(
                  backgroundColor: isCreatingPost
                      ? Colors.grey.shade300
                      : AppColors.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                  child: isCreatingPost
                      ? const SizedBox(
                          width: 16,
                          height: 16,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                          ),
                        )
                      : const Text(
                          'Post',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                ),
              ),
            ],
          ),
          if (uploadProgressMessage != null) ...[
            const SizedBox(height: 8),
            Row(
              children: [
                const SizedBox(width: 16),
                const SizedBox(
                  width: 12,
                  height: 12,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    valueColor: AlwaysStoppedAnimation<Color>(AppColors.primary),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    uploadProgressMessage!,
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey.shade700,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}
