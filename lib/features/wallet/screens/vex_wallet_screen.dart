import 'package:flutter/material.dart';
import 'package:jt291_flutter_mobile/components/layout/appbar_with_back.dart';

class VexWalletScreen extends StatelessWidget {
  const VexWalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWithBack(
        title: 'Vex Wallet',
      ),
      body: Column(
        children: [
          Text('Vex Wallet'),
        ],
      ),
    );
  }
}