import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:one_app/feature/services/services_booking/presentation/view/services_booking_screen.dart';
import 'package:one_app/feature/services/services_category/presentation/view/services_category_screen.dart';
import 'package:one_app/feature/services/services_dashboard/presentation/controller/services_dashboard_controller.dart';
import 'package:one_app/feature/services/services_home/presentation/view/services_home_screen.dart';
import 'package:one_app/feature/services/services_save/presentation/view/services_save_screen.dart';
import 'package:one_app/res/color/app_color.dart';
import 'package:one_app/res/constant/constant_data.dart';

class ServicesDashboardScreen extends StatefulWidget {
  const ServicesDashboardScreen({super.key});

  @override
  State<ServicesDashboardScreen> createState() => _ServicesDashboardScreenState();
}

class _ServicesDashboardScreenState extends State<ServicesDashboardScreen> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  final DSVM = Get.put(ServicesDashboardController());


  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      // backgroundColor: Colors.transparent,
      bottomNavigationBar: Container(
        // margin: const EdgeInsets.all(2),
        height: size.width * .200,
        decoration: BoxDecoration(
          color: AppColors.primaryGreyColor,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.15),
              blurRadius: 30,
              offset: const Offset(0, 10),
            ),
          ],
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(10),
          ),
        ),
        child: ListView.builder(
          itemCount: listOfIcons.length,
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(horizontal: size.width * .024),
          itemBuilder: (context, index) => GestureDetector(
            onTap: () {
              setState(
                    () {
                  DSVM.currentIndex.value = index;
                  // print('page selected: ${currentIndex}');
                },
              );
            },
            // splashColor: Colors.transparent,
            // highlightColor: Colors.transparent,
            child: Obx(() {
             return Column(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 SizedBox(height: size.width * .03),
                 SvgPicture.asset(
                   listOfIcons[index],
                   width: Constant.width * .1,
                   height: Constant.width * .08,
                   // size: size.width * .076,
                   color: index == DSVM.currentIndex.value ? AppColors.primaryBlueColor : AppColors.greyTextDarkColor,
                 ),

                 SizedBox(
                     height: 16,
                     child: Text(listOfIconsText[index], style: const TextStyle(fontSize: 12, letterSpacing: 0.1, fontWeight: FontWeight.w500, color: AppColors.primaryBlueColor))),
                 AnimatedContainer(
                   duration: const Duration(milliseconds: 1500),
                   curve: Curves.fastLinearToSlowEaseIn,
                   margin: EdgeInsets.only(
                     bottom: index == DSVM.currentIndex.value ? 0 : size.width * .029,
                     // right: size.width * .0422,
                     // left: size.width * .0422,
                   ),
                   width: size.width * .240,
                   height: index == DSVM.currentIndex.value ? size.width * .014 : 0,
                   decoration: const BoxDecoration(
                     color: AppColors.primaryBlueColor,
                     borderRadius: BorderRadius.vertical(
                       top: Radius.circular(10),
                     ),
                   ),
                 ),
               ],
             );
            }),
          ),
        ),
      ),
      body: Obx(() {
        return bodySection();
      }),
    );
  }

  bodySection() {
    switch (DSVM.currentIndex.value.toInt()) {
      case 0:
        return const ServicesHomeScreen();
      case 1:
        return const ServicesBookingScreen();
      case 2:
        return const ServicesCategoryScreen();
      case 3:
        return const ServicesSaveScreen();
    }
  }

  List<String> listOfIcons = [
    "assets/icons/home.svg",
    "assets/icons/doctor/doctor_booking.svg",
    "assets/icons/category_icon.svg",
    "assets/icons/bookmark_save_icon.svg"
  ];
  List<String> listOfIconsText = [
    "Home",
    "Booking",
    "Category",
    "Save"
  ];
}
