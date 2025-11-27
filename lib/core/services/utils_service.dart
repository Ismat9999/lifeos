import 'dart:convert';
import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:restart_app/restart_app.dart';

class Utils {
  static Future<String> pickAndConvertImage()async{
    final picker= ImagePicker();
    final pickedFile= await picker.pickImage(source: ImageSource.gallery);


    if (pickedFile == null){
      return "";
    }

    final imageFile= File(pickedFile.path);
    final imageBytes= await imageFile.readAsBytes();
    final base64Image= base64Encode(imageBytes);
    return base64Image;
  }
  final FlutterTts flutterTts = FlutterTts();
  static void speak(String text, FlutterTts flutterTts) {
    flutterTts.setLanguage("en-US");
    flutterTts.setSpeechRate(0.65);
    flutterTts.speak(text);
  }
  Future<void> changeLanguage(BuildContext context, String langCode) async{
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => WillPopScope(
        onWillPop: () async => false,
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromRGBO(20,55,40,1),
                  Color.fromRGBO(10,40,40,1),
                ]),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(color: Colors.white,),
                SizedBox(height: 20),
                Text(
                  tr('changing_language'),
                  style: TextStyle(fontSize: 16,color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
    Locale newLocale;
    switch (langCode) {
      case 'uz':
        newLocale = Locale('uz', 'UZ');
        break;
      case 'ru':
        newLocale = Locale('ru', 'RU');
        break;
      case 'en':
        newLocale = Locale('en', 'US');
        break;
      default:
        newLocale = Locale('uz', 'UZ');
    }
    await context.setLocale(newLocale);
    await Future.delayed(Duration(milliseconds: 500));
    Restart.restartApp();

  }

  String getCurrentLangCode(BuildContext context) {
    return context.locale.languageCode;
  }
}