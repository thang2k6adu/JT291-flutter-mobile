import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jt291_flutter_mobile/components/ui/circle_icon_widget.dart';
import 'package:jt291_flutter_mobile/core/constants/app_icons.dart';
import 'package:jt291_flutter_mobile/features/social_feed/providers/providers.dart';

class FeedAppBar extends StatelessWidget implements PreferredSizeWidget {
  const FeedAppBar({super.key, this.isCommunity = false, required this.controller});
  final bool isCommunity;
  final TabController controller;

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight + (isCommunity ? 120 : 0));

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 4,
      backgroundColor: Colors.transparent,
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFFDA4AF).withValues(alpha: 0.95),
              Color.fromRGBO(255, 255, 255, 0.1),
            ],
          ),
          border: Border(
            bottom: BorderSide(color: Colors.grey.shade300, width: 1),
          ),
        ),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: TabBar(
              controller: controller,
              isScrollable: true,
              tabAlignment: TabAlignment.start,
              splashFactory: NoSplash.splashFactory,
              overlayColor: WidgetStateProperty.all(Colors.transparent),
              dividerHeight: 0,
              indicatorColor: Colors.black,
              labelColor: Colors.black,
              unselectedLabelColor: Colors.black54,
              labelStyle: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
              unselectedLabelStyle: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 17,
              ),
              indicator: const UnderlineTabIndicator(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(10),
                  bottom: Radius.circular(10),
                ),
                borderSide: BorderSide(color: Colors.black, width: 4),
                insets: EdgeInsets.symmetric(horizontal: 16),
              ),
              tabs: const [
                Tab(text: 'Friends'),
                Tab(text: 'Community'),
                Tab(text: 'Latest'),
              ],
            ),
          ),
          Row(
            children: [
              CircleIconWidget(
                iconUrl: AppIcons.feedNotifications,
                size: 32,
                iconSize: 20,
                backgroundColor: Colors.white,
                iconColor: Colors.black,
              ),
              SizedBox(width: 15),
              CircleIconWidget(
                iconUrl: AppIcons.feedSearch,
                size: 32,
                iconSize: 20,
                backgroundColor: Colors.white,
                iconColor: Colors.black,
              ),
            ],
          ),
        ],
      ),

      bottom: isCommunity ? PreferredSize(
        preferredSize: const Size.fromHeight(120),
        child: HotTopicsSection(),
      ) : null,
    );
  }
}

class HotTopicsSection extends ConsumerWidget {
  const HotTopicsSection({super.key});

  String _formatPostCount(int count) {
    if (count >= 1000000) {
      return '${(count / 1000000).toStringAsFixed(1)}M bài viết';
    } else if (count >= 1000) {
      return '${(count / 1000).toStringAsFixed(0)}k bài viết';
    }
    return '$count bài viết';
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hotTopicsAsync = ref.watch(hotTopicsProvider);

    return hotTopicsAsync.when(
      data: (topics) {
        if (topics.isEmpty) {
          return SizedBox(height: 120);
        }

        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Text(
                    '🔥',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(width: 4),
                  Text(
                    'Hot Topic',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 6),
              SizedBox(
                height: 70,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: topics.length,
                  separatorBuilder: (context, index) => SizedBox(width: 12),
                  itemBuilder: (context, index) {
                    final topic = topics[index];
                    return HotTopicCard(
                      title: topic.hashtag,
                      postCount: _formatPostCount(topic.postCount),
                      imageUrl: topic.thumbnailUrl ?? '',
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
      loading: () => Container(
        height: 120,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Center(
          child: CircularProgressIndicator(
            color: Color(0xFFFF69B4),
            strokeWidth: 2,
          ),
        ),
      ),
      error: (error, stack) => Container(
        height: 120,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Center(
          child: Text(
            'Failed to load hot topics',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[600],
            ),
          ),
        ),
      ),
    );
  }
}

class HotTopicCard extends StatelessWidget {
  final String title;
  final String postCount;
  final String imageUrl;

  const HotTopicCard({
    super.key,
    required this.title,
    required this.postCount,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Handle topic tap
      },
      borderRadius: BorderRadius.circular(12),
      child: Container(
        width: 160,
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: imageUrl.isNotEmpty
                  ? Image.network(
                      imageUrl,
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          width: 50,
                          height: 50,
                          color: Colors.grey.shade300,
                          child: Icon(Icons.image, color: Colors.grey.shade600, size: 24),
                        );
                      },
                    )
                  : Container(
                      width: 50,
                      height: 50,
                      color: Colors.grey.shade300,
                      child: Icon(Icons.tag, color: Colors.grey.shade600, size: 24),
                    ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 4),
                  Text(
                    postCount,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey.shade600,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}