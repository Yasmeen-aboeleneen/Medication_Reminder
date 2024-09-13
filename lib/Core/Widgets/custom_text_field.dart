// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hintText,
    required this.textEditingController,
    required this.maxLen,
    required this.keyboardType,
  });
  final String hintText;
  final TextInputType keyboardType;
  final TextEditingController textEditingController;
  final int maxLen;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      controller: textEditingController,
      textCapitalization: TextCapitalization.words,
      maxLength: maxLen,
      decoration: InputDecoration(
        enabledBorder:
            const OutlineInputBorder(borderSide: BorderSide(width: 2.5)),
        focusedBorder:
            const OutlineInputBorder(borderSide: BorderSide(width: 2.5)),
        hintText: hintText,
        hintStyle: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
      ),
      style: TextStyle(
        fontSize: 15.sp,
        fontWeight: FontWeight.normal,
      ),
    );
  }
}
