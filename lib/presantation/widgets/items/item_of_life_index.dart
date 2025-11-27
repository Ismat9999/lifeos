// import 'dart:convert';
// import 'dart:math' as math;
//
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
//
// import '../../../domain/models/profile_models.dart';
//
// Widget itemOfLifeIndex(BuildContext context, Profile member) {
//   double lifeIndex = 0;
//   bool isLoading = false;
//   String statusText = '';
//   Color statusColor = Colors.grey;
//
//   void updateStatus() {
//     if (lifeIndex >= 0 && lifeIndex <= 40) {
//       statusText = 'Past daraja';
//       statusColor = Colors.red;
//     } else if (lifeIndex > 40 && lifeIndex <= 70) {
//       statusText = "O'rta daraja";
//       statusColor = Colors.orange;
//     } else if (lifeIndex > 70 && lifeIndex <= 100) {
//       statusText = 'Yuqori daraja';
//       statusColor = Colors.green;
//     }
//   }
//
//
//   return Container(
//     width: MediaQuery.of(context).size.width,
//     height: 220,
//     decoration: BoxDecoration(
//       color: Colors.white,
//       borderRadius: BorderRadius.circular(15),
//     ),
//     child: Column(
//         children: [
//       // Asosiy karta
//       Column(
//         children: [
//           // Circle Progress Indicator
//           Container(
//             margin: EdgeInsets.symmetric(vertical: 10),
//             width: 200,
//             height: 200,
//             child: CustomPaint(
//               painter: CircleProgressPainter(
//                 progress: lifeIndex / 100,
//                 color: statusColor,
//               ),
//               child: Center(
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text(
//                       '${lifeIndex.toInt()}',
//                       style: TextStyle(
//                         fontSize: 48,
//                         fontWeight: FontWeight.bold,
//                         color: statusColor,
//                       ),
//                     ),
//                     Text(
//                       '%',
//                       style: TextStyle(
//                         fontSize: 20,
//                         color: Colors.grey[600],
//                       ),
//                     ),
//                     const SizedBox(height: 8),
//                     Text(
//                       statusText,
//                       style: TextStyle(
//                         fontSize: 14,
//                         color: Colors.grey[700],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       )
//     ]),
//   );
// }
//
// class CircleProgressPainter extends CustomPainter {
//   final double progress;
//   final Color color;
//   final double strokeWidth;
//
//   CircleProgressPainter({
//     required this.progress,
//     required this.color,
//     this.strokeWidth = 12,
//   });
//
//   @override
//   void paint(Canvas canvas, Size size) {
//     final center = Offset(size.width / 2, size.height / 2);
//     final radius = (size.width - strokeWidth) / 2;
//
//     // Background circle
//     final backgroundPaint = Paint()
//       ..color = Colors.grey[200]!
//       ..strokeWidth = strokeWidth
//       ..style = PaintingStyle.stroke
//       ..strokeCap = StrokeCap.round;
//
//     canvas.drawCircle(center, radius, backgroundPaint);
//
//     // Progress circle
//     final progressPaint = Paint()
//       ..color = color
//       ..strokeWidth = strokeWidth
//       ..style = PaintingStyle.stroke
//       ..strokeCap = StrokeCap.round;
//
//     const startAngle = -math.pi / 2;
//     final sweepAngle = 2 * math.pi * progress;
//
//     canvas.drawArc(
//       Rect.fromCircle(center: center, radius: radius),
//       startAngle,
//       sweepAngle,
//       false,
//       progressPaint,
//     );
//   }
//
//   @override
//   bool shouldRepaint(CircleProgressPainter oldDelegate) {
//     return oldDelegate.progress != progress || oldDelegate.color != color;
//   }
// }
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:lifeosai/presantation/controllers/lifeindex_controller.dart';
import 'package:lottie/lottie.dart';

import '../../../domain/models/life_index_circular_model.dart';

Widget itemOfLifeIndexCircular(BuildContext context,LifeIndexController lifeindexController){
  return Center(
    child: Obx(() {
      if (lifeindexController.loading.value) {
        return  Lottie.asset(
          width: 100,
          height: 100,
          "assets/lotties/lottie2lifeindex.json"
        );
      }

      int index = lifeindexController.lifeIndex.value;

      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomPaint(
            painter: LifeIndexPainter(
              value: index,
              color: lifeindexController.getColor(index),
            ),
            child: SizedBox(
              width: 160,
              height: 160,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "$index",
                      style: const TextStyle(
                        fontSize: 48,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      lifeindexController.getStatus(index),
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          const SizedBox(height: 10),

          ElevatedButton(
            onPressed: lifeindexController.fetchLifeIndex,
            child: const Text("Update (Test)"),
          )
        ],
      );
    }),
  );
}