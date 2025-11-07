import 'package:flutter/material.dart';
import 'package:jt291_flutter_mobile/components/layout/appbar_with_back.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWithBack(title: 'Profile View'),
      body: Center(child: Text('Profile View')),
    );
  }
}
