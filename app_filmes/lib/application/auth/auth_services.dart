import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/state_manager.dart';
import 'package:get/route_manager.dart';

class AuthServices extends GetxService {
  
  User? user;

  void Init() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      this.user = user;

      if (user == null) {
        Get.offAllNamed("/loguin");
      } else {
        Get.offAllNamed("/home");
      }
    });
  }
}
