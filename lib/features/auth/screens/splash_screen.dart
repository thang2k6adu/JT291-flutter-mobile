import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jt291_flutter_mobile/assets/assets.dart';
import 'package:jt291_flutter_mobile/components/helper/router_helper.dart';
import 'package:jt291_flutter_mobile/core/core.dart';
import 'package:jt291_flutter_mobile/data/providers/auth/auth_provider.dart';

class SplashScreen extends ConsumerStatefulWidget {
  final String? title;
  const SplashScreen({super.key, this.title = 'Welcome to back'});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(userAuthProvider).asData?.value;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    alignment: Alignment.center,
                    image: AssetImage(ImagePaths.getPath(ImagePath.splash)),
                    fit: BoxFit.contain,
                    opacity: 1,
                  ),
                ),
                width: MediaQuery.of(context).size.width,
                child: Stack(
                  children: [
                    Positioned(
                      top: MediaQuery.of(context).size.height * 0.14,
                      left: 0,
                      right: 0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              Text(
                                widget.title!,
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              Text(
                                '${user?.partner?.name} Welcome to back',
                                // style: TextStyle(
                                //   // fontFamily: 'Poppins',
                                //   // fontSize: 16,
                                //   fontWeight: FontWeight.w400,
                                //   color: Colors.grey,
                                // ),
                              ),

                              ElevatedButton(
                                onPressed: () =>
                                    goScreen(context, RouteConstants.login),
                                child: Text("Logout"),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 60),
          ],
        ),
      ),
    );
  }
}
