import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyServices extends GetxService {
  late SharedPreferences sharedPreferences;

  Future<MyServices> init() async {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
      apiKey: 'AIzaSyDEUgpIpLb163U8u3-4CoFpN8xx6I7MBWE',
      appId: '1:29731391392:android:863f8f776b09f4329886c5',
      messagingSenderId: '29731391392',
      projectId: 'ecommerce-80185',
      storageBucket: 'myapp-b9yt18.appspot.com',
    ));
    sharedPreferences = await SharedPreferences.getInstance();
    return this;
  }
}

initialservices() async {
  await Get.putAsync(() => MyServices().init());
}
