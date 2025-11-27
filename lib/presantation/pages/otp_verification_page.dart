import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:lifeosai/presantation/pages/support_page/sucsses_opt_page.dart';


class OtpVerificationPage extends StatefulWidget {
  const OtpVerificationPage({super.key});

  @override
  State<OtpVerificationPage> createState() => _OtpVerificationPageState();
}

class _OtpVerificationPageState extends State<OtpVerificationPage> {
  final List<TextEditingController> _controllers = List.generate(
    5,
        (index) => TextEditingController(),
  );
  final List<FocusNode> _focusNodes = List.generate(
    5,
        (index) => FocusNode(),
  );

  int _timer = 60;
  bool _canResend = false;
  bool _isVerified = false;
  Timer? _countdownTimer;
  String _contactType = 'email';
  String _contactValue = 'user@example.com';
  late List<int> _correctCode;

  @override
  void initState() {
    super.initState();
    _correctCode = _generateRandomCode();
    _startTimer();
  }

  @override
  void dispose() {
    _countdownTimer?.cancel();
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var node in _focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  List<int> _generateRandomCode() {
    final random = Random();
    return List.generate(5, (index) => random.nextInt(10));
  }

  void _startTimer() {
    _countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_timer > 0) {
        setState(() {
          _timer--;
        });
      } else {
        setState(() {
          _canResend = true;
        });
        timer.cancel();
      }
    });
  }

  void handleChange(int index, String value) {
    if (_isVerified) return;

    if (value.isEmpty) {
      // Backspace bosilgan
      _controllers[index].text = '';

      // Oldingi inputga o'tish va uni ham o'chirish
      if (index > 0) {
        _focusNodes[index - 1].requestFocus();
      }
    } else if (value.isNotEmpty && RegExp(r'^\d$').hasMatch(value)) {
      _controllers[index].text = value;

      // Keyingi inputga o'tish
      if (index < 4) {
        _focusNodes[index + 1].requestFocus();
      } else {
        // Oxirgi input to'ldirilganda klaviaturani yopish
        _focusNodes[index].unfocus();
      }

      // Hammasi to'ldirilganda tekshirish
      _checkCode();
    }
  }

  void _checkCode() {
    String enteredCode = _controllers.map((c) => c.text).join();
    String correctCodeStr = _correctCode.join();

    if (enteredCode.length == 5 && enteredCode == correctCodeStr) {
      setState(() {
        _isVerified = true;
      });
      _showSuccessToast();
    }
  }

  void _showSuccessToast() {
    final overlay = Overlay.of(context);
    final overlayEntry = OverlayEntry(
      builder: (context) => SuccessToast(),
    );

    overlay.insert(overlayEntry);

    // 3 sekunddan keyin toast ni o'chirish
    Future.delayed(const Duration(seconds: 3), () {
      overlayEntry.remove();
    });
  }


  void _handleResend() {
    setState(() {
      for (var controller in _controllers) {
        controller.clear();
      }
      _timer = 60;
      _canResend = false;
      _isVerified = false;
      _correctCode = _generateRandomCode();
    });
    _focusNodes[0].requestFocus();
    _startTimer();
  }

  String _formatTime(int seconds) {
    int mins = seconds ~/ 60;
    int secs = seconds % 60;
    return '$mins:${secs.toString().padLeft(2, '0')}';
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFFE0E7FF),
              Color(0xFFFAF5FF),
              Color(0xFFFCE7F3),
            ],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              children: [
                // Orqaga tugmasi
                Align(
                  alignment: Alignment.centerLeft,
                  child: TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.arrow_back, color: Colors.black87),
                    label: const Text(
                      'Orqaga',
                      style: TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                // Main Card
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Icon
                        Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [Color(0xFF6366F1), Color(0xFF9333EA)],
                            ),
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.indigo.withOpacity(0.3),
                                blurRadius: 15,
                                offset: const Offset(0, 5),
                              ),
                            ],
                          ),
                          child: Icon(
                            _contactType == 'email'
                                ? Icons.email_outlined
                                : Icons.phone_outlined,
                            size: 40,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 24),
                        // Title
                        Text(
                          'Kodni tasdiqlang',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(height: 12),
                        // Description
                        Text(
                          _contactType == 'email'
                              ? '$_contactValue  manziliga yuborilgan\n5 raqamli kodni kiriting'
                              : '$_contactValue raqamiga yuborilgan\n5 raqamli kodni kiriting',
                          textAlign: TextAlign.center,
                          style:  TextStyle(
                            fontSize: 15,
                            color: Colors.black54,
                          ),
                        ),
                        const SizedBox(height: 32),

                        // Verification result
                        if (_isVerified)
                          Container(
                            padding: const EdgeInsets.all(16),
                            margin: const EdgeInsets.only(bottom: 24),
                            decoration: BoxDecoration(
                              color: const Color(0xFFF0FDF4),
                              border: Border.all(
                                color: const Color(0xFFBBF7D0),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.check_circle,
                                  color: Color(0xFF22C55E),
                                  size: 24,
                                ),
                                SizedBox(width: 8),
                                Text(
                                  'Kod tasdiqlandi!',
                                  style: TextStyle(
                                    color: Color(0xFF15803D),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ),

                        // OTP inputs
                        Container(
                          width: double.infinity,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(5, (index) {
                              return Expanded(
                                child: Container(
                                  width: double.infinity,
                                  height: 64,
                                  margin: const EdgeInsets.symmetric(horizontal: 6),
                                  decoration: BoxDecoration(
                                    gradient: _isVerified
                                        ? const LinearGradient(
                                      colors: [
                                        Color(0xFF4ADE80),
                                        Color(0xFF10B981)
                                      ],
                                    )
                                        : _controllers[index].text.isNotEmpty
                                        ? const LinearGradient(
                                      colors: [
                                        Color(0xFFEEF2FF),
                                        Color(0xFFFAF5FF)
                                      ],
                                    )
                                        : null,
                                    color: _isVerified ||
                                        _controllers[index].text.isNotEmpty
                                        ? null
                                        : Colors.white,
                                    borderRadius: BorderRadius.circular(16),
                                    border: Border.all(
                                      color: _isVerified
                                          ? const Color(0xFF22C55E)
                                          : _controllers[index].text.isNotEmpty
                                          ? const Color(0xFFA5B4FC)
                                          : const Color(0xFFE5E7EB),
                                      width: 2,
                                    ),
                                    boxShadow: _isVerified
                                        ? [
                                      BoxShadow(
                                        color: Colors.green.withOpacity(0.3),
                                        blurRadius: 10,
                                        offset: const Offset(0, 4),
                                      ),
                                    ]
                                        : null,
                                  ),
                                  child: TextField(
                                    controller: _controllers[index],
                                    focusNode: _focusNodes[index],
                                    enabled: !_isVerified,
                                    textAlign: TextAlign.center,
                                    keyboardType: TextInputType.number,
                                    maxLength: 1,
                                    style: TextStyle(
                                      fontSize: 32,
                                      fontWeight: FontWeight.bold,
                                      color: _isVerified
                                          ? Colors.white
                                          : Colors.black87,
                                    ),
                                    decoration: const InputDecoration(
                                      counterText: '',
                                      border: InputBorder.none,
                                    ),
                                    onChanged: (value) =>
                                        handleChange(index, value),
                                    onTap: () {
                                      if (_controllers[index].text.isNotEmpty) {
                                        _controllers[index].selection =
                                            TextSelection.fromPosition(
                                              TextPosition(
                                                  offset: _controllers[index]
                                                      .text
                                                      .length),
                                            );
                                      }
                                    },
                                  ),
                                ),
                              );
                            }),
                          ),
                        ),
                        const SizedBox(height: 32),

                        // Timer and resend button
                        if (!_canResend)
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  color: const Color(0xFFEEF2FF),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: const Icon(
                                  Icons.timer_outlined,
                                  color: Color(0xFF6366F1),
                                  size: 20,
                                ),
                              ),
                              const SizedBox(width: 12),
                              Text(
                                'Qayta yuborish: ',
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                _formatTime(_timer),
                                style: const TextStyle(
                                  color: Color(0xFF6366F1),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),

                            ],
                          )
                        else
                          GestureDetector(
                            onTap: (){
                              _handleResend();
                            },
                            child: const Text(
                              'Kodni qayta yuborish',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF6366F1),
                              ),
                            ),
                          ),
                        const SizedBox(height: 24),

                        // Debug info
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: const Color(0xFFF9FAFB),
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                              color: const Color(0xFFE5E7EB),
                            ),
                          ),
                          child: Column(
                            children: [
                              const Text(
                                "Test uchun: To'g'ri kod",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.black45,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                _correctCode.join(),
                                style: const TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
                                  letterSpacing: 4,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 24),
                        if(_isVerified)
                          GestureDetector(
                            onTap: () {
                              SuccessToast.show(
                                context,
                                title: 'Muvaffaqiyatli!',
                                message: 'Kod tasdiqlandi ✓',
                                duration: const Duration(seconds: 3),
                              );
                            },
                            child: Container(
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: Colors.indigo,
                              ),
                              child: Center(
                                child: Text(
                                  "Ro'yxatdan o'tish",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                        const SizedBox(height: 24,),
                        // Help text
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Kod kelmadimi? ',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.black45,
                              ),
                            ),
                            TextButton(
                              onPressed: () {},
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.zero,
                                minimumSize: const Size(0, 0),
                                tapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                              ),
                              child:  Text(
                                'Yordam olish',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF6366F1),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
