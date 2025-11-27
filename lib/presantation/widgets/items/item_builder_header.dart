import 'package:flutter/material.dart';

import '../../controllers/drawer_controller.dart';

Widget itemBuilderHeader(BuildContext context,NavigationDrawController drawerController) {
  return InkWell(
    onTap: () {},
    child: Container(
      padding:
          EdgeInsets.only(top: MediaQuery.of(context).padding.top, bottom: 24),
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
          SizedBox(
            height: 10,
          ),
          Divider(
            color: Colors.white30,
          ),
        ],
      ),
    ),
  );
}
