 import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:one_app/feature/authentication/login/presentation/view/login_screen.dart';
import 'package:one_app/feature/coming_soon/coming_soon_screen.dart';
import 'package:one_app/feature/dashboard/presentation/controller/dashboard_controller.dart';
import 'package:one_app/feature/dashboard_features/profile/presentation/view/profile_screen.dart';
import 'package:one_app/feature/doctor/doctor_dashboard/presentation/view/doctor_dashboard_screen.dart';
import 'package:one_app/feature/e-commerce/e-commerce_dashboard/presentation/view/e_commerce_dashboard_screen.dart';
import 'package:one_app/feature/services/services_dashboard/presentation/view/services_dashboard_screen.dart';
import 'package:one_app/res/color/app_color.dart';
import 'package:one_app/res/common/common_button.dart';
import 'package:one_app/res/common/common_text_field.dart';
import 'package:one_app/res/constant/constant_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  
  final dashboardVM = Get.put(DashboardController());

  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();

  List cardDetails = [
    {
      'title': 'Doctor',
      'image': 'assets/images/card1.png'
    },
    {
      'title': 'Services',
      'image': 'assets/images/card2.png'
    },
    {
      'title': 'Products',
      'image': 'assets/images/card3.png'
    },
    {
      'title': 'Hotels & Banquet',
      'image': 'assets/images/card4.png'
    },
    {
      'title': 'Software Solutions',
      'image': 'assets/images/card5.png'
    },
    {
      'title': 'Educational Corner',
      'image': 'assets/images/card6.png'
    },
    {
      'title': 'Leisure',
      'image': 'assets/images/card7.png'
    },
    {
      'title': 'Real Estate',
      'image': 'assets/images/card8.png'
    },
    {
      'title': 'Cab Service',
      'image': 'assets/images/card9.png'
    },
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dashboardVM.getEmail();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      drawer: Drawer(
        width: Constant.width * .75,
        backgroundColor: AppColors.headColor1,
        child: Column(
          children: [
            SizedBox(height: Constant.height * .04),
            /// Profile Box
            Obx(() {
              return Container(
                height: Constant.height * .07,
                width: Constant.width * .75,
                padding: EdgeInsets.only(
                  left: Constant.width * .1,
                  right: Constant.width * .02,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('User', style: TextStyle(fontSize: Constant.width * .05, color: AppColors.white)),
                    Text(dashboardVM.name.value, style: TextStyle(fontSize: Constant.width * .05, fontWeight: FontWeight.bold, color: AppColors.white), maxLines: 1,),
                  ],
                ),
              );
            },),

            SizedBox(height: Constant.height * .01),

            Divider(
              indent: Constant.width * .05,
              endIndent: Constant.width * .05,
              color: AppColors.white,
              thickness: Constant.height * .002,
            ),

            SizedBox(height: Constant.height * .05),

            /// Items
            SizedBox(
              height: Constant.height * .65,
              child: Column(
                children: [
                  // /// home -----> 1
                  // Padding(
                  //   padding: EdgeInsets.only(
                  //       left: Constant.width * .05,
                  //       right: Constant.width * .05,
                  //       bottom: Constant.height * .01
                  //   ),
                  //   child: ListTile(
                  //     onTap: () {
                  //       Get.offAll(() => const ECommerceDashboardScreen());
                  //     },
                  //     leading: Icon(Icons.home_outlined, color: AppColors.white, size: Constant.width * .09,),
                  //
                  //     title: Text('Home', style: TextStyle(fontSize: Constant.width * .04, color: AppColors.white, fontWeight: FontWeight.w600,letterSpacing: Constant.width * .003)),
                  //   ),
                  // ),

                  /// Services History ------> 1
                  // Padding(
                  //   padding: EdgeInsets.only(
                  //       left: Constant.width * .05,
                  //       right: Constant.width * .05,
                  //       bottom: Constant.height * .01
                  //   ),
                  //   child: ListTile(
                  //     onTap: () {
                  //       // Get.to(() => const MyOrderScreen());
                  //     },
                  //     leading: Icon(Icons.history_edu, color: AppColors.white, size: Constant.width * .09,),
                  //
                  //     title: Text('Services History', style: TextStyle(fontSize: Constant.width * .04, color: AppColors.white, fontWeight: FontWeight.w600,letterSpacing: Constant.width * .003)),
                  //   ),
                  // ),

                  /// View Profile ------> 2
                  Padding(
                    padding: EdgeInsets.only(
                        left: Constant.width * .05,
                        right: Constant.width * .05,
                        bottom: Constant.height * .01
                    ),
                    child: ListTile(
                      onTap: () {
                        Get.to(() => const ProfileScreen());
                      },
                      leading: Icon(Icons.person_2_outlined, color: AppColors.white, size: Constant.width * .09,),

                      title: Text('View Profile', style: TextStyle(fontSize: Constant.width * .04, color: AppColors.white, fontWeight: FontWeight.w600,letterSpacing: Constant.width * .003)),
                    ),
                  ),

                  /// Language ------> 3
                  Padding(
                    padding: EdgeInsets.only(
                        left: Constant.width * .05,
                        right: Constant.width * .05,
                        bottom: Constant.height * .01
                    ),
                    child: ListTile(
                      onTap: () {
                        // Get.to(() => const ProfileScreen());
                      },
                      leading: Icon(Icons.language, color: AppColors.white, size: Constant.width * .09,),

                      title: Text('Language', style: TextStyle(fontSize: Constant.width * .04, color: AppColors.white, fontWeight: FontWeight.w600,letterSpacing: Constant.width * .003)),
                    ),
                  ),

                  /// Help & Support ------> 4
                  Padding(
                    padding: EdgeInsets.only(
                        left: Constant.width * .05,
                        right: Constant.width * .05,
                        bottom: Constant.height * .01
                    ),
                    child: ListTile(
                      onTap: () {

                      },
                      leading: Icon(Icons.help_center_outlined, color: AppColors.white, size: Constant.width * .09,),

                      title: Text('Help & Support', style: TextStyle(fontSize: Constant.width * .04, color: AppColors.white, fontWeight: FontWeight.w600,letterSpacing: Constant.width * .003)),
                    ),
                  ),


                  /// Contact Us ------> 5
                  // Padding(
                  //   padding: EdgeInsets.only(
                  //       left: Constant.width * .05,
                  //       right: Constant.width * .05,
                  //       bottom: Constant.height * .01
                  //   ),
                  //   child: ListTile(
                  //     onTap: () {
                  //
                  //     },
                  //     leading: Icon(Icons.contact_page_outlined, color: AppColors.white, size: Constant.width * .09,),
                  //
                  //     title: Text('Contact Us', style: TextStyle(fontSize: Constant.width * .04, color: AppColors.white, fontWeight: FontWeight.w600,letterSpacing: Constant.width * .003)),
                  //   ),
                  // ),

                  /// Security & Privacy ------> 6
                  // Padding(
                  //   padding: EdgeInsets.only(
                  //       left: Constant.width * .05,
                  //       right: Constant.width * .05,
                  //       bottom: Constant.height * .01
                  //   ),
                  //   child: ListTile(
                  //     onTap: () {
                  //
                  //     },
                  //     leading: Icon(Icons.security_outlined, color: AppColors.white, size: Constant.width * .09,),
                  //
                  //     title: Text('Security & Privacy', style: TextStyle(fontSize: Constant.width * .04, color: AppColors.white, fontWeight: FontWeight.w600,letterSpacing: Constant.width * .003)),
                  //   ),
                  // ),



                  SizedBox(height: Constant.height * .37),


                  /// LogOut Button
                  CommonButton(
                    title: 'Logout',
                    onTap: () async {
                      SharedPreferences prefs = await SharedPreferences.getInstance();
                      prefs.setString('TOKEN', '');

                      Get.offAll(() => LoginScreen());

                    },
                    margin: EdgeInsets.only(
                      left: Constant.width * .03,
                      right: Constant.width * .03,
                    ),
                    height: Constant.height * .06,
                    width: Constant.width * 1,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      body: Container(
        height: Constant.height * 1,
        width: Constant.width * 1,
        child: Column(
          children: [

            /// Heading Container
            Container(
              height: Constant.height * .18,
              width: Constant.width * 1,
              padding: EdgeInsets.only(
                top: Constant.height * .03,
              ),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppColors.headColor1,
                    AppColors.headColor2
                  ],
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(Constant.width * .05),
                  bottomRight: Radius.circular(Constant.width * .05),
                )
              ),
              child: Column(
                children: [
                  /// Drawer, Text and Notification
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      /// Drawer Icon Button
                      IconButton(
                          onPressed: () {
                            _globalKey.currentState?.openDrawer();
                          },
                          icon: Icon(Icons.menu, size: Constant.width * .1, color: AppColors.white)
                      ),

                      Text('Hi User!\nAll Services, Just a Tap Away!', style: TextStyle(fontSize: Constant.width * .04, fontWeight: FontWeight.bold, color: AppColors.white)),

                      /// Cart Icon
                      IconButton(
                          onPressed: () {
                            // Get.to(() => const MyCartScreen());
                          },
                          icon: Icon(Icons.notifications, size: Constant.width * .1, color: AppColors.white)
                      ),
                    ],
                  ),

                  SizedBox(height: Constant.height * .01),

                  /// Search Bar
                  Container(
                    height: Constant.height * .06,
                    width: Constant.width * 1,
                    margin: EdgeInsets.only(
                      left: Constant.width * .03,
                      right: Constant.width * .03
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(Constant.width * .04),
                    ),
                    child: CommonTextField(
                      obSecure: false,
                      hintText: 'Search OneApp Services',
                      icon: Icon(Icons.search, color: AppColors.greyTextDarkColor,),
                      hintStyle: TextStyle(color: AppColors.greyTextDarkColor),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: Constant.height * .01),

            /// Banner Image
            Container(
              height: Constant.height * .16,
              width: Constant.width * 1,
              margin: EdgeInsets.only(
                left: Constant.width * .02,
                right: Constant.width * .02,
              ),
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/dashboard banner.png'),
                    fit: BoxFit.fill
                  )
              ),
            ),

            /// All 9 Cards
            Container(
              height: Constant.height * .61,
              width: Constant.width * 1,
              padding: EdgeInsets.only(
                left: Constant.width * .02,
                right: Constant.width * .02,
              ),
              child: GridView.builder(
                padding: EdgeInsets.only(top: Constant.height * .01),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: Constant.width * .02,
                  mainAxisSpacing: Constant.height * .01,
                  mainAxisExtent: Constant.height * .19,
                ),
                itemCount: cardDetails.length,
                itemBuilder: (context, index) {
                  return homeCard(cardDetails[index]['title'], cardDetails[index]['image'], index);
                },
              ),
            )
          ],
        ),
      ),
      backgroundColor: AppColors.white,
    );
  }
  
  /// Home Card
  Widget homeCard(String title, imagePath, int index){
    return InkWell(
      onTap: () {
        switch(index){
          case 0:
            Get.to(() => const DoctorDashboardScreen());
          case 1:
            Get.to(() => const ServicesDashboardScreen());
          case 2:
            Get.to(() => const ECommerceDashboardScreen());
          case 3:
            Get.to(() => const ComingSoonScreen());
          case 4:
            Get.to(() => const ComingSoonScreen());
          case 5:
            Get.to(() => const ComingSoonScreen());
          case 6:
            Get.to(() => const ComingSoonScreen());
          case 7:
            Get.to(() => const ComingSoonScreen());
          case 8:
            Get.to(() => const ComingSoonScreen());
          case 9:
            Get.to(() => const ComingSoonScreen());
        }
      },
      child: Container(
        padding: EdgeInsets.only(
          left: Constant.width * .02,
          right: Constant.width * .02,
          top: Constant.height * .02,
          bottom: Constant.height * .02,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Constant.width * .01),
          gradient: LinearGradient(
            colors: [
              AppColors.card1A,
              AppColors.cardB
            ],
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Title ---> Text
            Text(title, textAlign: TextAlign.center, style: TextStyle(fontSize: Constant.width * .04)),

            /// Image
            Container(
              height: Constant.height * .08,
              width: Constant.width * .25,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(imagePath),
                  )
              ),
            ),
          ],
        ),
      ),
    );
  }
}
