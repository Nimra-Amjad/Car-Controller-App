import 'package:car_controller_app/components/core/app_colors.dart';
import 'package:car_controller_app/components/widget/customText.dart';
import 'package:flutter/material.dart';

class CarPart extends StatelessWidget {
  final bool state;
  final String name;
  final VoidCallback onTap;
  const CarPart(
      {super.key,
      required this.state,
      required this.name,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10),
      height: 150,
      width: 180,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: state ? Colors.blue : Colors.transparent,
              blurRadius: state ? 50 : 0,
            )
          ],
          color: state ? Colors.blue : Colors.black.withOpacity(.5),
          borderRadius: BorderRadius.circular(20)),
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: name,
                fontWeight: FontWeight.bold,
                letterSpacing: 3.0,
                fontSize: 22,
              ),
              const SizedBox(
                height: 10,
              ),
              CustomText(
                text: state ? "Opened" : "Closed",
                fontWeight: FontWeight.bold,
                letterSpacing: 3.0,
                textColor: AppColors.primaryWhiteColor.withOpacity(0.5),
                fontSize: 18,
              ),
            ],
          ),
          const Spacer(),
          Transform.rotate(
            angle: -1.6,
            child: Transform.scale(
              scaleX: 1.5,
              scaleY: 1.5,
              child: Switch(
                activeColor: Colors.blue,
                activeTrackColor: Colors.white,
                inactiveTrackColor: Colors.white.withOpacity(.1),
                value: state,
                onChanged: (value) => onTap(),
              ),
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
