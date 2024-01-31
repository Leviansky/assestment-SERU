// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class RegisterStep1 extends StatefulWidget {
  const RegisterStep1({Key? key}) : super(key: key);

  @override
  State<RegisterStep1> createState() => _RegisterStep1State();
}

class _RegisterStep1State extends State<RegisterStep1> {
  @override
  Widget build(BuildContext context) {
    return Text(
      'Text',
      style: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
