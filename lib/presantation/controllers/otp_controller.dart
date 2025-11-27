import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OtpController extends GetxController{
  final List<TextEditingController> otpcontrollers = List.generate(
    5,
        (index) => TextEditingController(),
  );
  final List<FocusNode> focusNodes = List.generate(
    5,
        (index) => FocusNode(),
  );

  int _timer = 60.obs();
  bool canResend = false;
  bool isLoading = false.obs();
  bool isVerified = false;
  Timer? countdownTimer;
  String contactType = 'email';
  String contactValue = 'user@example.com';
  late List<int> correctCode;


  @override
  void dispose() {
    countdownTimer?.cancel();
    for (var controller in otpcontrollers) {
      controller.dispose();
    }
    for (var node in focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  List<int> generateRandomCode() {
    final random = Random();
    return List.generate(5, (index) => random.nextInt(10));
  }

  void startTimer() {
    _timer= 60;
    canResend = false;

    countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_timer > 0) {
        _timer--;
      } else {
        canResend = true;
        timer.cancel();
      }
    });
  }

  void handleChange(int index, String value) {
    if (isVerified) return;

    if (value.isEmpty) {
      // Backspace bosilgan
      otpcontrollers[index].text = '';

      // Oldingi inputga o'tish va uni ham o'chirish
      if (index > 0) {
        focusNodes[index - 1].requestFocus();
      }
    } else if (value.isNotEmpty && RegExp(r'^\d$').hasMatch(value)) {
     otpcontrollers[index].text = value;

      // Keyingi inputga o'tish
      if (index < 4) {
        focusNodes[index + 1].requestFocus();
      } else {
        // Oxirgi input to'ldirilganda klaviaturani yopish
        focusNodes[index].unfocus();
      }

      // Hammasi to'ldirilganda tekshirish
      checkCode();
    }
  }

  void checkCode() {
    String enteredCode = otpcontrollers.map((c) => c.text).join();
    String correctCodeStr = correctCode.join();

    if (enteredCode.length == 5 && enteredCode == correctCodeStr) {

        isVerified = true;
        update();
    }
  }


  void handleResend() {
    isLoading=true;
    update();
    for (var controller in otpcontrollers) {
      controller.clear();
    }
    _timer = 60;
    canResend = false;
    isVerified = false;
    correctCode = generateRandomCode();
    focusNodes[0].requestFocus();
    startTimer();

    isLoading=false;
    update();
  }

  String formatTime(int seconds) {
    int mins = seconds ~/ 60;
    int secs = seconds % 60;
    return '$mins:${secs.toString().padLeft(2, '0')}';
  }
}