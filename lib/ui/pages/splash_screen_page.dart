import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:skined/shared/theme.dart';
import 'package:skined/shared/size_config.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({Key? key}) : super(key: key);

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  late int screen;
  @override
  _getOnboardInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      screen = prefs.getInt('screen') ?? 0;
      print(screen);
    });
  }

  void initState() {
    _getOnboardInfo();
    Future.delayed(const Duration(seconds: 3), () {
      if (screen == 0) {
        Navigator.pushReplacementNamed(context, '/onboarding');
      } else {
        Navigator.pushReplacementNamed(context, '/main');
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: const BoxDecoration(
                gradient: primaryGradient,
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/logo_hand.png',
                    width: getProportionateScreenWidth(170),
                  ),
                  Text(
                    'Skined',
                    style: latoTextStyle.copyWith(
                      fontSize: 90,
                      fontWeight: weightBold,
                      color: whiteColor,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 18),
                    width: MediaQuery.of(context).size.width - 160,
                    height: 3,
                    color: whiteColor,
                  ),
                  Text(
                    'Make your skin healthy',
                    style: latoTextStyle.copyWith(
                      fontWeight: weightNormal,
                      color: whiteColor,
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: const EdgeInsets.only(bottom: 50),
                child: Text(
                  'Final Project Orbit',
                  style: latoTextStyle.copyWith(
                    fontSize: 16,
                    color: whiteColor,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: const EdgeInsets.only(bottom: 50),
                child: Lottie.asset(
                  'assets/loading2.json',
                  height: getProportionateScreenHeight(100),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
