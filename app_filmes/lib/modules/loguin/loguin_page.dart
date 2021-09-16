import 'package:app_filmes/modules/loguin/Loguin_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:get/get.dart';

class LoguinPage extends GetView<LoguinController> {
  const LoguinPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Image.asset(
            "assets/images/background.png",
            width: Get.width,
            height: Get.height,
            fit: BoxFit.cover,
          ),
          Container(
            color: Colors.black54,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 80.0),
            child: Column(
              children: [
                Image.asset("assets/images/logo_filmes.png"),
                SizedBox(
                  height: 50,
                ),
                SizedBox(
                  width: Get.width * .9,
                  height: 45,
                  child: SignInButton(Buttons.Google,
                      text: "Logar com Gmail",
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100)),
                      onPressed: () => controller.Loguin()),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
