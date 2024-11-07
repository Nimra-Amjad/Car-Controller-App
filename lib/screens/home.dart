import 'package:car_controller_app/controllers/get_navigation.dart';
import 'package:car_controller_app/components/core/app_colors.dart';
import 'package:floating_frosted_bottom_bar/app/frosted_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'car.dart';
import 'climate.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var light = false;
  var index = 0;
  GetNavigationBar controller = Get.put(GetNavigationBar());

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        child: Scaffold(
          body: FrostedBottomBar(
            borderRadius: BorderRadius.circular(50),
            bottom: 10,
            opacity: 1,
            curve: Curves.easeInOut,
            bottomBarColor: AppColors.lightBlue.withOpacity(.1),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: TabBar(
                onTap: (value) {
                  controller.setIndex(value);
                },
                indicatorColor: AppColors.primaryOrangeColor,
                indicatorPadding: const EdgeInsets.symmetric(vertical: -8),
                indicatorSize: TabBarIndicatorSize.label,
                tabs: [
                  Obx(() => tabItem(controller.index.value == 0, Icons.home)),
                  Obx(
                    () => tabItem(
                        controller.index.value == 1, Icons.control_camera),
                  ),
                  Obx(() => tabItem(controller.index.value == 2,
                      Icons.notification_add_outlined)),
                  Obx(() => tabItem(controller.index.value == 3, Icons.person))
                ],
              ),
            ),
            body: (context, controller) {
              return TabBarView(
                children: [
                  Car(),
                  Climate(),
                  Car(),
                  Climate(),
                ],
              );
            },
          ),
        ));
  }

  Widget tabItem(bool state, IconData icon) {
    return state
        ? Icon(key: UniqueKey(), icon, color: AppColors.primaryWhiteColor)
        : Icon(key: UniqueKey(), icon, color: AppColors.lightBlue);
  }
}
