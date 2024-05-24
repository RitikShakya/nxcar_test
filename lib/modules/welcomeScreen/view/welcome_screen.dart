import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nxcar_test/utils/routes/routing_name_constants.dart';
import 'package:nxcar_test/utils/utils.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../view_model/welcome_screen_controller.dart';

class WelcomeScreen extends StatelessWidget {
  WelcomeController onBoardingController = Get.find();
  PageController controller = PageController();

  WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        body: Container(
          height: height,
          child: PageView.builder(
            onPageChanged: (val) {
              controller.animateToPage(val,
                  duration: Duration(milliseconds: 10),
                  curve: Curves.bounceInOut);
            },
            controller: controller,
            itemBuilder: (context, index) {
              int actualIndex =
                  index % 3; // Replace 3 with the actual number of pages

              final movie = onBoardingController.carouselList[actualIndex];

              return buildBackground(model: movie, index: index);
            },
            itemCount: onBoardingController.carouselList.length,
          ),
        ),
      ),
    );
  }

  Widget buildBackground({required String model, index}) {
    var height = MediaQuery.of(Get.context!).size.height;
    var width = MediaQuery.of(Get.context!).size.width;

    return Column(
      children: [
        Container(
            width: width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(
                    top: height * 0.02,
                    left: 16,
                  ),
                  child: Image.asset(
                    height: 22,
                    fit: BoxFit.contain,
                    "assets/images/path7.png",
                  ),
                ),
              ],
            )),
        Container(
          child: Stack(
            children: [
              Container(
                padding: EdgeInsets.only(top: 24),
                child: Image.asset(
                  height: height * 0.644,
                  fit: BoxFit.contain,
                  "assets/images/welcome_bg.png",
                ),
              ),

              //

              Positioned(
                top: height * 0.12,
                left: 0,
                child: Container(
                  child: Image.asset(
                    height: height * 0.092,
                    width: 149,
                    fit: BoxFit.contain,
                    "assets/images/v1.png",
                  ),
                ),
              ),

              //bottom right
              Positioned(
                bottom: 22,
                right: 10,
                child: Container(
                  child: Image.asset(
                    height: height * 0.141,
                    width: 161,
                    fit: BoxFit.contain,
                    "assets/images/v2.png",
                  ),
                ),
              ),

              //bottom left
              Positioned(
                bottom: height * 0.08,
                left: 5,
                child: Container(
                  child: Image.asset(
                    height: height * 0.133,
                    width: 108,
                    fit: BoxFit.contain,
                    "assets/images/v3.png",
                  ),
                ),
              ),

              //top right
              Positioned(
                top: 0,
                right: 14,
                child: Container(
                  child: Image.asset(
                    height: height * 0.130,
                    width: 111,
                    fit: BoxFit.contain,
                    "assets/images/v4.png",
                  ),
                ),
              ),

              //middle image
              Positioned(
                top: height * 0.28,
                left: MediaQuery.of(Get.context!).size.width * 0.34,
                child: Container(
                  child: Image.asset(
                    height: height * 0.124,
                    width: 118,
                    fit: BoxFit.contain,
                    "assets/images/v5.png",
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            textAlign: TextAlign.center,
            model,
            style: TextStyleUtils.textStyleh28w600black,
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SmoothPageIndicator(
                controller: controller,
                count: onBoardingController.carouselList.length,
                effect: ExpandingDotsEffect(
                  dotHeight: 12,
                  dotWidth: 12,
                  activeDotColor: ColorUtils.BRAND_COLOR,
                  dotColor: ColorUtils.BRAND_COLOR,
                ),
              ),
              InkWell(
                onTap: () {
                  if (index == onBoardingController.carouselList.length - 1) {
                    print("move to page");
                    Get.toNamed(RoutingNameConstants.LOGIN_DETAILS_SCREEN);
                  } else {
                    controller.jumpToPage(index + 1);
                  }
                },
                child: Container(
                  padding: EdgeInsets.all(22),
                  child: Center(
                    child: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white,
                      size: 19,
                    ),
                  ),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: ColorUtils.BRAND_COLOR,
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
