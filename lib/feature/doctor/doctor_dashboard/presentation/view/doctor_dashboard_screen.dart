import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:one_app/feature/doctor/doctor_booking/presentation/view/doctor_booking_screen.dart';
import 'package:one_app/feature/doctor/doctor_dashboard/presentation/controller/doctor_dashboard_controller.dart';
import 'package:one_app/feature/doctor/doctor_doctor/presentation/view/doctor_doctor_screen.dart';
import 'package:one_app/feature/doctor/doctor_home/presentation/view/doctor_home_screen.dart';
import 'package:one_app/feature/doctor/doctor_more/presentation/view/doctor_more_screen.dart';
import 'package:one_app/res/color/app_color.dart';
import 'package:one_app/res/constant/constant_data.dart';

class DoctorDashboardScreen extends StatefulWidget {
  const DoctorDashboardScreen({super.key});

  @override
  State<DoctorDashboardScreen> createState() => _DoctorDashboardScreenState();
}

class _DoctorDashboardScreenState extends State<DoctorDashboardScreen> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  final DSVM = Get.put(DoctorDashboardController());


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
      bottomNavigationBar: Container(
        // margin: const EdgeInsets.all(2),
        height: size.width * .180,
        margin: EdgeInsets.only(
          bottom: Constant.height * .02,
          left: Constant.width * .03,
          right: Constant.width * .03,
        ),
        decoration: BoxDecoration(
          color: AppColors.doctorGradient3,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.15),
              blurRadius: 30,
              offset: const Offset(0, 10),
            ),
          ],
          borderRadius:  BorderRadius.circular(10)
        ),
        child: ListView.builder(
          itemCount: listOfIcons.length,
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.zero,
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
                    color: index == DSVM.currentIndex.value ? AppColors.white : AppColors.greyTextLightColor,
                  ),

                  SizedBox(
                      height: 16,
                      child: Text(listOfIconsText[index], style: const TextStyle(fontSize: 12, letterSpacing: 0.1, fontWeight: FontWeight.w500, color: AppColors.white))),
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
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(10),
                      ),
                    ),
                  ),
                ],
              );
            },),
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
        return const DoctorHomeScreen();
      case 1:
        return const DoctorDoctorScreen();
      case 2:
        return const DoctorBookingScreen();
      case 3:
        return const DoctorMoreScreen();
    }
  }

  List<String> listOfIcons = [
    "assets/icons/home.svg",
    "assets/icons/doctor/doctor_person.svg",
    "assets/icons/doctor/doctor_booking.svg",
    "assets/icons/person.svg"
  ];
  List<String> listOfIconsText = [
    "Home",
    "Doctor",
    "Booking",
    "More"
  ];
}
