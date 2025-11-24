import 'package:flutter/material.dart';
import 'package:jt291_flutter_mobile/features/social_feed/widgets/layout/feed_screen/feed_app_bar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: FeedScreen());
  }
}

class FeedScreen extends StatelessWidget {
  const FeedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // 3 tab
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: FeedAppBar(),
        body: TabBarView(
          children: [
            FeedList(), // Friends tab
            FeedList(), // Community tab
            FeedList(), // Latest tab
          ],
        ),
      ),
    );
  }
}

// Feed list widget (dùng lại PostCard)
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
            '[https://via.placeholder.com/300x400](https://via.placeholder.com/300x400)',
            '[https://via.placeholder.com/300x400](https://via.placeholder.com/300x400)',
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
            '[https://via.placeholder.com/300x400](https://via.placeholder.com/300x400)',
            '[https://via.placeholder.com/300x400](https://via.placeholder.com/300x400)',
          ],
          likes: 0,
          comments: 0,
          hasAttachment: true,
        ),
      ],
    );
  }
}

// PostCard giữ nguyên như bạn viết
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

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(bottom: BorderSide(color: Colors.grey[200]!, width: 8)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Padding(
            padding: EdgeInsets.all(16),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 24,
                  backgroundImage: NetworkImage(
                    '[https://via.placeholder.com/100](https://via.placeholder.com/100)',
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.userName,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        widget.timeAgo,
                        style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                      ),
                    ],
                  ),
                ),
                Icon(Icons.more_horiz, color: Colors.grey),
              ],
            ),
          ),

          // Description
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              widget.description,
              style: TextStyle(fontSize: 15, height: 1.4),
            ),
          ),
          SizedBox(height: 12),

          // Images
          Container(
            height: 300,
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 16, right: 4),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        widget.images[0],
                        fit: BoxFit.cover,
                        height: 300,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(right: 16, left: 4),
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.network(
                            widget.images[1],
                            fit: BoxFit.cover,
                            height: 300,
                            width: double.infinity,
                          ),
                        ),
                        if (widget.hasAttachment)
                          Positioned(
                            bottom: 16,
                            right: 16,
                            child: Container(
                              width: 56,
                              height: 56,
                              decoration: BoxDecoration(
                                color: Color(0xFFFF69B4),
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.attach_file,
                                color: Colors.white,
                                size: 28,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 12),

          // Action buttons
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isLiked = !isLiked;
                    });
                  },
                  child: Row(
                    children: [
                      Icon(
                        isLiked ? Icons.favorite : Icons.favorite_border,
                        color: isLiked ? Colors.red : Colors.black,
                        size: 26,
                      ),
                      if (isLiked)
                        Padding(
                          padding: EdgeInsets.only(left: 4, top: 8),
                          child: Text('👍', style: TextStyle(fontSize: 16)),
                        ),
                    ],
                  ),
                ),
                SizedBox(width: 24),
                Row(
                  children: [
                    Icon(Icons.chat_bubble_outline, size: 26),
                    if (widget.comments > 0) ...[
                      SizedBox(width: 6),
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
                SizedBox(width: 24),
                Icon(Icons.send_outlined, size: 26),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
