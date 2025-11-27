import 'package:flutter/material.dart';
import 'package:lifeosai/presantation/pages/home_page.dart';
import 'package:lifeosai/presantation/widgets/items/item_of_translate_language.dart';
import '../../controllers/drawer_controller.dart';

Widget itemBuildMenuItems(BuildContext context,NavigationDrawController drawerController){
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
          onTap: (){
            drawerController.callProfilePage();
          },
        ),
        ListTile(
          leading: const Icon(Icons.settings,color: Colors.white,),
          title: const Text("Settings",style: TextStyle(color: Colors.white),),
          onTap: (){
            drawerController.callSettingpage();
          },
        ),
        ListTile(
          leading: const Icon(Icons.translate_outlined,color: Colors.white,),
          title: Text("Language",style: TextStyle(color: Colors.white),),
          onTap: (){
            itemOfLanguageTranslate(context);
          },
        ),
        Divider(color: Colors.white30,),
      ],
  );
}