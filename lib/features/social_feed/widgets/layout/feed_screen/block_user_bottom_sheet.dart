import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jt291_flutter_mobile/components/ui/avatar.dart';
import 'package:jt291_flutter_mobile/core/constants/app_images.dart';
import 'package:jt291_flutter_mobile/features/social_feed/controllers/social_feed_controller.dart';

class BlockUserBottomSheet extends ConsumerStatefulWidget {
  final String authorId;
  final String authorName;
  final String? authorAvatar;

  const BlockUserBottomSheet({
    super.key,
    required this.authorId,
    required this.authorName,
    this.authorAvatar,
  });

  @override
  ConsumerState<BlockUserBottomSheet> createState() => _BlockUserBottomSheetState();
}

class _BlockUserBottomSheetState extends ConsumerState<BlockUserBottomSheet> {
  bool _isBlocking = false;

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
            // Close button
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: Icon(Icons.close, size: 24),
                padding: EdgeInsets.all(16),
              ),
            ),

            // Avatar
            Container(
              width: 100,
              height: 100,
              margin: const EdgeInsets.only(top: 8),
              child: AvatarWidget(
                image: widget.authorAvatar != null && widget.authorAvatar!.isNotEmpty
                    ? NetworkImage(widget.authorAvatar!)
                    : AssetImage(AppImages.defaultAvatar) as ImageProvider,
                size: 100,
              ),
            ),

            SizedBox(height: 24),

            // Title
            Text(
              'Block ${widget.authorName}',
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),

            SizedBox(height: 16),

            // Description
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 32),
              child: Text(
                'The action also blocks any other accounts they may currently own or will create in the future.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.grey[600],
                  height: 1.5,
                ),
              ),
            ),

            SizedBox(height: 32),

            // Block button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  onPressed: _isBlocking ? null : () => _handleBlockUser(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFE56C8C),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(26),
                    ),
                    elevation: 0,
                  ),
                  child: _isBlocking
                      ? const SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                          ),
                        )
                      : const Text(
                          'Block',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                ),
              ),
            ),

            SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Future<void> _handleBlockUser(BuildContext context) async {
    if (_isBlocking) return;

    setState(() {
      _isBlocking = true;
    });

    try {
      final controller = ref.read(socialFeedControllerProvider.notifier);
      final success = await controller.blockUser(widget.authorId, context);

      if (success && mounted) {
        Navigator.pop(context);
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to block user: ${e.toString()}'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isBlocking = false;
        });
      }
    }
  }
}