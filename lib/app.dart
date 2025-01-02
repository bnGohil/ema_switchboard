import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:switchboard/app/lending/route/lending_route.dart';
import 'package:switchboard/services/providers.dart';
import 'package:switchboard/theme/theme.dart';
import 'package:switchboard/utils/utils.dart';

import 'app/lending/presentation/lending_page.dart';
import 'base/custom_views/my_custom_scroll_behavior.dart';
import 'config/config.dart';
class EmaSwitchBoardApp extends StatefulWidget {
  const EmaSwitchBoardApp({super.key});

  @override
  State<EmaSwitchBoardApp> createState() => _EmaSwitchBoardAppState();
}

class _EmaSwitchBoardAppState extends State<EmaSwitchBoardApp> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: MultiProvider(providers: [
        AppProviders.shared.lendingProvider,
        // AppProviders.shared.tabProvider,
        // AppProviders.shared.authProvider,
        // AppProviders.shared.leadProvider,
        // AppProviders.shared.homeProvider,
      ],
        child: Sizer(builder: (context, orientation, deviceType) {
          return MaterialApp(
            title: 'EMA SWITCHBOARD',
            key: kNavigatorKey,
            theme: appTheme(context),
            scrollBehavior: MyCustomScrollBehavior(),
            initialRoute: LendingRoute.route,
            routes: Routes().routes,
            debugShowCheckedModeBanner: false,
            builder: (context, child) {
              final MediaQueryData data = MediaQuery.of(context);
              return MediaQuery(
                data: data.copyWith(
                    textScaler: const TextScaler.linear(1.0)
                ),
                child: child ?? Container(),
              );
            },
          );
        },),
      ),
    );
  }
}
