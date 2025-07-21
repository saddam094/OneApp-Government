class ConstUrl {

  static const String baseUrl = "https://r2fjv162gj.execute-api.ap-south-1.amazonaws.com/prod";


  /// Authentication Related Api
  static const String login = "$baseUrl/users_login_ONE_APP";
  static const String register = "$baseUrl/usersSignup_ONE_APP";

  static const String districts = "$baseUrl/puja_store_all_district";
  static const String registerVerifyOtp = "$baseUrl/puja_user_verify_signUP";


  static const String resendOtp = "$baseUrl/puja_user_resend_otp";
  static const String resetPassword = "$baseUrl/api/providers/reset-password";
  static const String updatePassword = "$baseUrl/api/providers/update-password";

  /// Common Api For Every Section
  static const String allServicesCategory = "$baseUrl/one_app_allServicesCategoryName";
  static const String editUserProfile = "$baseUrl/update_user_profile_oneapp";


  /// Doctor Section Related Api
  static const String popularDoctorList = "$baseUrl/popular_doctor_list_one_app";

  static const String particularDoctorDetails = "$baseUrl/particular_doctor_list";

  static const String particularCategoryDoctorsList = "$baseUrl/particular_specialist_doctor_list";

  static const String bookedDoctorList = "$baseUrl/booked_appointment_list_doctors";

  static const String doctorUserProfile = "$baseUrl/user_profile_details";

  static const String doctorBookingAppointment = "$baseUrl/doctor_appointment_booking_oneapp";

  static const String cancelDoctorBookingAppointment = "$baseUrl/cancel_doctor_appointment";




  /// Services Section Related Api
  static const String particularCategoryServiceManList = "$baseUrl/particular_category_serviceman_list";

  static const String particularServiceManProfile = "$baseUrl/particular_serviceman_details";

  static const String servicesCategoryList = "$baseUrl/all_categories_of_service";

  static const String recommendedServiceManList = "$baseUrl/recommended_servicemen_list";

  static const String savedServiceManList = "$baseUrl/saved_serviceman_list";

  static const String savedUnsaved = "$baseUrl/save_unsave_serviceman";

  static const String bookedServiceManList = "$baseUrl/booked_servicemen_list";

  static const String bookServiceMan = "$baseUrl/servicemen_booking";

  static const String cancelBookedServiceMan = "$baseUrl/cancel_booked_servicemen";




  /// E-Commerce Section Related Api
  static const String popularDishes = "$baseUrl/ecommerce_popular_dishes";

  static const String groceryDeals = "$baseUrl/ecommerce_grocery_deals";

  static const String prescribedMedicine = "$baseUrl/ecommerce_medicine_prescribed_by_doctor";

  static const String particularCategoryShopList = "$baseUrl/e-commerce_particular_category_shop_list";

  static const String cartProductList = "$baseUrl/ecommerce_cart_product_list";

  static const String addToCart = "$baseUrl/ecommerce_add_to_cart";

  static const String removeFromCart = "$baseUrl/ecommerce_remove_from_cart";

  static const String updateQuantity = "$baseUrl/ecommerce_cart_update_quantity";

  static const String particularShopProductCategory = "$baseUrl/ecom_particular_shop_all_subcategories";

  static const String particularShopCategoryProducts = "$baseUrl/ecom_particular_shop_particular_subCategory_alldata";

  static const String particularShopDetails = "$baseUrl/ecommerce_particular_store_details";

  static const String particularProduct = "$baseUrl/ecommerce_particular_product_detail";

  static const String orderFromCart = "$baseUrl/ecommerce_order_from_cart";

  static const String orderDirect = "$baseUrl/ecommerce_direct_order";

  static const String cancelOrder = "$baseUrl/ecommerce_cancel_order";

  static const String orderList = "$baseUrl/ecom_ordered_product_list";





  /// P5 Section Url
  static const String enquiryNow = "$baseUrl/send_enquiry_to_company";

  /// Default image Url
  static const String defaultImageUrl = 'https://puja-app.s3.ap-south-1.amazonaws.com/products_image/IMG_4719845_VaidikaLogo.png';
}