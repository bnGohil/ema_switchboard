import 'package:flutter/material.dart';
import 'package:switchboard/base/base.dart';
import 'package:switchboard/theme/theme.dart';
import 'package:switchboard/utils/utils.dart';

import '../../custom_component/switch_board_text_widget.dart';
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  bool isIconHide = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 20.sp),
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            SizedBox(height: 40.sp),
            SwitchBoardTextWidget(),
            SizedBox(height: 40.sp),
            Text("Welcome Back,",style: kDarkGray18Regular.copyWith(
              fontWeight: FontWeight.w500
            )),
              Text("Login Now!",style: kTextPrimary32ExtBld,),
              SizedBox(height: 10.sp),
              Text("Login to your account so you continue building \nand editing your onboarding flows.",style: kDarkGray18Medium.copyWith(
              fontSize: 16.sp
            ),),
              SizedBox(height: 32.sp),
              Text("Username",style: kLightGray14Regular,),
              SizedBox(height: 5.sp),
              CustomTextField(
                  textInputAction: TextInputAction.next,
                  name: "Username",hint: "Enter Username",
              fillColor: kBackgroundColor,
              suffixIcon: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Images.commonIcons.userIcon(context),
                ],
              ),
              isBordered: true),
              SizedBox(height: 20.sp),
              Text("Password",style: kLightGray14Regular,),
              SizedBox(height: 5.sp),
              CustomTextField(
                  textInputAction: TextInputAction.go,
                  name: "Password",hint: "Enter Password",
                  fillColor: Colors.white,
                  isSecure: !isIconHide,
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        isIconHide =! isIconHide;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        !isIconHide ? Images.commonIcons.hideIcon(context) : Images.commonIcons.showIcon(context),
                      ],
                    ),
                  ),
                  isBordered: true),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero
                  ),
                    onPressed: (){}, child: Text("Forgot Password ?",style: kLightGray14Regular.copyWith(
                    color: kPrimaryColor
                ),)),
              ),
              SizedBox(height: 15.sp),

              CustomButton(text: "Login",textColor: kBackgroundColor)
                    ],
                  ),
          )),
    );
  }
}
