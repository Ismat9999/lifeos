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
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.all(20),
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                  child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("LifeOS",style: TextStyle(color: Colors.black,fontSize: 50,fontWeight: FontWeight.bold),),
                      Text("ga",style: TextStyle(color: Colors.black,fontSize: 45,fontWeight: FontWeight.w500),),
                    ],
                  ),
                  Text("xush kelibsiz!",style: TextStyle(color: Colors.black,fontSize: 45,fontWeight: FontWeight.w500),),
                ],
              ),
              ),
              Container(
                child: Column(
                  children: [
                    GestureDetector(
                      onTap:(){
                        splashController.callSignInPage();
                      },
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Colors.indigo,
                        ),
                        child: Center(
                          child: Text("Kirish",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
                        ),
                      ),
                    ),
                    SizedBox(height: 20,),
                    GestureDetector(
                      onTap: (){
                        splashController.callSignUpPage();
                      },
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          border: Border.all(width: 2,color: Colors.indigo),
                          color: Colors.white,
                        ),
                        child: Center(
                          child: Text("Ro'yxatdan o'tish",style: TextStyle(color: Colors.indigo,fontSize: 20,fontWeight: FontWeight.bold),),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
