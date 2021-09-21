import 'package:app_filmes/modules/movies/Movies_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MoviesHeader extends GetView<MoviesController> {
  const MoviesHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      height: 196,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          SizedBox(
              width: Get.width,
              child: Image.asset(
                "assets/images/header.png",
                fit: BoxFit.cover,
              )),
          Container(
            padding: EdgeInsets.only(bottom: 20),
            width: Get.width * .9,
            child: TextField(
              onChanged: (value) => controller.filterByname(value),
              autofocus: false,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30)),
                  filled: true,
                  fillColor: Colors.white,
                  labelText: "Procurar filmes",
                  labelStyle: TextStyle(
                    fontSize: 15,
                    color: Colors.grey,
                  ),
                  prefixIcon: Icon(Icons.search),
                  contentPadding: EdgeInsets.zero,
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  ),
            ),
          )
        ],
      ),
    );
  }
}
