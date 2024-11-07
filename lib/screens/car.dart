import 'package:car_controller_app/controllers/get_car.dart';
import 'package:car_controller_app/components/core/app_assets.dart';
import 'package:car_controller_app/components/core/app_colors.dart';
import 'package:car_controller_app/components/widget/car_part.dart';
import 'package:car_controller_app/components/widget/customText.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Car extends StatelessWidget {
  Car({super.key});

  final GetCar controller = Get.put(GetCar());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
              AppColors.primaryBlue,
              AppColors.primaryBlackColor,
            ])),
        child: Column(
          children: [
            Expanded(
                flex: 4,
                child: Stack(
                  children: [
                    Positioned(
                      top: 100,
                      left: 50,
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          height: 300,
                          width: 350,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(AppAssets.car))),
                        ),
                      ),
                    ),
                    Positioned(
                        top: 70,
                        left: 30,
                        right: 30,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const CustomText(
                              text: "Ferrari",
                              fontWeight: FontWeight.bold,
                              letterSpacing: 8.0,
                              fontSize: 30,
                            ),
                            InkWell(
                              child: Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.lightGrey,
                                ),
                                child: const Center(
                                  child: Icon(
                                    Icons.sunny,
                                    color: AppColors.primaryWhiteColor,
                                  ),
                                ),
                              ),
                            )
                          ],
                        )),
                    Positioned(
                      top: 120,
                      left: 25,
                      child: CustomText(
                        text: "Blue 488 Spider",
                        fontWeight: FontWeight.bold,
                        letterSpacing: 3.0,
                        textColor: AppColors.primaryWhiteColor.withOpacity(.5),
                        fontSize: 20,
                      ),
                    )
                  ],
                )),
            Expanded(
                flex: 5,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CustomText(
                        text: "CONTROLS",
                        fontWeight: FontWeight.bold,
                        letterSpacing: 3.0,
                        fontSize: 30,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Obx(
                            () => CarPart(
                                name: "Engine",
                                state: controller.engin.value,
                                onTap: () => controller.setEngine()),
                          ),
                          Obx(
                            () => CarPart(
                                name: "Door",
                                state: controller.door.value,
                                onTap: () => controller.setDoor()),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Obx(
                            () => CarPart(
                                name: "Trunk",
                                state: controller.trunk.value,
                                onTap: () => controller.setTrunk()),
                          ),
                          Obx(
                            () => CarPart(
                                name: "Climate",
                                state: controller.climate.value,
                                onTap: () => controller.setClimate()),
                          )
                        ],
                      )
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
