import 'package:flutter/material.dart';

class UserRelationScreen extends StatefulWidget {
  const UserRelationScreen({Key? key}) : super(key: key);

  @override
  State<UserRelationScreen> createState() => _UserRelationScreenState();
}

class _UserRelationScreenState extends State<UserRelationScreen> {
  int selectedTab = 0;

  final List<UserItem> users = [
    UserItem(
      name: 'Leo Herwitz',
      description: 'Striving for excellence, embra...',
      avatar: 'assets/images/avatar1.png',
      gender: 'female',
    ),
    UserItem(
      name: 'Marley Schleifer',
      description: 'Striving for excellence, embra...',
      avatar: 'assets/images/avatar2.png',
      gender: 'male',
    ),
    UserItem(
      name: 'Marley Schleifer',
      description: 'Striving for excellence, embra...',
      avatar: 'assets/images/avatar3.png',
      gender: 'male',
    ),
    UserItem(
      name: 'Leo Herwitz',
      description: 'Striving for excellence, embra...',
      avatar: 'assets/images/avatar4.png',
      gender: 'female',
    ),
    UserItem(
      name: 'Marley Schleifer',
      description: 'Striving for excellence, embra...',
      avatar: 'assets/images/avatar5.png',
      gender: 'male',
    ),
    UserItem(
      name: 'Leo Herwitz',
      description: 'Striving for excellence, embra...',
      avatar: 'assets/images/avatar6.png',
      gender: 'female',
    ),
    UserItem(
      name: 'Marley Schleifer',
      description: 'Striving for excellence, embra...',
      avatar: 'assets/images/avatar7.png',
      gender: 'male',
    ),
    UserItem(
      name: 'Leo Herwitz',
      description: 'Striving for excellence, embra...',
      avatar: 'assets/images/avatar8.png',
      gender: 'female',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Darlene Bears',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Stats Section
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildStatItem('Following', '360', true),
                const SizedBox(width: 32),
                _buildStatItem('Followers', '160k', false),
                const SizedBox(width: 32),
                _buildStatItem('Friends', '20', false),
              ],
            ),
          ),

          // Search Bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xFFF5F5F5),
                borderRadius: BorderRadius.circular(12),
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search users',
                  hintStyle: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 15,
                  ),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.grey[600],
                    size: 22,
                  ),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(height: 20),

          // Following Label
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Following',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
            ),
          ),

          const SizedBox(height: 12),

          // User List
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              itemCount: users.length,
              itemBuilder: (context, index) {
                return _buildUserItem(users[index]);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatItem(String label, String count, bool isSelected) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedTab = isSelected ? 0 : (label == 'Followers' ? 1 : 2);
        });
      },
      child: Column(
        children: [
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: '$label ',
                  style: TextStyle(
                    color: isSelected ? Colors.black : Colors.grey[600],
                    fontSize: 14,
                    fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                  ),
                ),
                TextSpan(
                  text: count,
                  style: TextStyle(
                    color: isSelected ? Colors.black : Colors.grey[600],
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 4),
          if (isSelected)
            Container(
              height: 2,
              width: 60,
              color: Colors.black,
            ),
        ],
      ),
    );
  }

  Widget _buildUserItem(UserItem user) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          // Avatar
          CircleAvatar(
            radius: 28,
            backgroundImage: AssetImage(user.avatar),
          ),
          const SizedBox(width: 12),

          // Name and Description
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      user.name,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Icon(
                      user.gender == 'female' 
                          ? Icons.female 
                          : Icons.male,
                      size: 16,
                      color: user.gender == 'female' 
                          ? Colors.pink 
                          : Colors.blue,
                    ),
                  ],
                ),
                const SizedBox(height: 2),
                Text(
                  user.description,
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey[600],
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),

          // Following Button
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            decoration: BoxDecoration(
              color: const Color(0xFFF5F5F5),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Text(
              'Following',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class UserItem {
  final String name;
  final String description;
  final String avatar;
  final String gender;

  UserItem({
    required this.name,
    required this.description,
    required this.avatar,
    required this.gender,
  });
}