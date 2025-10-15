import 'package:flutter/material.dart';

class ProfileStats extends StatelessWidget {
  final String profileImageUrl;
  final int followingCount;
  final int followersCount;
  final int viewsCount;
  final int newViewsCount;

  const ProfileStats({
    super.key,
    this.profileImageUrl = 'https://i.pravatar.cc/300',
    this.followingCount = 360,
    this.followersCount = 160000,
    this.viewsCount = 0,
    this.newViewsCount = 12,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          _buildProfileImage(),
          const SizedBox(width: 20),
          _buildStatsSection(),
        ],
      ),
    );
  }

  Widget _buildProfileImage() {
    return Container(
      width: 90,
      height: 90,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          colors: [
            Colors.blue.shade400,
            Colors.purple.shade400,
          ],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: CircleAvatar(
          backgroundImage: NetworkImage(profileImageUrl),
        ),
      ),
    );
  }

  Widget _buildStatsSection() {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildStatItem(
            value: _formatCount(followingCount),
            label: 'Following',
          ),
          _buildStatItem(
            value: _formatCount(followersCount),
            label: 'Followers',
          ),
          _buildViewsStatItem(),
        ],
      ),
    );
  }

  Widget _buildStatItem({
    required String value,
    required String label,
    String emoji = '',
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (value.isNotEmpty)
              Text(
                value,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            if (emoji.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(left: 4.0),
                child: Text(
                  emoji,
                  style: const TextStyle(fontSize: 20),
                ),
              ),
          ],
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 13,
            color: Colors.grey.shade600,
          ),
        ),
      ],
    );
  }

  Widget _buildViewsStatItem() {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        _buildStatItem(
          value: '',
          label: 'Views',
          emoji: '👁️',
        ),
        if (newViewsCount > 0) _buildNewViewsBadge(),
      ],
    );
  }

  Widget _buildNewViewsBadge() {
    return Positioned(
      right: -5,
      top: -5,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
        constraints: const BoxConstraints(minWidth: 20),
        decoration: const BoxDecoration(
          color: Colors.red,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Text(
          newViewsCount > 99 ? '99+' : newViewsCount.toString(),
          style: const TextStyle(
            color: Colors.white,
            fontSize: 10,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  String _formatCount(int count) {
    if (count < 1000) return count.toString();
    if (count < 1000000) return '${(count / 1000).toStringAsFixed(0)}k';
    return '${(count / 1000000).toStringAsFixed(1)}M';
  }
}