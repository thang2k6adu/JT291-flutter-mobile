import 'package:flutter/material.dart';
import 'package:jt291_flutter_mobile/core/constants/app_icons.dart';
import 'package:jt291_flutter_mobile/components/ui/circle_icon_widget.dart';

class FeedAppBar extends StatelessWidget implements PreferredSizeWidget {
  const FeedAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

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
    );
  }
}
