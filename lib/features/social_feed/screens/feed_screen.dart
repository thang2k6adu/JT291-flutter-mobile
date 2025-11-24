import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:jt291_flutter_mobile/components/ui/avatar.dart';
import 'package:jt291_flutter_mobile/components/ui/svg-icon.dart';
import 'package:jt291_flutter_mobile/features/social_feed/widgets/layout/feed_screen/feed_app_bar.dart';
import 'package:jt291_flutter_mobile/core/constants/app_icons.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({super.key});

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  bool _isCommunity = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(_onTabChanged);
  }

  void _onTabChanged() {
    setState(() {
      _isCommunity = _tabController.index == 1;
    });
  }

  @override
  void dispose() {
    _tabController.removeListener(_onTabChanged);
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: FeedAppBar(
        isCommunity: _isCommunity,
        controller: _tabController,
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          FeedList(),
          FeedList(),
          FeedList(),
        ],
      ),
    );
  }
}

class FeedList extends StatelessWidget {
  const FeedList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        PostCard(
          userName: 'Craig Curtis',
          timeAgo: '4 giờ',
          description:
              'When it comes to home decor, the first step is choosing a color scheme that complements your furniture and accessories.',
          images: [
            'https://inkythuatso.com/uploads/thumbnails/800/2022/05/hinh-anh-meo-bua-buon-cuoi-nhat-12-09-57-09.jpg',
            'https://inkythuatso.com/uploads/thumbnails/800/2022/05/hinh-anh-meo-bua-buon-cuoi-nhat-12-09-57-09.jpg',
            'https://inkythuatso.com/uploads/thumbnails/800/2022/05/hinh-anh-meo-bua-buon-cuoi-nhat-12-09-57-09.jpg',
          ],
          likes: 0,
          comments: 13,
        ),
        PostCard(
          userName: 'Haylie Press',
          timeAgo: '5 giờ',
          description:
              'Use light-colored or sheer curtains to let in more sunlight, making your space feel brighter and more open.',
          images: [
            'https://inkythuatso.com/uploads/thumbnails/800/2022/05/hinh-anh-meo-bua-buon-cuoi-nhat-12-09-57-09.jpg',
            'https://inkythuatso.com/uploads/thumbnails/800/2022/05/hinh-anh-meo-bua-buon-cuoi-nhat-12-09-57-09.jpg',
          ],
          likes: 0,
          comments: 0,
          hasAttachment: true,
        ),
      ],
    );
  }
}

class PostCard extends StatefulWidget {
  final String userName;
  final String timeAgo;
  final String description;
  final List<String> images;
  final int likes;
  final int comments;
  final bool hasAttachment;

  const PostCard({
    Key? key,
    required this.userName,
    required this.timeAgo,
    required this.description,
    required this.images,
    this.likes = 0,
    this.comments = 0,
    this.hasAttachment = false,
  }) : super(key: key);

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  bool isLiked = false;
  int _currentImageIndex = 0;
  final CarouselSliderController _carouselController = CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(bottom: BorderSide(color: Colors.grey[200]!, width: 8)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // Header
          Padding(
            padding: EdgeInsets.all(16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AvatarWidget(
                  image: NetworkImage(
                    'https://inkythuatso.com/uploads/thumbnails/800/2022/05/hinh-anh-meo-bua-buon-cuoi-nhat-12-09-57-09.jpg',
                  ),
                  size: 44,
                ),
                SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            widget.userName,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(width: 8),
                          Text(
                            widget.timeAgo,
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 4),
                      Text(
                        widget.description,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[950],
                          height: 1.4,
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(Icons.more_horiz, color: Colors.grey),
              ],
            ),
          ),

          // Images Carousel
          _buildImagesCarousel(),


          // Action buttons
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              children: [
                SizedBox(width: 16),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isLiked = !isLiked;
                    });
                  },
                  child: Row(
                    children: [
                      SvgIconSimple.asset(
                        AppIcons.heartSvg,
                        size: 24,
                        color: isLiked ? Colors.red : null,
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 12),
                Row(
                  children: [
                    SvgIconSimple.asset(
                      AppIcons.messageSvg,
                      size: 24,
                    ),
                    if (widget.comments > 0) ...[
                      SizedBox(width: 2),
                      Text(
                        '${widget.comments}',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ],
                ),
                SizedBox(width: 12),
                SvgIconSimple.asset(
                  AppIcons.sendMessageLineSvg,
                  size: 24,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImagesCarousel() {
    return Stack(
      children: [
        CarouselSlider.builder(
          carouselController: _carouselController,
          itemCount: widget.images.length,
          options: CarouselOptions(
            height: 300,
            viewportFraction: 0.6,
            enlargeCenterPage: false,
            enableInfiniteScroll: false,
            enlargeFactor: 0.15,
            autoPlay: false,
            onPageChanged: (index, reason) {
              setState(() {
                _currentImageIndex = index;
              });
            },
          ),
          itemBuilder: (context, index, realIndex) {
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 4),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.network(
                      widget.images[index],
                      fit: BoxFit.cover,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return Container(
                          color: Colors.grey[200],
                          child: Center(
                            child: CircularProgressIndicator(
                              value: loadingProgress.expectedTotalBytes != null
                                  ? loadingProgress.cumulativeBytesLoaded /
                                      loadingProgress.expectedTotalBytes!
                                  : null,
                              color: Color(0xFFFF69B4),
                              strokeWidth: 2,
                            ),
                          ),
                        );
                      },
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: Colors.grey[300],
                          child: Center(
                            child: Icon(
                              Icons.broken_image,
                              size: 50,
                              color: Colors.grey[600],
                            ),
                          ),
                        );
                      },
                    ),
                    // Attachment button
                  
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}