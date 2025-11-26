import 'package:flutter/material.dart';
import 'package:jt291_flutter_mobile/features/social_feed/widgets/layout/feed_screen/report_bottom_sheet.dart';

class PostOptionsBottomSheet extends StatelessWidget {
  final String postId;
  final String authorId;
  final String authorName;

  const PostOptionsBottomSheet({
    super.key,
    required this.postId,
    required this.authorId,
    required this.authorName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Drag handle
            Container(
              margin: EdgeInsets.only(top: 12),
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            SizedBox(height: 20),

            // Block users option
            _buildOption(
              context,
              icon: Icons.block,
              title: 'Block users',
              onTap: () {
                Navigator.pop(context);
                _showBlockConfirmation(context);
              },
            ),

            Divider(height: 1, color: Colors.grey[200]),

            // Report option
            _buildOption(
              context,
              icon: Icons.report_outlined,
              title: 'Report',
              onTap: () {
                Navigator.pop(context);
                _showReportBottomSheet(context);
              },
            ),

            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildOption(
    BuildContext context, {
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.grey[100],
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                size: 20,
                color: Colors.black87,
              ),
            ),
            SizedBox(width: 16),
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showBlockConfirmation(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        title: Text(
          'Block $authorName? ',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        content: Text(
          'You won\'t see posts from this user anymore.',
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey[700],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              'Cancel',
              style: TextStyle(color: Colors.grey[600]),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              // TODO: Implement block user logic
              // Example: ref.read(socialFeedControllerProvider.notifier).blockUser(authorId);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('User blocked successfully'),
                  backgroundColor: Colors.green,
                ),
              );
            },
            child: Text(
              'Block',
              style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showReportBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => ReportBottomSheet(postId: postId),
    );
  }
}