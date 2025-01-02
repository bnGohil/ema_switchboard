// import 'package:package_info_plus/package_info_plus.dart';
// import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../utils/utils.dart';
import '../../../repository/repository.dart';
import '../use_cases/lending_use_case.dart';


abstract class ILendingProvider {
  Future getAppState();
  Future setAppState({required AppState state});
  Future clearAppState();
}

class LendingProvider extends BaseNotifier implements ILendingProvider {
  late final ILendingUseCase useCase;

  AppState? appState;

  bool isOnBoarding = true;

  bool isUnderMaintenance = false;
  bool isMajorUpdate = false;
  bool isMinorUpdate = false;

  int selectedIndex = 0;

  LendingProvider({required this.useCase}) {
    getAppState();
    // onBoardingUpdate();
  }


  Future updateOnBoardingTab(int index)async{
    selectedIndex = index;
    notifyListeners();
  }

  Future onBoardingUpdate()async{
    final isOnBoarding  = UserPrefs.shared.getOnBoarding;
    this.isOnBoarding = await isOnBoarding;
    notifyListeners();
  }

  @override
  Future getAppState() async {

    try {
      appState = await useCase.getAppState();
      print(appState?.memberID);
    } catch (e) {
      debugPrint(e);
      appState = AppState(isLogin: false);
    } finally {
      notifyListeners();
    }

  }

  @override
  Future setAppState({required AppState state}) async {

    try {
      await useCase.setAppState(state: state);
      await getAppState();
    } catch (e) {
      debugPrint(e);
    }

  }

  @override
  Future clearAppState() async {
    await useCase.clearAppState();
    appState = AppState(isLogin: false);
    notifyListeners();
  }

  manageAppSettings({required bool? isUnderMaintenance, required String? majorVersion, required String? minorVersion}) async {
    //
    // if(isUnderMaintenance != null) {
    //   if(isUnderMaintenance) {
    //     this.isUnderMaintenance = isUnderMaintenance;
    //     notifyListeners();
    //     return;
    //   }
    // }
    //
    // if(majorVersion == null || minorVersion == null) {
    //   return;
    // }
    //
    // PackageInfo packageInfo = await PackageInfo.fromPlatform();
    //
    // String deviceVersion = packageInfo.version;
    //
    // isMajorUpdate = compareVersion(serverVersion: majorVersion, deviceVersion: deviceVersion);
    // isMinorUpdate = compareVersion(serverVersion: minorVersion, deviceVersion: deviceVersion);

    notifyListeners();

  }

  bool compareVersion({required String serverVersion, required String deviceVersion}) {

    if(!serverVersion.contains(".")) {
      return false;
    }


    final serverVersionDivided = serverVersion.split(".").map((e) => int.parse(e)).toList();
    final deviceVersionDivided = deviceVersion.split(".").map((e) => int.parse(e)).toList();

    int smallerNumber = serverVersionDivided.length < deviceVersionDivided.length ?  serverVersionDivided.length : deviceVersionDivided.length;

    bool isServerBigger = false;

    for(var i = 0; i < smallerNumber; i++) {
      // Check if both versions are same
      if(deviceVersionDivided[i] == serverVersionDivided[i]) {
        continue;
      }

      // Check if higher level value version is bigger EX. in 1.0.3 first it will check 1 and then 0 and later 3
      if(serverVersionDivided[i] < deviceVersionDivided[i]) {
        isServerBigger = false;
        break;
      }

      // Check if higher level value version is Smaller EX. in 1.0.3 first it will check 1 and then 0 and later 3
      if(serverVersionDivided[i] > deviceVersionDivided[i]) {
        isServerBigger = true;
        break;
      }
    }

    return isServerBigger;

  }

}