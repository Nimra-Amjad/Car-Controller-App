import 'package:car_controller_app/components/core/app_assets.dart';
import 'package:car_controller_app/components/core/app_colors.dart';
import 'package:car_controller_app/components/widget/customText.dart';
import 'package:car_controller_app/screens/home.dart';
import 'package:car_controller_app/components/widget/button.dart';
import 'package:flutter/material.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 45,
              ),
              Image.asset(
                AppAssets.logo,
                color: AppColors.blueGrey,
                width: 100,
                height: 100,
              ),
              const SizedBox(
                height: 20,
              ),
              const CustomText(
                text: "Control Your Car",
                fontWeight: FontWeight.bold,
                letterSpacing: 8.0,
                fontSize: 26,
              ),
              const SizedBox(
                height: 20,
              ),
              const CustomText(
                text:
                    "You can remotely check the fuel, battery and service status or log your journeys, including start/end location, distance and duration.",
                fontWeight: FontWeight.w400,
                letterSpacing: 0.0,
                fontSize: 18,
              ),
              Expanded(flex: 1, child: Image.asset(AppAssets.car)),
              AppButton(
                btnText: "Get Started",
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Home()));
                },
              ),
              const SizedBox(
                height: 80,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
