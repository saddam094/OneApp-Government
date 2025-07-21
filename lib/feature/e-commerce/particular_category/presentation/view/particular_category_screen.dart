import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:one_app/core/response/status.dart';
import 'package:one_app/feature/e-commerce/particular_category/presentation/controller/particular_category_controller.dart';
import 'package:one_app/feature/e-commerce/particular_product/presentation/view/particular_product_screen.dart';
import 'package:one_app/feature/e-commerce/particular_shop/presentation/view/particular_shop_screen.dart';
import 'package:one_app/res/color/app_color.dart';
import 'package:one_app/res/common/common_app_bar.dart';
import 'package:one_app/res/common/common_text_field.dart';
import 'package:one_app/res/constant/constant_data.dart';

class ParticularCategoryScreen extends StatefulWidget {
  final String title;
  const ParticularCategoryScreen({super.key, required this.title});

  @override
  State<ParticularCategoryScreen> createState() =>
      _ParticularCategoryScreenState();
}

class _ParticularCategoryScreenState extends State<ParticularCategoryScreen> {
  final particularCategoryVM = Get.put(ParticularCategoryController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // particularCategoryVM.particularCategoryShopList(widget.title);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
          context: context,
          title: widget.title,
          backButton: true,
          onBackTap: () => Navigator.pop(context)),
      body: Container(
        height: Constant.height * .9,
        width: Constant.width * 1,
        padding: EdgeInsets.only(
          top: Constant.height * .01,
          left: Constant.width * .02,
          right: Constant.width * .02,
        ),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisExtent: Constant.height * .25,
            mainAxisSpacing: Constant.height * .015,
            crossAxisSpacing: Constant.width * .03,
          ),
          padding: EdgeInsets.zero,
          itemCount: 5,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Get.to(() => const ParticularProductScreen());
              },
              child: Container(
                height: Constant.height * .25,
                width: Constant.width * .45,
                padding: EdgeInsets.only(
                  top: Constant.height * .008,
                  left: Constant.width * .02,
                  right: Constant.width * .02,
                ),
                decoration: BoxDecoration(
                  color: AppColors.cardBG,
                  borderRadius: BorderRadius.circular(Constant.width * .05),
                  border: Border.all(
                      color: AppColors.productsGradient1
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// Image Container
                    Container(
                      height: Constant.height * .18,
                      width: Constant.width * .45,
                      decoration: BoxDecoration(
                        color: AppColors.cardBG,
                        image: DecorationImage(
                            image: AssetImage(index % 2 == 0 ? 'assets/images/products/cloth.png' : 'assets/images/products/honey.png'),
                            fit: BoxFit.fill
                        ),
                        borderRadius: BorderRadius.circular(Constant.width * .04),
                      ),
                    ),

                    /// Title
                    Text(index % 2 == 0 ? 'Mens Harrington Jacket' : 'Home Made Honey', style: TextStyle(fontSize: Constant.width * .04, color: AppColors.greyTextDarkColor), maxLines: 1),

                    /// Price
                    Text(index % 2 == 0 ? '₹ 148.00' : '₹ 55.00', style: TextStyle(fontSize: Constant.width * .04,fontWeight: FontWeight.bold, color: AppColors.black), maxLines: 1),
                  ],
                ),
              ),
            );
          },
        ),

      ),
      backgroundColor: AppColors.white,
    );
  }

  Widget shopCard(String name, address, category, imagePath, shopId) {
    return InkWell(
      onTap: () {
        Get.to(() =>
            ParticularShopScreen(shopId: shopId, shopCategory: widget.title));
      },
      child: Container(
        height: Constant.height * .12,
        width: Constant.width * 1,
        decoration: BoxDecoration(
          color: AppColors.eComCardBg,
          borderRadius: BorderRadius.circular(Constant.width * .02),
          // border: Border.all(
          //   color: AppColors.primaryYellowColor,
          // )
        ),
        padding: EdgeInsets.only(
          left: Constant.width * .02,
          right: Constant.width * .02,
        ),
        margin: EdgeInsets.only(
          bottom: Constant.height * .005,
          top: Constant.height * .005,
          left: Constant.width * .005,
          right: Constant.width * .005,
        ),
        child: Row(
          children: [
            /// shop image
            Container(
              height: Constant.height * .1,
              width: Constant.width * .2,
              decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(Constant.width * .02),
                  border: Border.all(
                      color: AppColors.white, width: Constant.width * .005),
                  image: DecorationImage(
                      image: NetworkImage(imagePath), fit: BoxFit.cover)),
            ),

            SizedBox(width: Constant.width * .03),

            /// card content
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// shop name
                Text(name,
                    style: TextStyle(
                        fontSize: Constant.width * .05,
                        fontWeight: FontWeight.bold,
                        color: AppColors.black),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis),

                /// Address
                Text('$address',
                    style: TextStyle(
                        fontSize: Constant.width * .045,
                        color: AppColors.greyTextDarkColor),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis),

                /// rating
                Row(
                  children: [
                    Text('Category : ',
                        style: TextStyle(
                            fontSize: Constant.width * .045,
                            color: AppColors.greyTextDarkColor,
                            fontWeight: FontWeight.w600),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis),
                    Text('$category',
                        style: TextStyle(
                            fontSize: Constant.width * .045,
                            color: AppColors.greyTextDarkColor,
                            fontWeight: FontWeight.w600),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
