import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lifeosai/presantation/controllers/lifeindex_controller.dart';
import 'package:lifeosai/presantation/controllers/profile_controller.dart';
import 'package:lifeosai/presantation/widgets/items/item_of_life_index.dart';
import '../home_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  var profileController= Get.find<ProfileController>();
  var lifeindexController= Get.find<LifeIndexController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(builder: (ctx){
      return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.white,   // drawer icon rangi
          ),
          backgroundColor: Color.fromRGBO(40, 15, 50, 1),
          title: Text("Profile",style: TextStyle(color: Colors.white),),
          actions: [
            IconButton(onPressed: (){
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> const HomePage(),));
            }, icon: Icon(Icons.arrow_right,),),
          ],
          elevation: 0,
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
                ]
            ),
          ),
          child: Column(
            children: [
              CircleAvatar(
                radius: 52,
                backgroundImage: AssetImage("assets/images/23.jpg"),
              ),
              Text(
                "John Abram",
                style: TextStyle(
                    fontSize: 28, color: Colors.white, fontWeight: FontWeight.bold),
              ),
              Text(
                "JohnAbram@gmail.com",
                style: TextStyle(
                    fontSize: 16, color: Colors.white, fontWeight: FontWeight.w400),
              ),
              SizedBox(height: 20,),
          itemOfLifeIndexCircular(context,lifeindexController),
              SizedBox(height: 5,),
              Expanded(
                  child: Container(
                margin: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white70,
                ),
              ),
              ),
            ],
          ),
        ),
      );
    });
  }
}

