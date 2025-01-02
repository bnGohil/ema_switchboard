import 'package:flutter/material.dart';
import 'package:switchboard/app/custom_component/switch_board_text_widget.dart';
import 'package:switchboard/app/login/route/login_route.dart';
import 'package:switchboard/theme/theme.dart';
import 'package:switchboard/utils/utils.dart';
class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(child: Column(
        children: [
          SizedBox(height: 40.sp),
          SwitchBoardTextWidget(),
          SizedBox(height: 40.sp),
          Expanded(
            child: Stack(
              children: [
                Images.images.onboardingHospitality(context),
                Container(
                  margin: EdgeInsets.only(top: 350.sp),
                  // height: 500,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color(0XFFF15F23).withValues(alpha: 0.05),
                          Color(0XFF093466).withValues(alpha: 0.01),
                        ],
                        transform: GradientRotation(100),
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),

                      boxShadow: [
                        BoxShadow(
                            color: Colors.white,
                            spreadRadius: 3,
                            blurRadius: 55,
                        )
                      ],
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(100),
                          topRight: Radius.circular(100)
                      )
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 80.sp),
                      Text("Powering Hospitality\nwith Insightful Analytics",
                        style: kSecondary32ExtraBold,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 10.sp),
                      Text("Integrate effortlessly and lead in \nthe hospitality industry.",
                        style: kDarkGray18Regular,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 36.sp),
                      FilledButton(
                          style: FilledButton.styleFrom(padding: EdgeInsets.all(17.sp), backgroundColor: kSecondaryColor),
                          onPressed: () {
                            LoginRoute.goToLoginPage(context);
                          },
                          child: Images.commonIcons.rightCrossArrowIcon(context))
                    ],
                  ),
                )
              ],
            ),
          ),

          // Container(
          //   child: CustomPaint(
          //     size: Size(double.infinity,200),
          //     painter: SvgPainter(),
          //   ),
          // ),
          // Stack(
          //   children: [
          //     Images.images.onboardingHospitality(context),
          //
          //   ],
          // ),
          // SizedBox(height: 36.sp),
          // Text("Powering Hospitality\nwith Insightful Analytics",
          //   style: kSecondary32ExtraBold,
          //   textAlign: TextAlign.center,
          // ),
          // SizedBox(height: 10.sp),
          // Text("Integrate effortlessly and lead in \nthe hospitality industry.",
          //   style: kDarkGray18Regular,
          //   textAlign: TextAlign.center,
          // ),
          // SizedBox(height: 36.sp),
          // FilledButton(
          //     style: FilledButton.styleFrom(padding: EdgeInsets.all(17.sp), backgroundColor: kSecondaryColor),
          //     onPressed: () {
          //
          //     },
          //     child: Images.commonIcons.rightCrossArrowIcon(context))
        ],
      )),
      // body: SafeArea(
      //   child: Column(
      //     crossAxisAlignment: CrossAxisAlignment.center,
      //     children: [
      //
      //       SizedBox(height: 100,),
      //
      //       Stack(
      //         children: [
      //
      //           Container(
      //             height: 200,
      //             width: double.infinity,
      //             decoration: BoxDecoration(
      //                 gradient: LinearGradient(
      //                   colors: [
      //                     Color(0XFFF15F23).withValues(alpha: 0.1),
      //                     Color(0XFF093466).withValues(alpha: 0.1)
      //                   ],
      //                   // tileMode: TileMode.decal,
      //                   begin: Alignment.topLeft,
      //                   transform: GradientRotation(100),
      //                   end: Alignment.bottomRight,
      //                 )
      //               // color: kBackgroundColor
      //             ),
      //           ),
      //           Container(
      //             height: 200,
      //             width: double.infinity,
      //             decoration: BoxDecoration(
      //               // color: Colors.white,
      //               boxShadow: [
      //                 BoxShadow(
      //                     color: Colors.white,
      //                     blurStyle: BlurStyle.normal,
      //                     blurRadius: 20,
      //                     spreadRadius: 10,
      //                     offset: Offset(0,5)
      //                 ),
      //                 BoxShadow(
      //                     color: Colors.white,
      //                     blurStyle: BlurStyle.normal,
      //                     blurRadius: 20,
      //                     spreadRadius: 10,
      //                     offset: Offset(0,-10)
      //                 ),
      //               ],
      //               // color: kBackgroundColor
      //             ),
      //           ),
      //         ],
      //       )
      //       // SizedBox(height: 40.sp),
      //       // SwitchBoardTextWidget(),
      //       // SizedBox(height: 40.sp),
      //       // Images.images.onboardingHospitality(context),
      //       // SizedBox(height: 36.sp),
      //       // Text("Powering Hospitality\nwith Insightful Analytics",
      //       //   style: kSecondary32ExtraBold,
      //       //   textAlign: TextAlign.center,
      //       // ),
      //       // SizedBox(height: 10.sp),
      //       // Text("Integrate effortlessly and lead in \nthe hospitality industry.",
      //       //   style: kDarkGray18Regular,
      //       //   textAlign: TextAlign.center,
      //       // ),
      //       // SizedBox(height: 36.sp),
      //       // FilledButton(
      //       //     style: FilledButton.styleFrom(padding: EdgeInsets.all(17.sp), backgroundColor: kSecondaryColor),
      //       //     onPressed: () {
      //       //
      //       //     },
      //       //     child: Images.commonIcons.rightCrossArrowIcon(context))
      //     ],
      //   ),
      // ),
    );
  }
}




class CutCornersClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final double cutSize = 100.0;
    final path = Path()
      ..moveTo(cutSize, 0) // Start at the top-left cut
      ..lineTo(size.width - cutSize, 0) // Top edge
      ..lineTo(size.width, cutSize) // Top-right cut
      ..lineTo(size.width, size.height) // Right edge
      ..lineTo(0, size.height) // Bottom edge
      ..lineTo(0, cutSize) // Top-left cut
      ..close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

