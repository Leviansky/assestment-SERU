import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../resources/colors.dart';
import '../controllers/example_controller.dart';

class ExampleView extends StatefulWidget {
  const ExampleView({ Key? key }) : super(key: key);

  @override
  State<ExampleView> createState() => _ExampleViewState();
}

class _ExampleViewState extends State<ExampleView> {

  final controller = Get.put(ExampleController());

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: AppBar(
        title: Text('Example'),
      ),
      body: Text('Example'),
    );
  }
  
}