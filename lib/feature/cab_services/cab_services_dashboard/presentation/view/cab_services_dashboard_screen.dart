import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:one_app/res/color/app_color.dart';
import 'package:one_app/res/common/common_text_field.dart';
import 'package:one_app/res/constant/constant_data.dart';

class CabServicesDashboardScreen extends StatefulWidget {
  const CabServicesDashboardScreen({super.key});

  @override
  State<CabServicesDashboardScreen> createState() => _CabServicesDashboardScreenState();
}

class _CabServicesDashboardScreenState extends State<CabServicesDashboardScreen> {

  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _globalKey,
        drawer: Drawer(
          width: Constant.width * .75,
          backgroundColor: AppColors.primaryColor,
          child: Column(
            children: [
              SizedBox(height: Constant.height * .04),
              /// Profile Box
              Container(
                height: Constant.height * .07,
                width: Constant.width * .75,
                padding: EdgeInsets.only(
                  left: Constant.width * .05,
                  right: Constant.width * .05,
                ),
                child: Center(child: Text('E-Commerce', style: TextStyle(fontSize: Constant.width * .08, fontWeight: FontWeight.bold),)),
              ),

              SizedBox(height: Constant.height * .04),

              /// Items
              SizedBox(
                height: Constant.height * .65,
                child: Column(
                  children: [
                    /// home -----> 1
                    Padding(
                      padding: EdgeInsets.only(
                          left: Constant.width * .05,
                          right: Constant.width * .05,
                          bottom: Constant.height * .01
                      ),
                      child: ListTile(
                        onTap: () {
                          Get.offAll(() => const CabServicesDashboardScreen());
                        },
                        leading: Icon(Icons.home_outlined, color: AppColors.white, size: Constant.width * .09,),

                        title: Text('Home', style: TextStyle(fontSize: Constant.width * .04, color: AppColors.white, fontWeight: FontWeight.w600,letterSpacing: Constant.width * .003)),
                      ),
                    ),

                    /// View Profile ------> 3
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
                        leading: Icon(Icons.person_2_outlined, color: AppColors.white, size: Constant.width * .09,),

                        title: Text('View Profile', style: TextStyle(fontSize: Constant.width * .04, color: AppColors.white, fontWeight: FontWeight.w600,letterSpacing: Constant.width * .003)),
                      ),
                    ),

                    /// My Order ------> 4
                    Padding(
                      padding: EdgeInsets.only(
                          left: Constant.width * .05,
                          right: Constant.width * .05,
                          bottom: Constant.height * .01
                      ),
                      child: ListTile(
                        onTap: () {
                          // Get.to(() => const MyOrderHistoryScreen());
                        },
                        leading: Icon(Icons.shopping_bag_outlined, color: AppColors.white, size: Constant.width * .09,),

                        title: Text('My Order', style: TextStyle(fontSize: Constant.width * .04, color: AppColors.white, fontWeight: FontWeight.w600,letterSpacing: Constant.width * .003)),
                      ),
                    ),

                    /// Help & Support ------> 6
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


                    /// Contact Us ------> 7
                    Padding(
                      padding: EdgeInsets.only(
                          left: Constant.width * .05,
                          right: Constant.width * .05,
                          bottom: Constant.height * .01
                      ),
                      child: ListTile(
                        onTap: () {

                        },
                        leading: Icon(Icons.contact_page_outlined, color: AppColors.white, size: Constant.width * .09,),

                        title: Text('Contact Us', style: TextStyle(fontSize: Constant.width * .04, color: AppColors.white, fontWeight: FontWeight.w600,letterSpacing: Constant.width * .003)),
                      ),
                    ),

                    /// Security & Privacy ------> 8
                    Padding(
                      padding: EdgeInsets.only(
                          left: Constant.width * .05,
                          right: Constant.width * .05,
                          bottom: Constant.height * .01
                      ),
                      child: ListTile(
                        onTap: () {

                        },
                        leading: Icon(Icons.security_outlined, color: AppColors.white, size: Constant.width * .09,),

                        title: Text('Security & Privacy', style: TextStyle(fontSize: Constant.width * .04, color: AppColors.white, fontWeight: FontWeight.w600,letterSpacing: Constant.width * .003)),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      backgroundColor: AppColors.brownColor,
      body: Column(
        children: [
          /// Drawer and Cart
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              /// Drawer Icon Button
              IconButton(
                  onPressed: () {
                    _globalKey.currentState?.openDrawer();
                  },
                  icon: Icon(Icons.menu, size: Constant.width * .09)
              ),

              Text('E-Commerce', style: TextStyle(fontSize: Constant.width * .06, fontWeight: FontWeight.bold, color: AppColors.yellowColor),),

              /// Cart Icon
              IconButton(
                  onPressed: () {
                    // Get.to(() => const CartScreen());
                  },
                  icon: Icon(Icons.shopping_cart_outlined, size: Constant.width * .09)
              ),
            ],
          ),

          SizedBox(height: Constant.height * .01),

          /// Search Box and Filter
          Padding(
            padding: EdgeInsets.only(
              left: Constant.width * .02,
              right: Constant.width * .02,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /// Search Box
                Container(
                  height: Constant.height * .06,
                  width: Constant.width * .8,
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(Constant.width * .04),
                  ),
                  child: CommonTextField(
                    obSecure: false,
                    hintText: 'Search For Food, Medicine etc.',
                    icon: Icon(Icons.search, color: AppColors.greyTextDarkColor,),
                    hintStyle: TextStyle(color: AppColors.greyTextDarkColor),

                  ),
                ),

                /// Filter Button
                InkWell(
                  onTap: () {
                    // filter function
                  },
                  child: Container(
                    height: Constant.height * .06,
                    width: Constant.width * .12,
                    decoration: BoxDecoration(
                        color: AppColors.servicesPrimaryColor,
                        borderRadius: BorderRadius.circular(Constant.width * .02)
                    ),
                    child: Icon(Icons.filter_alt, size: Constant.width * .08, color: AppColors.white,),
                  ),
                )
              ],
            ),
          ),

          SizedBox(height: Constant.height * .01),

          /// Vehicle Category
          Container(
            height: Constant.height * .165,
            width: Constant.width * 1,
            child: ListView.builder(
              itemCount: 5,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                // var data = eComDSVM.rxCategoryModel.value!.categories[index];
                return InkWell(
                  onTap: () {
                    // Get.to(() => ParticularCategoryScreen(title: data.categoryName));
                  },
                  child: Container(
                    height: Constant.height * .12,
                    width: Constant.width * .3,
                    padding: EdgeInsets.only(
                      left: Constant.width * .02,
                      right: Constant.width * .02,
                    ),
                    margin: EdgeInsets.only(
                      left: Constant.width * .01,
                      right: Constant.width * .01,
                      top: Constant.height * .005,
                      // bottom: Constant.height * .005,
                    ),
                    decoration: BoxDecoration(
                        color: AppColors.blueColor,
                        borderRadius: BorderRadius.circular(Constant.width * .02)
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /// Text ---> ride Categories
                        Text('Economy', style: TextStyle(fontSize: Constant.width * .045, color: AppColors.yellowColor),maxLines: 2, overflow: TextOverflow.ellipsis),

                        SizedBox(height: Constant.height * .01),

                        /// Image Container
                        Container(
                          height: Constant.height * .1,
                          width: Constant.width * .28,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/images/food_mix_masala.png'),
                                fit: BoxFit.fill
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),

          SizedBox(height: Constant.height * .01),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              /// Text ---> "Find Your Doctor"
              Text('Vehicles', style: TextStyle(fontSize: Constant.width * .05, fontWeight: FontWeight.bold)),

              /// TextButton ---> "View All"
              // InkWell(
              //   onTap: () {
              //
              //   },
              //   child: Container(
              //     height: Constant.height * .05,
              //     width: Constant.width * .2,
              //     decoration: BoxDecoration(
              //         color: Colors.grey.shade300,
              //         borderRadius: BorderRadius.circular(Constant.width * .05)
              //     ),
              //     child: Center(child: Icon(Icons.arrow_right_alt, size: Constant.width * .1)),
              //   ),
              // ),
            ],
          ),

          SizedBox(height: Constant.height * .01),

          Container(
            height: Constant.height * .622,
            width: Constant.width * 1,
            decoration: BoxDecoration(
              // color: AppColors.primaryColor
            ),
            child: ListView.builder(
              itemCount: 5,
              padding: EdgeInsets.only(
                left: Constant.width * .02,
                right: Constant.width * .02,
              ),
              itemBuilder: (context, index) {
                return vehicleCard('scorpio slx', 'matwari, gandhi maidan hazaribagh', 'saddam hussain', '3 + 1', '4.2', 'assets/images/food_mix_masala.png', 'assets/images/food_mix_masala.png', true);
              },
            ),
          )
        ],
      )
    );
  }

  Widget vehicleCard(String vehicleName, address, ownerName, seat, rating, vehicleImage, ownerImage, bool isAC){
    return Container(
      height: Constant.height * .15,
      width: Constant.width * 1,
      margin: EdgeInsets.only(
        bottom: Constant.height * .01,
      ),
      decoration: BoxDecoration(
        color: AppColors.blueColor,
        borderRadius: BorderRadius.circular(Constant.width * .05),
      ),
    );
  }
}
