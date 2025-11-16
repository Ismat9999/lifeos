import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lifeosai/presantation/controllers/home_controller.dart';
import 'package:lottie/lottie.dart';

import '../widgets/item_of_gemini_message.dart';
import '../widgets/item_of_user_message.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const SizedBox(
          height: 45,
          child: Image(
            image: AssetImage('assets/images/lifeos.png'),
            fit: BoxFit.cover,
          ),
        ),
        elevation: 0,
      ),
      drawer: NavigationDrawer(
        backgroundColor: Colors.white,
          children: [
            Container(),
          ],
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromRGBO(40, 15, 50, 1),
              Color.fromRGBO(20, 18, 50, 1),
            ],
          ),
        ),
        child: Column(
          children: [
            Expanded(
                child: Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.all(15),
                      child: homeController.messages.isNotEmpty
                          ? ListView.builder(
                        controller: homeController.scrollController,
                        itemCount: homeController.messages.length,
                        itemBuilder: (context, index) {
                          var message = homeController.messages[index];
                          if (message.isMine!) {
                            return itemOfUserMessage(message);
                          } else {
                            return itemOfGeminiMessage(message);
                          }
                        },
                      )
                          : Center(
                        child: SizedBox(
                          height: 80,
                          width: 80,
                          child: Image.asset('assets/images/lifeos.png'),
                        ),
                      ),
                    ),
                    homeController.isLoading ? Center(child: Container(
                      width: 40,
                      height: 40,
                      child: Lottie.asset("assets/lotties/lottie1.json"),
                    ),) : SizedBox.shrink(),
                  ],)),
            Container(
              margin: const EdgeInsets.only(right: 20, left: 20),
              padding: const EdgeInsets.only(left: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                border: Border.all(color: Colors.grey, width: 1.5),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [homeController.pickedImage64.isNotEmpty ? Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.all(10),
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.white),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.memory(
                          base64Decode(homeController.pickedImage64),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.all(10),
                        width: 70,
                        height: 70,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.white),
                        ),
                        child: Center(
                          child: IconButton(
                            onPressed: () {
                              homeController.removePickedImage();
                            },
                            icon: Icon(
                              Icons.clear,
                              color: Colors.black,
                            ),
                          ),
                        )),
                  ],
                )
                    : SizedBox.shrink(),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: homeController.textController,
                          maxLines: null,
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Message",
                            hintStyle: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          homeController.pickImageFromGallery();
                        },
                        icon: Icon(
                          Icons.attach_file,
                          color: Colors.grey,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          // homeController.askToGemini();
                        },
                        icon: Icon(
                          Icons.send,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
