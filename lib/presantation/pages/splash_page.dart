import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/splash_controller.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  var splashController= Get.find<SplashController>();

  @override
  void initState() {
    super.initState();
    splashController.initTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromRGBO(40,15,50,1),
                Color.fromRGBO(20,18,50,1),
              ]
          ),
        ),
        child: Center(
          child: Container(
            padding: EdgeInsets.only(left: 20,right: 20),
            width: double.infinity,
            child: Image(image: AssetImage("assets/images/lifeos.png"),fit: BoxFit.cover,),
          ),
        ),
      ),
    );
  }
}
