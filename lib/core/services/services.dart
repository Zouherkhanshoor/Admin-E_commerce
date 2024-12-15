import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyServices extends GetxService {
  late SharedPreferences sharedPreferences;

  Future<MyServices> init() async {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
      apiKey: 'AIzaSyA5rOPIU85QES3aEcIsrSCvJUpvuzthJec',
      appId: '1:785476671716:android:8168072e686d5600a0f4f1',
      messagingSenderId: '785476671716',
      projectId: 'projectecommerce-7c191',
      storageBucket: 'myapp-b9yt18.appspot.com',
    ));
    sharedPreferences = await SharedPreferences.getInstance();
    return this;
  }
}

initialservices() async {
  await Get.putAsync(() => MyServices().init());
}
