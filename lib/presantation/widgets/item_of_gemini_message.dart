import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

import '../../core/services/utils_service.dart';
import '../../domain/models/message_model.dart';

Widget itemOfGeminiMessage(MessageModel message){
  return Container(
    width: double.infinity,
    padding: EdgeInsets.all(16),
    margin: EdgeInsets.only(top: 15, bottom: 15),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 30,
              child: Image.asset("assets/images/gemini_icon.png"),
            ),
            GestureDetector(
              onTap: (){
                Utils.speak(message.message!, FlutterTts());
              },
              child: Icon(
                Icons.volume_up, color: Colors.white70,
              ),
            ),
          ],
        ),
        Container(
          margin: EdgeInsets.only(top: 15),
          child: Text(message.message!,style: TextStyle(color: Color.fromRGBO(173,173,176,1),fontSize: 16),),
        ),
      ],
    ),
  );
}