import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:jt291_flutter_mobile/data/models/users/viewer_model.dart';

class ProfileViewItem extends StatelessWidget {
  final ViewerModel view;

  const ProfileViewItem({super.key, required this.view});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      child: Row(
        children: [
          CircleAvatar(
            radius: 28,
            backgroundImage: AssetImage(view.avatarUrl),
            backgroundColor: Colors.grey[300],
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      view.username,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Icon(
                      view.gender == 'female' ? Icons.female : Icons.male,
                      size: 16,
                      color: view.gender == 'female' 
                          ? Colors.pink[300] 
                          : Colors.blue[300],
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  view.shortBio,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          Text(
            timeago.format(view.viewTime, locale: 'vi'),
            style: TextStyle(
              fontSize: 13,
              color: Colors.grey[500],
            ),
          ),
        ],
      ),
    );
  }
}
