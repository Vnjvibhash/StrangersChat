import 'package:flutter/material.dart';

class OtpBox extends StatelessWidget {
  final TextEditingController controller;

  const OtpBox({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.12,
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        maxLength: 1,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 24,
        ),
        decoration: InputDecoration(
          counterText: "",
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
              color: Colors.white,
              width: 2,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
              color: Colors.green,
              width: 2,
            ),
          ),
        ),
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus(); 
          }
        },
      ),
    );
  }
}
