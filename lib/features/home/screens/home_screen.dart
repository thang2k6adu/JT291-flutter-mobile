import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jt291_flutter_mobile/features/home/widgets/layouts/background_map.dart';
import 'package:jt291_flutter_mobile/features/home/widgets/layouts/top_section.dart';
import 'package:jt291_flutter_mobile/features/home/widgets/layouts/center_character.dart';
import 'package:jt291_flutter_mobile/features/home/widgets/layouts/bottom_action_buttons.dart';
import 'package:jt291_flutter_mobile/components/helper/router_helper.dart';
import 'package:jt291_flutter_mobile/core/constants/route_constants.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void _onAvatarTap(BuildContext context) {
    pushScreen(context, RouteConstants.userMe);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark,
        child: Stack(
          children: [
            BackgroundMap(),
            TopSection(onAvatarTap: () => _onAvatarTap(context)),
            CenterCharacter(),
            BottomActions(),
          ],
        ),
      ),
    );
  }
}
