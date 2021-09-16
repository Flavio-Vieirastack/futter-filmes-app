import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

mixin MessagensMixin on GetxController {
  void messageListner(Rxn<MessageModel> message) {

    ever<MessageModel?>(message, (model) {

      if (model != null) {
        Get.snackbar(
          model.title,
          model.message,
          backgroundColor: model.type.color()
          );
      } else {
      }
    });

  }
}

class MessageModel {
  final String title;
  final String message;
  final MessageType type;

  MessageModel({
    required this.title,
    required this.message,
    required this.type,
  });

  MessageModel.error({
    required this.title,
    required this.message,
  }) : type = MessageType.error;

  MessageModel.info({
    required this.title,
    required this.message,
  }) : type = MessageType.info;
}

enum MessageType { error, info }

extension MessageTypeExtension on MessageType {
  
  Color color () {

    switch(this){

      case MessageType.error:
        return Colors.red[200] ?? Colors.red;
      case MessageType.info:
        return Colors.green[200] ?? Colors.green;
    
    }
    
  }
}