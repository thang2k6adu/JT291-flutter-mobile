import 'package:flutter/material.dart';
import 'package:jt291_flutter_mobile/components/layout/appbar_with_back.dart';
import 'package:jt291_flutter_mobile/components/ui/save_button.dart';
import 'package:jt291_flutter_mobile/components/ui/vertical_section.dart';
import 'package:jt291_flutter_mobile/features/wallet/widgets/layout/deposit_screen/adress_field.dart';
import 'package:jt291_flutter_mobile/features/wallet/widgets/layout/deposit_screen/network_dropdown.dart';
import 'package:jt291_flutter_mobile/features/wallet/widgets/layout/deposit_screen/qr_section.dart';
import 'package:flutter/services.dart';

class DepositScreen extends StatefulWidget {
  const DepositScreen({super.key});

  @override
  State<DepositScreen> createState() => _DepositScreenState();
}

class _DepositScreenState extends State<DepositScreen> {
  String selectedNetwork = 'Polygon';
  final String depositAddress = '0x7814e...239A0';
  final List<String> networks = ['Polygon', 'Ethereum', 'BSC', 'Arbitrum'];

  void _copyAddress() {
    Clipboard.setData(ClipboardData(text: depositAddress));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Address copied to clipboard'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  void _shareAddress() {
    print('Share address');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarWithBack(
        title: 'Deposit',
        bottomBorder: true,
        actions: [
          IconButton(
            onPressed: _shareAddress,
            icon: const Icon(Icons.share_outlined),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 34),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            VerticalSection(
              spacing: 32,
              child: DepositQrSection(depositAddress: depositAddress),
            ),
            VerticalSection(
              spacing: 24,
              child: NetworkDropdown(
                networks: networks,
                selectedNetwork: selectedNetwork,
                onChanged: (val) => setState(() => selectedNetwork = val!),
              ),
            ),
            DepositAddressField(
              depositAddress: depositAddress,
              onCopy: _copyAddress,
            ),
          ],
        ),
      ),
      bottomNavigationBar: SaveButton(
        isSaving: false,
        onPressed: () => print('Save pressed'),
      ),
    );
  }
}
