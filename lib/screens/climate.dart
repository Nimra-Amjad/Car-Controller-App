import 'package:car_controller_app/controllers/get_climate.dart';
import 'package:car_controller_app/components/core/app_colors.dart';
import 'package:car_controller_app/components/widget/customText.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class Climate extends StatelessWidget {
  Climate({super.key});
  final GetClimate controller = Get.put(GetClimate());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 70, left: 20, right: 20),
        height: double.infinity,
        width: double.infinity,
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Center(
                  child: Icon(
                    Icons.arrow_back_ios_outlined,
                    color: AppColors.primaryWhiteColor,
                  ),
                ),
                const CustomText(
                  text: "Climate",
                  fontWeight: FontWeight.bold,
                  letterSpacing: 6.0,
                  fontSize: 27,
                ),
                InkWell(
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.lightBlue,
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
            ),
            const SizedBox(
              height: 30,
            ),
            Obx(
              () => Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  circleButton(Icons.autorenew, "Auto", controller.auto.value,
                      () {
                    controller.setAuto();
                  }),
                  circleButton(
                      Icons.ac_unit_rounded, "Cool", controller.cool.value, () {
                    controller.setCool();
                  }),
                  circleButton(Icons.electric_bolt, "Fan", controller.fan.value,
                      () {
                    controller.setFan();
                  }),
                  circleButton(Icons.sunny, "Heat", controller.heat.value, () {
                    controller.setHeat();
                  }),
                ],
              ),
            ),
            const Spacer(),
            Obx(
              () => SleekCircularSlider(
                innerWidget: (percentage) {
                  return Align(
                      alignment: Alignment.center,
                      child: SizedBox(
                        height: 60,
                        width: double.infinity,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CustomText(
                              text: percentage.toInt().toString(),
                              fontWeight: FontWeight.bold,
                              letterSpacing: 3.0,
                              fontSize: 44,
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Container(
                                height: 15,
                                width: 15,
                                decoration: const BoxDecoration(
                                    color: AppColors.primaryWhiteColor,
                                    shape: BoxShape.circle),
                              ),
                            )
                          ],
                        ),
                      ));
                },
                appearance: CircularSliderAppearance(
                  customColors: CustomSliderColors(
                    gradientEndAngle: 100,
                    gradientStartAngle: 100,
                    trackColors: [
                      AppColors.primaryBlackColor,
                      AppColors.primaryRedColor,
                      AppColors.primaryWhiteColor,
                      AppColors.primaryGreenColor,
                      AppColors.primaryLimeAccentColor,
                      AppColors.primaryPinkAccentColor,
                      AppColors.primaryRedColor,
                      AppColors.primaryWhiteColor,
                      AppColors.primaryGreenColor,
                      AppColors.primaryLimeAccentColor,
                      AppColors.primaryPinkAccentColor,
                      AppColors.primaryRedColor,
                      AppColors.primaryWhiteColor,
                      AppColors.primaryGreenColor,
                      AppColors.primaryLimeAccentColor,
                      AppColors.primaryPinkAccentColor
                    ],
                    shadowColor: AppColors.lightBlue,
                    progressBarColors: [
                      AppColors.primaryBlackColor,
                      AppColors.primaryRedColor,
                      AppColors.primaryWhiteColor,
                      AppColors.primaryGreenColor,
                      AppColors.primaryLimeAccentColor,
                      AppColors.primaryPinkAccentColor,
                      AppColors.primaryRedColor,
                      AppColors.primaryWhiteColor,
                      AppColors.primaryGreenColor,
                      AppColors.primaryLimeAccentColor,
                      AppColors.primaryPinkAccentColor,
                      AppColors.primaryRedColor,
                      AppColors.primaryWhiteColor,
                      AppColors.primaryGreenColor,
                      AppColors.primaryLimeAccentColor,
                      AppColors.primaryPinkAccentColor
                    ],
                    shadowMaxOpacity: 10,
                    dotColor: AppColors.primaryRedColor,
                    dynamicGradient: true,
                  ),
                  animationEnabled: true,
                  counterClockwise: true,
                  size: 280,
                  spinnerMode: false,
                  startAngle: 0,
                  angleRange: 359,
                ),
                initialValue: controller.value.value,
                max: 100,
                min: 0.0,
                onChange: (value) async {
                  controller.setValue(value);
                },
              ),
            ),
            const Spacer(),
            Obx(() => Container(
                  padding: const EdgeInsets.only(right: 20),
                  height: 120,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: controller.ac.value
                              ? AppColors.lightBlue
                              : AppColors.primaryBlue.withOpacity(.1),
                          blurRadius: controller.ac.value ? 40 : 0,
                        )
                      ],
                      borderRadius: BorderRadius.circular(15),
                      color: controller.ac.value
                          ? AppColors.lightBlue
                          : AppColors.primaryBlue.withOpacity(.1)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomText(
                            text:
                                controller.ac.value ? "AC is on" : "AC is off",
                            fontWeight: FontWeight.bold,
                            letterSpacing: 3.0,
                            fontSize: 21,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomText(
                            text:
                                "   Currently ${controller.value.value.ceil()} C",
                            fontWeight: FontWeight.bold,
                            letterSpacing: 3.0,
                            textColor:
                                AppColors.primaryWhiteColor.withOpacity(0.5),
                            fontSize: 15,
                          ),
                        ],
                      ),
                      Transform.scale(
                        scale: 1.5,
                        child: Switch(
                          activeTrackColor: AppColors.primaryBlue,
                          activeColor: AppColors.lightBlue,
                          value: controller.ac.value,
                          onChanged: (value) => controller.setAc(),
                        ),
                      )
                    ],
                  ),
                )),
            const Spacer(),
          ],
        ),
      ),
    );
  }

  Widget circleButton(
      IconData icon, String text_, bool state, VoidCallback onTap) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          child: Container(
            height: 45,
            width: 45,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: AppColors.lightBlue,
                  blurRadius: state ? 20 : 0,
                )
              ],
              color: state ? AppColors.lightBlue : AppColors.primaryBlue,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Icon(
                icon,
                color: AppColors.primaryWhiteColor,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 6,
        ),
        CustomText(
          text: text_,
          fontWeight: FontWeight.bold,
          letterSpacing: 3.0,
          fontSize: 13,
        ),
      ],
    );
  }
}
