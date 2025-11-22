import 'package:flutter/material.dart';
import 'package:jt291_flutter_mobile/components/layout/appbar_with_back.dart';

class GiftScreen extends StatelessWidget {
  const GiftScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWithBack(
        title: 'Gifts',
      ),
      body: Center(
        child: Text('Gifts'),
      ),
    );
  }
}