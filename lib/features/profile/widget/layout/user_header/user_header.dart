import 'package:flutter/material.dart';
import 'package:jt291_flutter_mobile/features/profile/widget/layout/user_header/stats_section/stats_section.dart';

class UserHeader extends StatelessWidget {
  const UserHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        UserHeaderSection(),
      ],
    );
  }
}