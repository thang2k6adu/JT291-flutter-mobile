import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:jt291_flutter_mobile/core/constants/route_constants.dart';
import 'package:jt291_flutter_mobile/core/theme/app_colors.dart';
import 'package:jt291_flutter_mobile/data/providers/social/social_feed_provider.dart';

class CreatePostBottomSection extends ConsumerWidget {
  final bool isPublic;
  final Function(bool) onPrivacyChanged;
  final Function(String) onHashtagAdded;

  const CreatePostBottomSection({
    super.key,
    required this.isPublic,
    required this.onPrivacyChanged,
    required this.onHashtagAdded,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hotTopicsAsync = ref.watch(hotTopicsProvider);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: Colors.grey.shade200, width: 1),
        ),
      ),
      child: Column(
        children: [
          // Hot topics
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                _buildTopicChip(
                  context,
                  '# Thêm chủ đề',
                  isPrimary: true,
                  onTap: () async {
                    final result = await GoRouter.of(context).push(RouteConstants.addHastag);
                    if (result != null && result is String) {
                      final hashtag = result.startsWith('#') ? result : '#$result';
                      onHashtagAdded(hashtag);
                    }
                  },
                ),
                const SizedBox(width: 8),
                // Hiển thị hot topics từ API
                hotTopicsAsync.when(
                  data: (topics) {
                    return Row(
                      children: topics.take(5).map((topic) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: _buildTopicChip(
                            context,
                            topic.hashtag.startsWith('#') ? topic.hashtag : '#${topic.hashtag}',
                            onTap: () {
                              onHashtagAdded(topic.hashtag.startsWith('#') 
                                  ? topic.hashtag 
                                  : '#${topic.hashtag}');
                            },
                          ),
                        );
                      }).toList(),
                    );
                  },
                  loading: () => const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  ),
                  error: (error, stack) => const SizedBox.shrink(),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),

          // Privacy setting
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                isPublic
                    ? 'Anyone can view your post.'
                    : 'Only you can view this post.',
                style: TextStyle(
                  color: Colors.grey.shade600,
                  fontSize: 14,
                ),
              ),
              Builder(
                builder: (context) => InkWell(
                  onTap: () => _showPrivacyMenu(context),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          isPublic ? Icons.public : Icons.lock,
                          size: 18,
                          color: Colors.grey.shade700,
                        ),
                        const SizedBox(width: 6),
                        Text(
                          isPublic ? 'Public' : 'Only me',
                          style: TextStyle(
                            color: Colors.grey.shade700,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(width: 4),
                        Icon(
                          Icons.arrow_drop_down,
                          size: 20,
                          color: Colors.grey.shade700,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _showPrivacyMenu(BuildContext context) {
    final RenderBox button = context.findRenderObject() as RenderBox;
    final RenderBox overlay =
        Navigator.of(context).overlay!.context.findRenderObject() as RenderBox;
    final RelativeRect position = RelativeRect.fromRect(
      Rect.fromPoints(
        button.localToGlobal(Offset.zero, ancestor: overlay),
        button.localToGlobal(button.size.bottomRight(Offset.zero), ancestor: overlay),
      ),
      Offset.zero & overlay.size,
    );

    showMenu<bool>(
      context: context,
      position: position,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      items: [
        PopupMenuItem<bool>(
          value: true,
          child: Row(
            children: [
              Icon(
                Icons.public,
                size: 20,
                color: isPublic ? AppColors.primary : Colors.grey.shade700,
              ),
              const SizedBox(width: 12),
              Text(
                'Public',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: isPublic ? FontWeight.w600 : FontWeight.w400,
                  color: isPublic ? AppColors.primary : Colors.black87,
                ),
              ),
              if (isPublic) ...[
                const Spacer(),
                const Icon(
                  Icons.check,
                  size: 20,
                  color: AppColors.primary,
                ),
              ],
            ],
          ),
        ),
        PopupMenuItem<bool>(
          value: false,
          child: Row(
            children: [
              Icon(
                Icons.lock,
                size: 20,
                color: !isPublic ? AppColors.primary : Colors.grey.shade700,
              ),
              const SizedBox(width: 12),
              Text(
                'Only me',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: !isPublic ? FontWeight.w600 : FontWeight.w400,
                  color: !isPublic ? AppColors.primary : Colors.black87,
                ),
              ),
              if (!isPublic) ...[
                const Spacer(),
                const Icon(
                  Icons.check,
                  size: 20,
                  color: AppColors.primary,
                ),
              ],
            ],
          ),
        ),
      ],
    ).then((value) {
      if (value != null) {
        onPrivacyChanged(value);
      }
    });
  }

  Widget _buildTopicChip(
    BuildContext context,
    String label, {
    bool isPrimary = false,
    Function()? onTap,
  }) {
    return GestureDetector(
      onTap: onTap ?? () {},
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isPrimary ? const Color(0xFFFFE4E9) : Colors.grey.shade100,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Text(
              label,
              style: TextStyle(
                color: isPrimary ? const Color(0xFFE56C8C) : Colors.grey.shade700,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            if (isPrimary) ...[
              const SizedBox(width: 4),
              const Icon(
                Icons.arrow_forward_ios,
                size: 8,
                color: AppColors.primary,
              ),
            ],
          ],
        ),
      ),
    );
  }
}

