import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:strangerschat/models/Slider_objects.dart';
import 'package:strangerschat/router/routes.dart';
import 'package:strangerschat/widgets/walk_through_items.dart';

class WalkThroughSlider extends StatefulWidget {
  const WalkThroughSlider({Key? key}) : super(key: key);

  @override
  State<WalkThroughSlider> createState() => _WalkThroughSliderState();
}

class _WalkThroughSliderState extends State<WalkThroughSlider> {
  final PageController _pageController = PageController(initialPage: 0);
  bool isLastPage = false;

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomPaint(
        painter: BottomCurve(
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xff2e2c2c),
              Color(0x382e2c2c),
            ],
          ),
        ),
        child: Stack(
          children: [
            Container(
              constraints: const BoxConstraints.expand(),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/grey_bg.jpg"),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Opacity(
              opacity: 0.7,
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0XFFFFFFFF),
                      Color(0XFFFF0E0E),
                    ],
                  ),
                ),
              ),
            ),
            Stack(
              children: [
                Column(
                  children: <Widget>[
                    Expanded(
                      child: Stack(
                        alignment: AlignmentDirectional.topCenter,
                        children: <Widget>[
                          PageView.builder(
                            scrollDirection: Axis.horizontal,
                            controller: _pageController,
                            onPageChanged: (index) {
                              setState(() =>
                                  isLastPage = index == slideList.length - 1);
                            },
                            itemCount: slideList.length,
                            itemBuilder: (ctx, i) => SlideItem(i),
                          ),
                          // SmoothPageIndicator
                          Positioned(
                            bottom: MediaQuery.of(context).size.height * 0.15,
                            child: SmoothPageIndicator(
                              controller: _pageController,
                              count: slideList.length,
                              effect: const WormEffect(
                                spacing: 14,
                                dotWidth: 16,
                                dotHeight: 14,
                                activeDotColor: Colors.white,
                              ),
                            ),
                          ),
                          // FloatingActionButton
                          Positioned(
                            bottom: MediaQuery.of(context).size.height * 0.05,
                            left: MediaQuery.of(context).size.width * 0.1,
                            right: MediaQuery.of(context).size.width * 0.1,
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height * 0.06,
                              child: FloatingActionButton.extended(
                                onPressed: () {
                                  if (isLastPage) {
                                    Navigator.pushReplacementNamed(
                                        context, AppRoutes.signInScreen);
                                  } else {
                                    _pageController.nextPage(
                                      duration:
                                          const Duration(milliseconds: 500),
                                      curve: Curves.easeInOut,
                                    );
                                  }
                                },
                                backgroundColor: Colors.white,
                                label: Text(
                                  isLastPage ? "Continue" : "Next",
                                  style: const TextStyle(
                                    color: Color(0XFFFF0E0E),
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                // Skip Button
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.05,
                  right: 20,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(
                          context, AppRoutes.signInScreen);
                    },
                    child: Text(
                      "Skip",
                      style: GoogleFonts.urbanist(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: Colors.red,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
