import 'package:flutter/material.dart';
import 'package:jt291_flutter_mobile/components/ui/action_button.dart';

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

class UserItemWidget extends StatelessWidget {
  final UserItem user;
  final VoidCallback? onButtonPressed;
  final String buttonText;
  final Color buttonBackgroundColor;
  final Color buttonTextColor;

  const UserItemWidget({
    super.key,
    required this.user,
    this.onButtonPressed,
    this.buttonText = 'Follow',
    this.buttonBackgroundColor = const Color(0xFFF5F5F5),
    this.buttonTextColor = Colors.black87,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          CircleAvatar(radius: 28, backgroundImage: AssetImage(user.avatar)),
          const SizedBox(width: 12),

          // Info
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
                      user.gender == 'female' ? Icons.female : Icons.male,
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
                  style: TextStyle(fontSize: 13, color: Colors.grey[600]),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),

          // Button
          ActionButton(
            text: buttonText,
            backgroundColor: buttonBackgroundColor,
            textColor: buttonTextColor,
            onPressed: onButtonPressed,
          ),
        ],
      ),
    );
  }
}
