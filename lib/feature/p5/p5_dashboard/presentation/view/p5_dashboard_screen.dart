import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:one_app/feature/p5/enquiry_now/presentation/view/enquiry_now.dart';
import 'package:one_app/res/color/app_color.dart';
import 'package:one_app/res/constant/constant_data.dart';
import 'package:url_launcher/url_launcher_string.dart';

class P5DashboardScreen extends StatefulWidget {
  const P5DashboardScreen({super.key});

  @override
  State<P5DashboardScreen> createState() => _P5DashboardScreenState();
}

class _P5DashboardScreenState extends State<P5DashboardScreen> {
  var cardListData = [
    {
      'title': 'MOBILE APPLICATION DEVELOPMENT',
      'icon': Icons.phone_android,
    },
    {
      'title': 'WEB APPLICATION DEVELOPMENT',
      'icon': Icons.web,
    },
    {
      'title': 'UI/UX DESIGN',
      'icon': Icons.design_services,
    },
    {
      'title': 'ENTERPRISE SOFTWARE DEVELOPMENT',
      'icon': Icons.business,
    },
    {
      'title': 'ECOMMERCE DEVELOPMENT',
      'icon': Icons.shopping_cart,
    },
    {
      'title': 'HRMS PAYROLL SOFTWARE PROVIDER',
      'icon': Icons.people_alt,
    },
    {
      'title': 'DEFI APPS & FINANCE APPS',
      'icon': Icons.currency_bitcoin,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Constant.height * 1,
        width: Constant.width * 1,
        child: Column(
          children: [
            /// Heading Container
            Container(
              height: Constant.height * .15,
              width: Constant.width * 1,
              padding: EdgeInsets.only(top: Constant.height * .055),
              decoration: BoxDecoration(
                  color: AppColors.headColor1,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(Constant.width * .05),
                    bottomRight: Radius.circular(Constant.width * .05),
                  )),
              child: Column(
                children: [
                  Text(
                    'P5 DIGITAL SOLUTIONS',
                    style: TextStyle(
                        fontSize: Constant.width * .07,
                        fontWeight: FontWeight.bold,
                        color: AppColors.white),
                  ),
                  Text(
                    'WE DELIVER YOUR DREAMS',
                    style: TextStyle(
                        fontSize: Constant.width * .04, color: AppColors.white),
                  ),
                ],
              ),
            ),

            /// Main Content
            Container(
              height: Constant.height * .72,
              width: Constant.width * 1,
              child: ListView.builder(
                itemCount: cardListData.length,
                padding: EdgeInsets.only(
                  top: Constant.height * .01,
                  left: Constant.width * .03,
                  right: Constant.width * .03,
                ),
                itemBuilder: (context, index) {
                  var data = cardListData[index];
                  print(data);
                  return Container(
                    height: Constant.height * .15,
                    width: Constant.width * 1,
                    margin: EdgeInsets.only(bottom: Constant.height * .01),
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(Constant.width * .02),
                        border: Border.all(
                            color: AppColors.headColor1,
                            width: Constant.width * .003),
                        image: DecorationImage(
                            image: AssetImage(index % 2 == 0
                                ? 'assets/images/card_bg1.png'
                                : 'assets/images/card_bg2.png'),
                            fit: BoxFit.fill)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        /// Icon
                        SizedBox(
                          width: Constant.width * .25,
                          child: data['icon'] is IconData
                              ? Icon(data['icon'] as IconData,
                                  size: Constant.width * .1)
                              : SizedBox.shrink(),
                        ),

                        /// Text
                        Expanded(
                          flex: 2,
                          child: Text(
                            '${data['title']}',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: Constant.width * .05,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            /// Bottom Button
            Container(
              height: Constant.height * .13,
              width: Constant.width * 1,
              padding: EdgeInsets.only(
                top: Constant.height * .01,
                left: Constant.width * .03,
                right: Constant.width * .03,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Enquiry Now ---> Button
                  InkWell(
                    onTap: () {
                      Get.to(() => const EnquiryNow());
                    },
                    child: Container(
                      height: Constant.height * .06,
                      width: Constant.width * .4,
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(Constant.width * .02),
                          border: Border.all(
                              color: AppColors.headColor1, width: 3)),
                      child: Center(
                          child: Text(
                        'Enquiry Now',
                        style: TextStyle(
                            fontSize: Constant.width * .06,
                            fontWeight: FontWeight.w600,
                            color: AppColors.headColor1),
                      )),
                    ),
                  ),

                  /// Call Now ---> Button
                  InkWell(
                    onTap: () {
                      var phone = '6202548771';
                      launchUrlString('tel://$phone');
                    },
                    child: Container(
                      height: Constant.height * .06,
                      width: Constant.width * .4,
                      decoration: BoxDecoration(
                        color: AppColors.headColor1,
                        borderRadius:
                            BorderRadius.circular(Constant.width * .02),
                      ),
                      child: Center(
                        child: Text(
                          'Call Now',
                          style: TextStyle(
                              fontSize: Constant.width * .06,
                              fontWeight: FontWeight.w600,
                              color: AppColors.white),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      backgroundColor: AppColors.white,
    );
  }
}
