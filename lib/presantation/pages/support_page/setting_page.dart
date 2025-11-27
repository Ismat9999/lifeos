import 'package:flutter/material.dart';

import '../home_page.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white,   // drawer icon rangi
        ),
        backgroundColor: Color.fromRGBO(40, 15, 50, 1),
        title: Text("Settings",style: TextStyle(color: Colors.white),),
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Sozlamalar",style: TextStyle(color: Colors.white,fontSize:20,fontWeight: FontWeight.bold),),
            Divider(),
            Container(
              child:
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                   Text("Chat sozlamar",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700),),
                  Icon(Icons.arrow_forward_ios,color: Colors.white,)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
