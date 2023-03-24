import 'package:badal/common/const/colors.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CostomTextFormField extends StatelessWidget {
  final String? hintText;
  final String? errorText;
  final bool obscureText;
  final bool autoFocus;
  final ValueChanged<String>? onChanged;

  const CostomTextFormField(
      {this.hintText,
      this.errorText,
      this.obscureText = false,
      this.autoFocus = false,
      required this.onChanged,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    const baseBorder = OutlineInputBorder(
        borderSide: BorderSide(color: inputBorderColor, width: 1.0));
    return TextFormField(
      cursorColor: priMaryColor,
      obscureText: obscureText,
      autofocus: autoFocus,
      onChanged: onChanged,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(20),
        hintText: hintText,
        hintStyle: TextStyle(
          color: bodyTextColor,
          fontSize: 14.0,
        ),
        errorText: errorText,
        fillColor: inputBgColor,
        filled: true,
        border: baseBorder,
        enabledBorder: baseBorder,
        focusedBorder: baseBorder.copyWith(
          borderSide: baseBorder.borderSide.copyWith(
            color: priMaryColor,
          ),
        ),
      ),
    );
  }
}
