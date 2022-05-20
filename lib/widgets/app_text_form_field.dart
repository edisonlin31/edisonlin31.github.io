import 'package:flutter/material.dart';

import '../utils/app_text_styles.dart';

class AppTextFormField extends StatelessWidget {
  final String? hintText;
  const AppTextFormField({this.hintText, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: AppTextStyles.regular(fontSize: 14),
      decoration: InputDecoration.collapsed(
        hintText: hintText,
      ),
    );
  }
}
