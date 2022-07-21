import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:skined/shared/theme.dart';
import 'package:skined/shared/size_config.dart';
import 'package:skined/ui/widgets/onboarding_body_widget.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final _pageController = PageController();
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  _storeOnboardInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('screen', 1);
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    Widget customOnBoarding4() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: getProportionateScreenHeight(355),
            child: Image.asset(
              'assets/onboarding4.png',
              fit: BoxFit.contain,
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: getProportionateScreenHeight(28),
              left: getProportionateScreenWidth(27),
              right: getProportionateScreenWidth(63),
            ),
            width: getProportionateScreenWidth(285),
            child: Image.asset('assets/onboarding4_title.png'),
          ),
          Container(
            margin: EdgeInsets.only(
                top: getProportionateScreenHeight(29),
                left: getProportionateScreenWidth(47),
                right: getProportionateScreenWidth(63)),
            child: Text(
              'Find out your skin disease easily here',
              style: opensansTextStyle.copyWith(
                height: 0.89,
                fontWeight: weightBold,
                fontSize: 20,
                color: whiteColor,
              ),
            ),
          )
        ],
      );
    }

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
      child: Scaffold(
        backgroundColor: Colors.amber,
        body: Container(
          decoration: const BoxDecoration(
            gradient: primaryGradient,
          ),
          child: PageView(
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            controller: _pageController,
            children: [
              OnBoardingBodyWidget(
                heroImage: 'assets/onboarding1.png',
                pageController: _pageController,
              ),
              OnBoardingBodyWidget(
                heroImage: 'assets/onboarding2.png',
                pageController: _pageController,
              ),
              OnBoardingBodyWidget(
                heroImage: 'assets/onboarding3.png',
                pageController: _pageController,
              ),
              customOnBoarding4(),
            ],
          ),
        ),
        bottomSheet: _currentPage < 3
            ? Container(
                decoration: const BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                height: getProportionateScreenHeight(267),
                child: Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        top: getProportionateScreenHeight(72),
                        left: getProportionateScreenWidth(37),
                        right: getProportionateScreenWidth(37),
                        bottom: getProportionateScreenHeight(70),
                      ),
                      child: Text(
                        _currentPage == 0
                            ? 'Ever wondered where you can find out about your skin disease without going to the doctor?'
                            : _currentPage == 1
                                ? 'Feeling confused when looking for the right medicine for your skin disease?'
                                : _currentPage == 2
                                    ? 'Often hesitate when looking for the right information for your skin disease treatment tips?'
                                    : '',
                        style: latoTextStyle.copyWith(
                          color: greyColor,
                          fontSize: getProportionateScreenWidth(18),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        margin: EdgeInsets.symmetric(
                          vertical: getProportionateScreenHeight(25),
                          horizontal: getProportionateScreenWidth(30),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                AnimatedContainer(
                                  duration: const Duration(
                                    milliseconds: 500,
                                  ),
                                  height: 4,
                                  width: _currentPage == 0 ? 18 : 12,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: _currentPage == 0
                                        ? blue2Color
                                        : blue3Color,
                                  ),
                                ),
                                AnimatedContainer(
                                  duration: const Duration(
                                    milliseconds: 500,
                                  ),
                                  margin:
                                      const EdgeInsets.symmetric(horizontal: 4),
                                  height: 4,
                                  width: _currentPage == 1 ? 18 : 12,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: _currentPage == 1
                                        ? blue2Color
                                        : blue3Color,
                                  ),
                                ),
                                AnimatedContainer(
                                  duration: const Duration(
                                    milliseconds: 500,
                                  ),
                                  height: 4,
                                  width: _currentPage == 2 ? 18 : 12,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: _currentPage == 2
                                        ? blue2Color
                                        : blue3Color,
                                  ),
                                )
                              ],
                            ),
                            GestureDetector(
                              onTap: () {
                                _pageController.nextPage(
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.easeIn,
                                );
                              },
                              child: Text(
                                'Next',
                                style: latoTextStyle.copyWith(
                                  fontWeight: weightBold,
                                  color: blueColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            : AnimatedContainer(
                duration: const Duration(milliseconds: 2000),
                margin: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(16),
                  vertical: getProportionateScreenHeight(21),
                ),
                child: GestureDetector(
                  onTap: () {
                    _storeOnboardInfo();
                    Navigator.pushNamedAndRemoveUntil(
                        context, '/main', (route) => false);
                  },
                  child: Container(
                    height: getProportionateScreenHeight(51),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: yellowColor,
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: Center(
                      child: Text(
                        'Let’s Get Started!',
                        style: latoTextStyle.copyWith(
                          fontWeight: weightSemiBold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
