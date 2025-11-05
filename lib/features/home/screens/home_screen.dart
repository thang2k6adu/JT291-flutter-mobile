import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jt291_flutter_mobile/features/home/widgets/layouts/background_map.dart';
import 'package:jt291_flutter_mobile/features/home/widgets/layouts/top_section.dart';
import 'package:jt291_flutter_mobile/features/home/widgets/layouts/center_character.dart';
import 'package:jt291_flutter_mobile/features/home/widgets/layouts/bottom_action_buttons.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark,
        child: Stack(
          children: const [
            BackgroundMap(),
            TopSection(),
            CenterCharacter(),
            BottomActions(),
          ],
        ),
      ),
    );
  }
}
