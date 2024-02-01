import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_app/app/modules/register-pinjol/views/register_pinjol_step1_view.dart';
import 'package:mobile_app/app/modules/register-pinjol/views/register_pinjol_step2.dart';
import 'package:mobile_app/resources/colors.dart';
import '../controllers/register_pinjol_controller.dart';

class RegisterPinjolView extends StatefulWidget {
  const RegisterPinjolView({Key? key}) : super(key: key);

  @override
  State<RegisterPinjolView> createState() => _RegisterPinjolViewState();
}

class _RegisterPinjolViewState extends State<RegisterPinjolView> {
  final controller = Get.put(RegisterPinjolController());

  @override
  void initState() {
    super.initState();
    controller.init();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegisterPinjolController>(
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.primary,
            title: const Text(
              'PINJAMAN ONLINE',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          body: SingleChildScrollView(
            controller: ScrollController(),
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Stepper(
                    steps: [
                      Step(
                        title: Text(
                          'BIODATA',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: controller.index == 0 || controller.index > 0
                                ? AppColors.primary
                                : Colors.grey,
                          ),
                        ),
                        content: const RegisterStep1(),
                        isActive: controller.index == 0 || controller.index > 0
                            ? true
                            : false,
                        state: controller.index > 0
                            ? StepState.complete
                            : StepState.disabled,
                      ),
                      Step(
                        title: Text(
                          'FOTO KTP',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: controller.index == 1 || controller.index > 1
                                ? AppColors.primary
                                : Colors.grey,
                          ),
                        ),
                        content: const RegosterStep2(),
                        isActive: controller.index == 1 || controller.index > 1
                            ? true
                            : false,
                        state: controller.index > 1
                            ? StepState.complete
                            : StepState.disabled,
                      ),
                      Step(
                        title: Text(
                          'HASIL',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: controller.index == 2 || controller.index > 2
                                ? AppColors.primary
                                : Colors.grey,
                          ),
                        ),
                        content: const Text("Ini adalah langkah 3"),
                        isActive: controller.index == 2 || controller.index > 2
                            ? true
                            : false,
                        state: controller.index > 2
                            ? StepState.complete
                            : StepState.disabled,
                      ),
                    ],
                    type: StepperType.horizontal,
                    currentStep: controller.index,
                    connectorThickness: 3,
                    controlsBuilder: (context, details) {
                      return const SizedBox.shrink();
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
