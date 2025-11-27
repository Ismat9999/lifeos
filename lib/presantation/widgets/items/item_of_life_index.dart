import 'package:flutter/material.dart';

import '../../../domain/models/profile_models.dart';

Widget itemOfLifeIndex(BuildContext context,Profile member) {
  return Container(
    padding: EdgeInsets.all(10),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      color: Colors.white30
    ),
    child:
    Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Life Index', style: TextStyle(color: Colors.white70, fontSize: 12)),
        ],
      ),
      const SizedBox(height: 6),
      Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
        Text('${member.lifeIndex}', style: const TextStyle(color:Colors.white,fontSize: 28, fontWeight: FontWeight.bold)),
        const SizedBox(width: 6),
        const Text('/100', style: TextStyle(color: Colors.white70)),
      ]),
      const SizedBox(height: 8),
      Container(
        width: double.infinity,
        height: 5,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(0.25),
        ),
        child: LinearProgressIndicator(value: (member.lifeIndex.clamp(0, 100)) / 100),
      )
    ]),
  );
}