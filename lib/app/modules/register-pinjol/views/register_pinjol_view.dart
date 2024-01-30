import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../resources/colors.dart';
import '../controllers/register_pinjol_controller.dart';

class RegisterPinjolView extends StatefulWidget {
  const RegisterPinjolView({Key? key}) : super(key: key);

  @override
  State<RegisterPinjolView> createState() => _RegisterPinjolViewState();
}

class _RegisterPinjolViewState extends State<RegisterPinjolView> {
  final controller = Get.put(RegisterPinjolController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Example'),
      ),
      body: Text('Example'),
    );
  }
}
