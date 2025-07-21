import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:one_app/core/response/status.dart';
import 'package:one_app/feature/e-commerce/particular_product/presentation/view/particular_product_screen.dart';
import 'package:one_app/feature/e-commerce/particular_shop/presentation/controller/particular_shop_controller.dart';
import 'package:one_app/res/color/app_color.dart';
import 'package:one_app/res/constant/constant_data.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ParticularShopScreen extends StatefulWidget {
  final String shopId;
  final String shopCategory;
  const ParticularShopScreen(
      {super.key, required this.shopId, required this.shopCategory});

  @override
  State<ParticularShopScreen> createState() => _ParticularShopScreenState();
}

class _ParticularShopScreenState extends State<ParticularShopScreen> {
  final PShopVM = Get.put(ParticularShopController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    PShopVM.particularShopDetails(widget.shopId, widget.shopCategory);
    PShopVM.particularShopProductCategory(widget.shopId, widget.shopCategory);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Container(
        height: Constant.height * 1,
        width: Constant.width * 1,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Image and Navigation Button
              Stack(
                children: [
                  /// Shop Banner Or Image
                  Obx(() {
                    return PShopVM.rxRequestStatusPShopDetails.value == Status.COMPLETED ?
                    Container(
                      height: Constant.height * .25,
                      width: Constant.width * 1,
                      decoration: BoxDecoration(
                          color: AppColors.eComCardBg,
                          borderRadius: BorderRadius.circular(Constant.width * .03),
                          image: DecorationImage(
                              image: NetworkImage(PShopVM.rxParticularShopDetailsModel.value!.shopBannerImage),
                              fit: BoxFit.fill
                          )
                      ),
                    ): Container(
                      height: Constant.height * .25,
                      width: Constant.width * 1,
                      decoration: BoxDecoration(
                        color: AppColors.eComCardBg,
                        borderRadius: BorderRadius.circular(Constant.width * .03),
                      ),
                    );
                  },),

                  /// Navigation Button
                  Container(
                    height: Constant.height * .06,
                    width: Constant.width * .12,
                    margin: EdgeInsets.only(
                        top: Constant.height * .03, left: Constant.width * .04),
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(Constant.width * .02),
                    ),
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back_ios_new,
                          size: Constant.width * .08, color: AppColors.white),
                    ),
                  )
                ],
              ),

              SizedBox(height: Constant.height * .02),

              /// Shop Details
              Obx(() {
                switch (PShopVM.rxRequestStatusPShopDetails.value) {
                  case Status.LOADING:
                    return Container(
                      height: Constant.height * .15,
                      width: Constant.width * 1,
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );

                  case Status.ERROR:
                    return Container(
                      height: Constant.height * .15,
                      width: Constant.width * 1,
                      child: Center(
                        child: Text('Something Went Wrong...',
                            style: TextStyle(
                                fontSize: Constant.width * .05,
                                color: AppColors.redColor)),
                      ),
                    );

                  case Status.COMPLETED:
                    var data = PShopVM.rxParticularShopDetailsModel.value!;
                    return Padding(
                      padding: EdgeInsets.only(
                        left: Constant.width * .02,
                        right: Constant.width * .02,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          /// Shop Name
                          Text(data.shopName,
                              style: TextStyle(
                                  fontSize: Constant.width * .055,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.primaryYellowColor)),

                          SizedBox(height: Constant.height * .005),

                          /// Shop Address
                          Text(
                              // '${data.address.area}, ${data.address.landmark}, ${data.address.district}, ${data.address.state} - ${data.address.pincode}',
                              '${data.address}',
                              style: TextStyle(
                                  fontSize: Constant.width * .05,
                                  color: AppColors.greyTextDarkColor)),

                          SizedBox(height: Constant.height * .005),

                          /// Rating and Review Count
                          // Row(
                          //   children: [
                          //     /// Star Icon
                          //     Icon(
                          //       Icons.star,
                          //       size: Constant.width * .065,
                          //       color: AppColors.yellowColor,
                          //     ),
                          //
                          //     /// Rating and Review Count ---> Text
                          //     Text(
                          //         ' ${data.rating} ( ${data.reviewCount} Review ) ',
                          //         style: TextStyle(
                          //             fontSize: Constant.width * .05,
                          //             color: AppColors.greyTextDarkColor)),
                          //   ],
                          // ),

                          SizedBox(height: Constant.height * .005),

                          Divider(
                            color: AppColors.primaryColor,
                          )
                        ],
                      ),
                    );
                }
              }),

              /// Products Category ---> Title
              Padding(
                padding: EdgeInsets.only(
                  left: Constant.width * .02,
                  right: Constant.width * .02,
                ),
                child: Text('Product Category',
                    style: TextStyle(
                        fontSize: Constant.width * .05,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryColor)),
              ),

              /// Product Category ---> ListView
              Obx(() {
                switch (PShopVM.rxRequestStatusPShopSubCategory.value) {
                  case Status.LOADING:
                    return Container(
                      height: Constant.height * .19,
                      width: Constant.width * 1,
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );

                  case Status.ERROR:
                    return Container(
                      height: Constant.height * .19,
                      width: Constant.width * 1,
                      child: Center(
                        child: Text('Something Went Wrong...',
                            style: TextStyle(
                                fontSize: Constant.width * .05,
                                color: AppColors.redColor)),
                      ),
                    );

                  case Status.COMPLETED:
                    if (PShopVM.rxParticularShopSubCategoryModel.value!.category
                        .isEmpty) {
                      return Container(
                        height: Constant.height * .19,
                        width: Constant.width * 1,
                        child: Center(
                          child: Text('Category Not Available',
                              style: TextStyle(
                                  fontSize: Constant.width * .05,
                                  color: AppColors.redColor)),
                        ),
                      );
                    }

                    return Container(
                      height: Constant.height * .18,
                      width: Constant.width * 1,
                      padding: EdgeInsets.only(
                        left: Constant.width * .01,
                        right: Constant.width * .01,
                      ),
                      decoration: BoxDecoration(
                          // color: AppColors.primaryColor
                          ),
                      child: ListView.builder(
                        itemCount: PShopVM.rxParticularShopSubCategoryModel
                            .value!.category.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          var data = PShopVM.rxParticularShopSubCategoryModel
                              .value!.category[index];
                          return productCategoryCard(
                              data.subCategory, data.image, index);
                        },
                      ),
                    );
                }
              }),

              SizedBox(height: Constant.height * .01),

              /// Products ---> Title
              Padding(
                padding: EdgeInsets.only(
                  left: Constant.width * .02,
                  right: Constant.width * .02,
                ),
                child: Text('Products',
                    style: TextStyle(
                        fontSize: Constant.width * .05,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryYellowColor)),
              ),

              /// Products List ---> GridView
              Obx(() {
                switch (PShopVM
                    .rxRequestStatusPShopParticularSubcategoryAllData.value) {
                  case Status.LOADING:
                    return Container(
                      height: Constant.height * .25,
                      width: Constant.width * 1,
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );

                  case Status.ERROR:
                    return Container(
                      height: Constant.height * .25,
                      width: Constant.width * 1,
                      child: Center(
                        child: Text('Something Went Wrong...',
                            style: TextStyle(
                                fontSize: Constant.width * .05,
                                color: AppColors.redColor)),
                      ),
                    );

                  case Status.COMPLETED:
                    if (PShopVM
                        .rxParticularShopParticularSubcategoryAllDataModel
                        .value!
                        .products
                        .isEmpty) {
                      return Container(
                        height: Constant.height * .25,
                        width: Constant.width * 1,
                        child: Center(
                          child: Text('No Products Available',
                              style: TextStyle(
                                  fontSize: Constant.width * .05,
                                  color: AppColors.redColor)),
                        ),
                      );
                    }

                    var products = PShopVM
                        .rxParticularShopParticularSubcategoryAllDataModel
                        .value!
                        .products;
                    return Container(
                      height: products.length % 2 == 0
                          ? Constant.height *
                              (.24 * (products.length / 2) + 0.15)
                          : Constant.height *
                              (.24 * (products.length / 2 + 1) + 0.15),
                      width: Constant.width * 1,
                      // color: AppColors.primaryColor,
                      child: GridView.builder(
                        padding: EdgeInsets.only(
                          top: Constant.height * .02,
                          left: Constant.width * .02,
                          right: Constant.width * .02,
                        ),
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: products.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: Constant.height * .015,
                            crossAxisSpacing: Constant.width * .03,
                            mainAxisExtent: Constant.height * .26),
                        itemBuilder: (context, index) {
                          var data = products[index];
                          return productCard(data.productName, data.priceAfterDiscount,
                              data.image, data.productId, data.skuId, data.ownerPhone);
                        },
                      ),
                    );
                }
              }),
            ],
          ),
        ),
      ),
    );
  }

  /// Product Category Card
  Widget productCategoryCard(String name, image, index) {
    return InkWell(
      onTap: () {
        PShopVM.selectedIndex.value = index;
        PShopVM.selectedSubCategory.value = name;
        PShopVM.setRxRequestStatusPShopParticularSubcategoryAllData(
            Status.LOADING);
        PShopVM.particularShopParticularSubCategoryProducts(
            widget.shopId, widget.shopCategory);
      },
      child: Container(
        width: Constant.width * .225,
        padding: EdgeInsets.only(
          top: Constant.height * .003,
          left: Constant.width * .01,
          right: Constant.width * .01,
        ),
        margin: EdgeInsets.only(
          top: Constant.height * .01,
          bottom: Constant.height * .01,
          left: Constant.width * .01,
          right: Constant.width * .01,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// image Container
            Obx(() {
              return Container(
                height: Constant.height * .1,
                width: Constant.width * .2,
                decoration: BoxDecoration(
                    color: AppColors.eComCardBg,
                    border: Border.all(
                        color: index == PShopVM.selectedIndex.value
                            ? AppColors.primaryColor
                            : AppColors.white,
                        width: Constant.width * .005),
                    borderRadius: BorderRadius.circular(Constant.width * .02),
                    image: DecorationImage(
                        image: NetworkImage(image), fit: BoxFit.cover)),
              );
            }),

            /// dish title ---> Text
            Text(name,
                style: TextStyle(
                    fontSize: Constant.width * .04,
                    color: AppColors.black),
                maxLines: 2,
                overflow: TextOverflow.ellipsis),
          ],
        ),
      ),
    );
  }

  /// Product Card
  Widget productCard(String productName, price, imagePath, productId, skuId, phone) {
    return InkWell(
      onTap: () {
        // Get.to(() => ParticularProductScreen(
        //     productId: productId, skuId: skuId, category: widget.shopCategory));
      },
      child: Container(
        child: Center(
          child: Padding(
            padding: EdgeInsets.only(
                left: Constant.width * .03,
                right: Constant.width * .03,
                top: Constant.height * .02),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Image Box ---> It will be item Image
                Container(
                  height: Constant.height * .16,
                  width: Constant.width * .42,
                  decoration: BoxDecoration(
                      color: AppColors.eComCardBg,
                      border: Border.all(
                          color: AppColors.white, width: Constant.width * .005),
                      borderRadius: BorderRadius.circular(Constant.width * .02),
                      image: DecorationImage(
                          image: NetworkImage(imagePath), fit: BoxFit.cover)),
                ),

                /// Title ---> It will be item Title
                Text(productName,
                    style: TextStyle(
                        fontSize: Constant.width * .045,
                        fontWeight: FontWeight.w500,
                        color: AppColors.black),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis),

                /// Price & Add To Cart Button
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    /// Price ---> It will be Item Price
                    Row(
                      children: [
                        Icon(Icons.currency_rupee, size: Constant.width * .04, color: AppColors.primaryColor),
                        Text(price,
                            style: TextStyle(
                                fontSize: Constant.width * .04,
                                color: AppColors.greyTextDarkColor)),
                      ],
                    ),

                    /// Add To Cart Button ---> It will be a Button
                    // AddToCartButton(
                    //   onTap: () {
                    //     // Add to Cart Logic
                    //     // cartController.addToCartApi(item.productId.toString(), 1, item.firstSkuId);
                    //   },
                    // ),

                    /// Call Now Button
                    InkWell(
                      onTap: () {
                        launchUrlString('tel://$phone');
                      },
                      child: Container(
                        height: Constant.height * .03,
                        width: Constant.width * .2,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(Constant.width * .05),
                          border: Border.all(
                            color: AppColors.primaryColor
                          )
                        ),
                        child: Center(child: Text('Call Now', style: TextStyle(fontSize: Constant.width * .035, color: AppColors.primaryColor))),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
