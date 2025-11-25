import 'package:flutter/material.dart';
import 'package:lifeosai/presantation/pages/home_page.dart';

Widget itemBuildMenuItems(BuildContext context){
  return Wrap(
      runSpacing: 16,
      children: [
        ListTile(
          leading: const Icon(Icons.home_outlined,color: Colors.white,),
          title: const Text("Home",style: TextStyle(color: Colors.white),),
          onTap: (){
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> const HomePage(),));
          },
        ),
        ListTile(
          leading: const Icon(Icons.person_2_outlined,color: Colors.white,),
          title: const Text("Profile",style: TextStyle(color: Colors.white),),
          onTap: (){},
        ),
        ListTile(
          leading: const Icon(Icons.notifications_outlined,color: Colors.white,),
          title: const Text("Notifications",style: TextStyle(color: Colors.white),),
          onTap: (){},
        ),
        Divider(color: Colors.white30,),
      ],
  );
}