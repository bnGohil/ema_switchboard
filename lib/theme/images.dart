part of "theme.dart";

class Images {

  static CommonIcons get commonIcons => CommonIcons();
  static AppImage get images => AppImage();
}

class CommonIcons {
  Widget appHeaderIcons(BuildContext context) => CustomSvgPictures.asset("$kIconPath/app_header_icons.svg", fit: BoxFit.contain,height: 43.sp,width: 40.sp);
  Widget rightCrossArrowIcon(BuildContext context) => CustomSvgPictures.asset("$kIconPath/right_cross_arrow_icon.svg", fit: BoxFit.contain,height: 43.sp,width: 40.sp);
  Widget userIcon(BuildContext context) => CustomSvgPictures.asset("$kIconPath/user.svg", fit: BoxFit.contain,height: 24.sp,width: 24.sp);
  Widget hideIcon(BuildContext context) => CustomSvgPictures.asset("$kIconPath/hide_eye.svg", fit: BoxFit.contain,height: 24.sp,width: 24.sp);
  Widget showIcon(BuildContext context) => CustomSvgPictures.asset("$kIconPath/show_eye.svg", fit: BoxFit.contain,height: 24.sp,width: 24.sp);
  // Widget leftArrow(BuildContext context) => CustomSvgPictures.asset("$kIconPath/arrow-left-line.svg", fit: BoxFit.contain, width: 24.sp);
  // Widget email(BuildContext context) => CustomSvgPictures.asset("$kIconPath/email.svg", fit: BoxFit.contain);
  // Widget timer(BuildContext context) => CustomSvgPictures.asset("$kIconPath/timer.svg", fit: BoxFit.contain);
  // Widget lock(BuildContext context) => CustomSvgPictures.asset("$kIconPath/lock.svg", fit: BoxFit.contain, width: 24.sp);
  // Widget userIcon(BuildContext context) => CustomSvgPictures.asset("$kIconPath/user.svg", fit: BoxFit.contain,color: context.isDarkMode ? Colors.white : Colors.black);
  // Widget eyeIcon(BuildContext context) => CustomSvgPictures.asset("$kIconPath/show_eye.svg", fit: BoxFit.contain, width: 24.sp, color: context.isDarkMode ? Colors.white : Colors.black);
  // Widget cart(BuildContext context,[bool? isWeb]) => CustomSvgPictures.asset("$kIconPath/cart.svg", fit: BoxFit.contain, width: 30.sp, color: isWeb == true ? Colors.white : context.isDarkMode ? Colors.white : Colors.black);
  // Widget notification(BuildContext context,[bool? isWeb]) => CustomSvgPictures.asset("$kIconPath/notification.svg", fit: BoxFit.contain, width: 30.sp, color: isWeb == true ? Colors.white : context.isDarkMode ? Colors.white : Colors.black);
  // Widget link(BuildContext context) => CustomSvgPictures.asset("$kIconPath/link.svg", fit: BoxFit.contain, width: 20.sp, color: context.isDarkMode ? Colors.white : Colors.black);
  // Widget filter(BuildContext context) => CustomSvgPictures.asset("$kIconPath/filter_ic.svg", fit: BoxFit.contain, width: 30.sp, color: context.isDarkMode ? Colors.white : Colors.black);
  // Widget filterWeb(BuildContext context) => CustomSvgPictures.asset("$kIconPath/filter_ic.svg", fit: BoxFit.contain, width: 30.sp, color:  Colors.white);
  // Widget pdf(BuildContext context) => CustomSvgPictures.asset("$kIconPath/pdf.svg", fit: BoxFit.contain, width: 22.sp, color: context.isDarkMode ? Colors.white : Colors.black);
  // Widget edit(BuildContext context) => CustomSvgPictures.asset("$kIconPath/edit_ic.svg", fit: BoxFit.contain, width: 16.sp);
  // Widget cancel(BuildContext context) => CustomSvgPictures.asset("$kIconPath/cancel.svg", fit: BoxFit.contain, width: 22.sp);
  // Widget plus(BuildContext context) => CustomSvgPictures.asset("$kIconPath/plus.svg", fit: BoxFit.contain, width: 22.sp,height: 22,);
  // Widget location(BuildContext context) => CustomSvgPictures.asset("$kIconPath/location.svg", fit: BoxFit.contain, width: 22.sp,height: 22,);

}


class AppImage{
  Widget onboardingHospitality(BuildContext context) => CustomPngPictures.asset("$kImageIconPath/onboarding_hospitality.png", fit: BoxFit.contain);
  // Widget appIcon2(BuildContext context) => CustomPngPictures.asset("$kImageIconPath/app_icon_2.png", fit: BoxFit.contain, width: 24.sp);
  // Widget loginImage(BuildContext context) => CustomPngPictures.asset("$kImageIconPath/login_image.png", fit: BoxFit.contain, width: 24.sp);
  // Widget backgroundImage(BuildContext context) => const CustomPngPictures.asset("$kImageIconPath/background_image.png");
  // Widget placeHolderImg(BuildContext context) => CustomPngPictures.asset("$kImageIconPath/placeholder-image.jpg", fit: BoxFit.cover, width: 20.sp);
  // Widget profileImg(BuildContext context) => CustomPngPictures.asset("$kImageIconPath/isProfile.jpg", fit: BoxFit.contain, width: 24.sp);
}

class CustomSvgPictures extends StatelessWidget {
  const CustomSvgPictures.asset(
      this.assetName, {
        Key? key,
        this.width,
        this.height,
        this.fit = BoxFit.cover,
        this.alignment = Alignment.center,
        this.color
      }) : super(key: key);

  final double? width;
  final Color? color;
  final String assetName;
  final double? height;
  final BoxFit fit;
  final AlignmentGeometry alignment;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      assetName,
      height: height,
      width: width,
      fit: fit,
      alignment: alignment,
      colorFilter: color == null ? null : ColorFilter.mode(color!, BlendMode.srcIn),
      placeholderBuilder: (context) {
        return const SizedBox.shrink();
      },
    );
  }
}
class CustomPngPictures extends StatelessWidget {
  const CustomPngPictures.asset(
      this.assetName, {
        Key? key,
        this.width,
        this.height,
        this.fit = BoxFit.cover,
        this.alignment = Alignment.center,
        this.color
      }) : super(key: key);

  final double? width;
  final Color? color;
  final String assetName;
  final double? height;
  final BoxFit fit;
  final AlignmentGeometry alignment;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      assetName,
      height: height,
      width: width,
      fit: fit,
      alignment: alignment,
    );
  }
}