import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nutrinowapp/constants/strings.dart';
import 'package:nutrinowapp/ui/pages/onboarding/components/onboarding_bottom_nav.dart';
import 'package:nutrinowapp/ui/pages/onboarding/onboarding_page_data.dart';
import 'package:nutrinowapp/ui/pages/onboarding/onboarding_screen.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  var _controller;
  int _currIndex = 0;

  @override
  void initState() {
    super.initState();
    _controller = PageController();
    ;
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var details = onBoardingPageData(context);

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
      child: SafeArea(
        child: Scaffold(
          body: Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            alignment: Alignment.center,
            color: Colors.white,
            child: Column(
              children: [
                SizedBox(height: 6),
                Expanded(
                  flex: 4,
                  child: Container(
                    alignment: Alignment.center,
                    child: PageView(
                        scrollDirection: Axis.horizontal,
                        controller: _controller,
                        onPageChanged: (value) {
                          setState(() => _currIndex = value);
                        },
                        children: details
                            .map((e) => OnBoardingScreen(
                                  imageSrc: e.imageSrc,
                                  description: e.description,
                                  header: appDisplayName,
                                  subTitle: e.title,
                                ))
                            .toList()),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      details.length,
                      (index) => createCircle(index: index),
                    ),
                  ),
                ),
                Expanded(
                  flex: 0,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: OnBoardingBottomButtons(
                      currentIndex: _currIndex,
                      dataLength: details.length,
                      controller: _controller,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  AnimatedContainer createCircle({int? index}) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 100),
      margin: EdgeInsets.only(right: 6),
      height: 10,
      width: 10,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade600),
        shape: BoxShape.circle,
        color: _currIndex == index ? Colors.grey.shade600 : Colors.transparent,
      ),
    );
  }
}
