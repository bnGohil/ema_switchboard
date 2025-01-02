import 'package:permission_handler/permission_handler.dart';

class NotificationService {

  static final _instance = NotificationService();

  static NotificationService get instance => _instance;



  Future <void> checkNotificationPermissions() async{
    try {
      await Permission.notification.isDenied.then((value) {
        if (value) {
          Permission.notification.request();
        }
      });
    } catch (e) {
      print(e);
    }
  }

  Future<bool> isNotification()async{
    return await Permission.notification.isGranted;
  }

}