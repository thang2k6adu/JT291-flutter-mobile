import 'package:flutter/material.dart';
import 'package:jt291_flutter_mobile/core/constants/app_icons.dart';
import 'package:jt291_flutter_mobile/components/ui/circle_icon_widget.dart';

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

class HotTopicsSection extends StatelessWidget {
  const HotTopicsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final topics = [
      HotTopicData(
        title: '#Sayhi2025',
        postCount: '120k bài viết',
        imageUrl: 'https://inkythuatso.com/uploads/thumbnails/800/2022/05/hinh-anh-meo-bua-buon-cuoi-nhat-12-09-57-09.jpg', // Thay bằng URL ảnh thật
      ),
      HotTopicData(
        title: '#Giaoluamnhac',
        postCount: '120k bài viết',
        imageUrl: 'https://inkythuatso.com/uploads/thumbnails/800/2022/05/hinh-anh-meo-bua-buon-cuoi-nhat-12-09-57-09.jpg',
      ),
      HotTopicData(
        title: '#Podcastdem',
        postCount: '120k bài viết',
        imageUrl: 'https://inkythuatso.com/uploads/thumbnails/800/2022/05/hinh-anh-meo-bua-buon-cuoi-nhat-12-09-57-09.jpg',
      ),
      HotTopicData(
        title: '#Trainghiem',
        postCount: '120k bài viết',
        imageUrl: 'https://inkythuatso.com/uploads/thumbnails/800/2022/05/hinh-anh-meo-bua-buon-cuoi-nhat-12-09-57-09.jpg',
      ),
    ];

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
                return HotTopicCard(data: topics[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class HotTopicData {
  final String title;
  final String postCount;
  final String imageUrl;

  HotTopicData({
    required this.title,
    required this.postCount,
    required this.imageUrl,
  });
}

class HotTopicCard extends StatelessWidget {
  const HotTopicCard({super.key, required this.data});
  final HotTopicData data;

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
              child: Image.network(
                data.imageUrl,
                width: 50,
                height: 50,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    width: 36,
                    height: 36,
                    color: Colors.grey.shade300,
                    child: Icon(Icons.image, color: Colors.grey.shade600),
                  );
                },
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    data.title,
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
                    data.postCount,
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