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
      //backgroundColor: Colors.black,
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
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0XFFFFFFFF),
                        Color(0XFFFF0E0E),
                      ]),
                ),
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.05),
                alignment: Alignment.topRight,
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoutes.homeScreen);
                  },
                  child: Text(
                    "Skip",
                    style: GoogleFonts.urbanist(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                )),
            Column(children: <Widget>[
              Expanded(
                child: Stack(
                  alignment: AlignmentDirectional.topCenter,
                  children: <Widget>[
                    PageView.builder(
                      scrollDirection: Axis.horizontal,
                      controller: _pageController,
                      onPageChanged: (index) {
                        setState(() => isLastPage = index == 2);
                      },
                      itemCount: slideList.length,
                      itemBuilder: (ctx, i) => SlideItem(i),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.78),
                      child: Center(
                        child: SmoothPageIndicator(
                          controller: _pageController,
                          count: 3,
                          effect: const WormEffect(
                              spacing: 14,
                              dotWidth: 16,
                              dotHeight: 14,
                              activeDotColor: Colors.white),
                        ),
                      ),
                    ),
                    isLastPage
                        ? Expanded(
                            //crossAxisAlignment: CrossAxisAlignment.stretch,
                            child: Padding(
                              padding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height * 0.93,
                                left: MediaQuery.of(context).size.width * 0.1,
                                right: MediaQuery.of(context).size.width * 0.1,
                              ),
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width,
                                height:
                                    MediaQuery.of(context).size.height * 0.06,
                                child: FloatingActionButton.extended(
                                  onPressed: () {
                                    Navigator.pushNamed(context, AppRoutes.homeScreen);
                                  },
                                  backgroundColor: Colors.white,
                                  label: const Text(
                                    "Continue",
                                    style: TextStyle(
                                      color: Color(0XFFFF0E0E),
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                        : Expanded(
                            //crossAxisAlignment: CrossAxisAlignment.stretch,
                            child: Padding(
                              padding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height * 0.93,
                                left: MediaQuery.of(context).size.width * 0.1,
                                right: MediaQuery.of(context).size.width * 0.1,
                              ),
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width,
                                height:
                                    MediaQuery.of(context).size.height * 0.06,
                                child: FloatingActionButton.extended(
                                  onPressed: () => _pageController.nextPage(
                                    duration: const Duration(milliseconds: 500),
                                    curve: Curves.easeInOut,
                                  ),
                                  backgroundColor: Colors.white,
                                  label: const Text(
                                    "Next",
                                    style: TextStyle(
                                      color: Colors.redAccent,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                  ],
                ),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
