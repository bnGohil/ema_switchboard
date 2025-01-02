part of "theme.dart";

ThemeData appTheme(BuildContext context) {
  final isWeb = GetSizedData.webSize(context);
  return ThemeData(
      fontFamily: kFontFamily,
      useMaterial3: true,
   colorScheme: ColorScheme.fromSeed(seedColor: kPrimaryColor),
      scaffoldBackgroundColor: Colors.white,
  textTheme: Theme.of(context).textTheme.apply(
    displayColor:  kPrimaryColor,
    bodyColor:  kPrimaryColor,
    fontFamily: kFontFamily
  ),
      appBarTheme: AppBarTheme.of(context).copyWith(
          centerTitle: true,
          color: kAppbarBGColor,
          shadowColor: Colors.transparent,
          shape: Border(
            bottom: BorderSide(color: highlightColor)
          ),
          scrolledUnderElevation: 1.0,
          elevation: 0.0,
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.dark,
          ),
          foregroundColor: kPrimaryTextColor,
          surfaceTintColor: Colors.transparent,
          titleTextStyle: !isWeb ? kWebMobileAppBarTextStyle :kAppBarTextStyle,
      ),
    );
}

