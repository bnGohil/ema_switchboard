import 'dart:io';

import 'package:switchboard/app/lending/presentation/splash_page.dart';
import 'package:switchboard/app/login/presentation/login_page.dart';
import 'package:switchboard/app/onboarding_page/presentation/onboarding.dart';
import 'package:switchboard/app/tab_page/presentation/tab_page.dart';
import 'package:switchboard/utils/utils.dart';

import '../../../base/base.dart';
import '../../../base/custom_views/NoDataFoundComponent.dart';
import '../../../theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../application/lending_provider.dart';

class LendingPage extends StatefulWidget {

  const LendingPage({super.key});

  @override
  State<LendingPage> createState() => _LendingPageState();
}

class _LendingPageState extends State<LendingPage> with WidgetsBindingObserver {

  bool isShowPage = false;

  bool underMaintenance = false;


  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addObserver(this);

    WidgetsBinding.instance.addPostFrameCallback((_)async{
      //
      // final lendingProvider = context.read<LendingProvider>();
      // final authProvider = context.read<AuthProvider>();
      //
      // await Future.delayed(const Duration(seconds: 1)).then((value) {
      //   setState(() {
      //     isShowPage = true;
      //   });
      // },);
      //
      //
      // await authProvider.getAppSetting();
      //
      // final data = authProvider.getAppSettingAppResponse.data?.data;
      //
      // String? minVersion;
      // String? maxVersion;
      //
      // if(Platform.isAndroid) {
      //   minVersion = data?.androidMinimumVersion;
      //   maxVersion = data?.androidMinimumVersion;
      // } else {
      //   minVersion = data?.iosMinimumVersion;
      //   maxVersion = data?.iosMaximumVersion;
      // }
      //
      // await lendingProvider.manageAppSettings(
      //     isUnderMaintenance: data?.isUndermaintenance == 1,
      //     majorVersion: maxVersion,
      //     minorVersion: minVersion
      // );
      //
      //
      // if(!lendingProvider.isMajorUpdate) {
      //
      //   if(lendingProvider.isMinorUpdate) {
      //     CustomShowModalBottomSheetPopup(context,
      //         title: "Update",
      //         message: "New Update Available.",
      //         primaryBtnTxt: "Update",
      //         primaryAction: () {
      //           // launchUrl(Uri.parse(ServerConfig.storeUrl),mode: LaunchMode.externalApplication);
      //         },
      //         secondaryBtnTxt: "Cancel");
      //   }
      //
      // }
      //
      // // lendingProvider.setAppState(state: AppState(isLogin: true));
      //
      // print("lendingProvider : ${lendingProvider.appState?.isLogin}");

      });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    final lendingProvider = context.watch<LendingProvider>();
    final appState = lendingProvider.appState;
    final isOnBoarding = lendingProvider.isOnBoarding;

    print("appState?.isLogin ${isOnBoarding}");
    print("token ${appState?.token}");

    if((appState?.isLogin == null)) {
      return const SplashPage();
    }

    if(lendingProvider.isUnderMaintenance) {
      return const Scaffold(
        body: NoDataFoundComponent(
          message: "App is under maintenance.",
        ),
      );
    }

    if(lendingProvider.isMajorUpdate) {
      return Scaffold(
          body: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("New Update Available.", style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 17.sp
                ),),
                SizedBox(
                  height: 15.sp,
                ),
                InkWell(
                  onTap: () {
                    // launchUrl(Uri.parse(ServerConfig.storeUrl),mode: LaunchMode.externalApplication);
                  },
                  child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: kPrimaryColor)
                      ),
                      child: Text("Update",style: TextStyle(
                          color: kPrimaryColor,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500
                      ),)),
                ),
              ],
            ),
          )
      );
    }


    if(appState?.isLogin == true){
      return TabPage();
    }else{
      if(isOnBoarding){
        return OnBoardingPage();
      }else{
        return LoginPage();
      }

    }
    // if(appState?.isLogin == true) {
    //   return MainTabScreen();
    // } else {
    //   if(!lendingProvider.isOnBoarding){
    //     return OnBoardingPage();
    //   }else{
    //     return LoginScreen();
    //   }
    //
    // }

  }
}


