// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'dart:io';

import 'package:dashed_line/dashed_line.dart';
import 'package:flutter/material.dart';
import 'package:full_screen_image/full_screen_image.dart';
import 'package:get/get.dart';
import 'package:mobile_app/app/modules/register-pinjol/controllers/register_pinjol_controller.dart';
import 'package:mobile_app/resources/colors.dart';

class RegosterStep2 extends StatefulWidget {
  const RegosterStep2({Key? key}) : super(key: key);

  @override
  State<RegosterStep2> createState() => _RegosterStep2State();
}

class _RegosterStep2State extends State<RegosterStep2> {
  final controller = Get.put(RegisterPinjolController());

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Foto KTP',
          style: TextStyle(
            fontSize: 17,
            color: AppColors.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 15.0,
        ),
        Obx(
          () => controller.ktpImage.value == null
              ? GestureDetector(
                  onTap: () {
                    controller.getKTPImage();
                  },
                  child: Stack(
                    children: [
                      AspectRatio(
                        aspectRatio: 16 / 9,
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: DashedLine(
                            path: Path()
                              ..addRect(
                                Rect.fromPoints(
                                  const Offset(0, 0),
                                  Offset(
                                    MediaQuery.of(context).size.width,
                                    MediaQuery.of(context).size.width * 9 / 16,
                                  ),
                                ),
                              ),
                            color: controller.errorKTP.value
                                ? AppColors.error
                                : Colors.grey[700]!,
                            lineFit: LineFit.fill,
                            width: controller.errorKTP.value ? 3 : 1.5,
                          ),
                        ),
                      ),
                      Positioned.fill(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.add_circle_outline,
                              size: 60.0,
                              color: AppColors.primary,
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              'Upload Foto KTP',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey[700]!,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              : Stack(
                  children: [
                    AspectRatio(
                      aspectRatio: 16 / 9,
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: DashedLine(
                          path: Path()
                            ..addRect(
                              Rect.fromPoints(
                                const Offset(0, 0),
                                Offset(
                                  MediaQuery.of(context).size.width,
                                  MediaQuery.of(context).size.width * 9 / 16,
                                ),
                              ),
                            ),
                          color: Colors.grey[700]!,
                          lineFit: LineFit.fill,
                          width: 1.5,
                        ),
                      ),
                    ),
                    Positioned.fill(
                      child: FullScreenWidget(
                        disposeLevel: DisposeLevel.Low,
                        child: InteractiveViewer(
                          maxScale: 2.5,
                          minScale: 0.4,
                          child: Image.file(
                            File(controller.ktpImage.value?.path ?? ""),
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      right: 0,
                      bottom: 0,
                      child: GestureDetector(
                        onTap: () {
                          controller.ktpImage.value = null;
                        },
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            color: Colors.blue[400]!.withAlpha(150),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(10),
                            ),
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.delete,
                              size: 24.0,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        const Text(
          '* Data pada KTP harus terlihat dengan jelas',
          style: TextStyle(
            fontSize: 12,
            color: AppColors.primary,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(
          height: 20.0,
        ),
        const Text(
          'Foto Selfie + KTP',
          style: TextStyle(
            fontSize: 17,
            color: AppColors.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 15.0,
        ),
        Obx(
          () => controller.selfieImage.value == null
              ? GestureDetector(
                  onTap: () {
                    controller.getSelfieImage();
                  },
                  child: Stack(
                    children: [
                      AspectRatio(
                        aspectRatio: 16 / 9,
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: DashedLine(
                            path: Path()
                              ..addRect(
                                Rect.fromPoints(
                                  const Offset(0, 0),
                                  Offset(
                                    MediaQuery.of(context).size.width,
                                    MediaQuery.of(context).size.width * 9 / 16,
                                  ),
                                ),
                              ),
                            color: controller.errorSelfie.value
                                ? AppColors.error
                                : Colors.grey[700]!,
                            lineFit: LineFit.fill,
                            width: controller.errorSelfie.value ? 3 : 1.5,
                          ),
                        ),
                      ),
                      Positioned.fill(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.add_circle_outline,
                              size: 60.0,
                              color: AppColors.primary,
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              'Upload Foto Selfie',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey[700]!,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              : Stack(
                  children: [
                    AspectRatio(
                      aspectRatio: 16 / 9,
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: DashedLine(
                          path: Path()
                            ..addRect(
                              Rect.fromPoints(
                                const Offset(0, 0),
                                Offset(
                                  MediaQuery.of(context).size.width,
                                  MediaQuery.of(context).size.width * 9 / 16,
                                ),
                              ),
                            ),
                          color: Colors.grey[700]!,
                          lineFit: LineFit.fill,
                          width: 1.5,
                        ),
                      ),
                    ),
                    Positioned.fill(
                      child: FullScreenWidget(
                        disposeLevel: DisposeLevel.Low,
                        child: InteractiveViewer(
                          maxScale: 2.5,
                          minScale: 0.4,
                          child: Image.file(
                            File(controller.selfieImage.value?.path ?? ""),
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      right: 0,
                      bottom: 0,
                      child: GestureDetector(
                        onTap: () {
                          controller.selfieImage.value = null;
                        },
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            color: Colors.blue[400]!.withAlpha(150),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(10),
                            ),
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.delete,
                              size: 24.0,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        const Text(
          '* Data pada KTP harus terlihat dengan jelas',
          style: TextStyle(
            fontSize: 12,
            color: AppColors.primary,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(
          height: 20.0,
        ),
        Row(
          children: [
            Expanded(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: ContinuousRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    side: const BorderSide(
                      color: AppColors.primary,
                      width: 2,
                    ),
                  ),
                ),
                onPressed: () {
                  controller.goBack();
                },
                child: const Text(
                  'BACK',
                  style: TextStyle(
                    color: AppColors.primary,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 20.0,
            ),
            Expanded(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  shape: ContinuousRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                onPressed: () {
                  controller.goResult();
                },
                child: const Text(
                  'NEXT',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20.0,
        ),
      ],
    );
  }
}
