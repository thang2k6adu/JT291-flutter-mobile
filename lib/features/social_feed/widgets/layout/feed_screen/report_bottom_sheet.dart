import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jt291_flutter_mobile/features/social_feed/providers/providers.dart';

class ReportBottomSheet extends ConsumerStatefulWidget {
  final String postId;

  const ReportBottomSheet({
    super.key,
    required this.postId,
  });

  @override
  ConsumerState<ReportBottomSheet> createState() => _ReportBottomSheetState();
}

class _ReportBottomSheetState extends ConsumerState<ReportBottomSheet> {
  String? _selectedReason;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size. height * 0.6,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
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

          // Header
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Text(
              'Report',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
          ),

          Divider(height: 1, color: Colors.grey[200]),

          // Report options
          Expanded(
            child: _buildReportReasonsList(),
          ),
        ],
      ),
    );
  }

  Widget _buildReportReasonsList() {
    final reportReasonsAsync = ref.watch(reportReasonsProvider);

    return reportReasonsAsync.when(
      data: (reasons) {
        if (reasons.isEmpty) {
          return const Center(
            child: Text('No report reasons available'),
          );
        }

        return ListView.separated(
          padding: EdgeInsets.zero,
          itemCount: reasons.length,
          separatorBuilder: (context, index) => Divider(
            height: 1,
            color: Colors.grey[200],
            indent: 24,
            endIndent: 24,
          ),
          itemBuilder: (context, index) {
            final reason = reasons[index];
            final isSelected = _selectedReason == reason.id.toString();

            return InkWell(
              onTap: () {
                setState(() {
                  _selectedReason = reason.id.toString();
                });
                _submitReport(context, reason.id, reason.label);
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        reason.label,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: isSelected ? FontWeight.w500 : FontWeight.w400,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                    if (isSelected)
                      const Icon(
                        Icons.check_circle,
                        color: Color(0xFFE56C8C),
                        size: 22,
                      ),
                  ],
                ),
              ),
            );
          },
        );
      },
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
      error: (error, stack) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, size: 48, color: Colors.grey),
            const SizedBox(height: 16),
            Text(
              'Failed to load report reasons',
              style: TextStyle(color: Colors.grey[600]),
            ),
            const SizedBox(height: 8),
            TextButton(
              onPressed: () {
                ref.invalidate(reportReasonsProvider);
              },
              child: const Text('Retry'),
            ),
          ],
        ),
      ),
    );
  }

  void _submitReport(BuildContext context, int reasonId, String reasonLabel) {
    // TODO: Implement report submission logic
    // Example: ref.read(socialFeedControllerProvider.notifier).reportPost(widget.postId, reasonId);
    
    Future.delayed(const Duration(milliseconds: 300), () {
      if (mounted) {
        Navigator.pop(context);
        _showThankYouBottomSheet(context);
      }
    });
  }

  void _showThankYouBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      isDismissible: true,
      builder: (context) => _ThankYouBottomSheet(),
    );
  }
}

class _ThankYouBottomSheet extends StatelessWidget {
  const _ThankYouBottomSheet();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24),
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
              margin: EdgeInsets.only(bottom: 24),
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(2),
              ),
            ),

            // Success icon
            Container(
              width: 64,
              height: 64,
              decoration: BoxDecoration(
                color: Color(0xFF4CAF50).withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.check,
                size: 36,
                color: Color(0xFF4CAF50),
              ),
            ),

            SizedBox(height: 24),

            // Thank you text
            Text(
              'Thank you!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),

            SizedBox(height: 12),

            // Description
            Text(
              'The post has been reported. We will review and\nhandle it according to regulations.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15,
                color: Colors.grey[600],
                height: 1.5,
              ),
            ),

            SizedBox(height: 32),

            // Close button
            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton(
                onPressed: () => Navigator.pop(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFE56C8C),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(26),
                  ),
                  elevation: 0,
                ),
                child: Text(
                  'Xong',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors. white,
                  ),
                ),
              ),
            ),

            SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}