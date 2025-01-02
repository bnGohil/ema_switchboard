part of utils;

class Routes {
  Map<String, WidgetBuilder> routes = {
    LendingRoute.route:(context) => LendingRoute.child,
    LoginRoute.route : (context) => LoginRoute.child,
    OnBoardingRoute.route : (context) => OnBoardingRoute.child,
    TabRoute.route : (context) => TabRoute.child,


    // AuthRoute.loginRoute : (context) => AuthRoute.login,
    // AuthRoute.forgotPasswordRoute : (context) => AuthRoute.forgotPassword,
    // AuthRoute.otpRoute : (context) => AuthRoute.otp,
    // AuthRoute.changePasswordRoute : (context) => AuthRoute.changePassword,
    // PropertyRoute.propertyDetailRoute : (context) => PropertyRoute.propertyDetail,
    // LeadRoute.createLeadRoute : (context) => LeadRoute.createLead,
    // LeadRoute.subCreateLeadRoute : (context) => LeadRoute.subCreateLead,
    // LeadRoute.leadDetailsRoute : (context) => LeadRoute.leadDetails,
    // LeadRoute.activityDetailRoute : (context) => LeadRoute.activityDetail,
  };
}