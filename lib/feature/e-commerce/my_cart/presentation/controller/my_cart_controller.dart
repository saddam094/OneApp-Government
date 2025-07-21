import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:one_app/core/response/status.dart';
import 'package:one_app/feature/e-commerce/my_cart/data/model/my_cart_model.dart';
import 'package:one_app/feature/e-commerce/my_cart/data/repository/my_cart_repository.dart';
import 'package:one_app/res/preferences/user_preferences.dart';
import 'package:one_app/res/utils/utils.dart';

class MyCartController extends GetxController{

  final _api = MyCartRepository();
  final preferences = UserPreference();

  final rxCartModel = Rxn<MyCartModel>();
  final rxRequestStatusCart = Status.LOADING.obs;

  final isLoading = false.obs;
  List arr = [];
  static int constantValue = 1000000000;
  int indexOfElement = constantValue;

  void setRxCartModel(MyCartModel value) => rxCartModel.value = value;
  void setRxRequestStatusCartModel(Status value) => rxRequestStatusCart.value = value;

  /// Cart List
  void cartListApi() async{

    arr = [];

    String? email = await preferences.getEmail();

    Map<String, dynamic> data = {
      "email": email
    };

    _api.cartListApi(data).then((response) {

      if(kDebugMode){
        print('Api response received');
        print('RESPONSE : $response');
      }

      try{

        MyCartModel myCartModel = MyCartModel.fromJson(response['body-json']['body']);
        setRxCartModel(myCartModel);
        setRxRequestStatusCartModel(Status.COMPLETED);


        if(kDebugMode){
          print('Cart data fetched successfully');
        }

      }catch(e){
        setRxRequestStatusCartModel(Status.ERROR);
        if(kDebugMode){
          print('Error while fetching response : $e');
        }
      }


    }).onError((error, stackTrace) {
      setRxRequestStatusCartModel(Status.ERROR);
      if(kDebugMode){
        print('Error while parsing response : $error');
      }
    });

  }

  /// Add To Cart
  void addToCart(String productId, skuId, category, quantity) async{

    String? email = await preferences.getEmail();

    Map<String, dynamic> data = {
      'productId': productId,
      'skuId': skuId,
      'category': category,
      'quantity': quantity,
      'email': email
    };

    _api.addToCartApi(data).then((response) {

      if(kDebugMode){
        print('Response : $response');
      }

      try{

         if(response['body-json']['statusCode'] == 200){
           
           Utils.toastMessageSuccessful(response['body-json']['body']['message']);
           
         }if(response['body-json']['statusCode'] == 400){
           Utils.toastMessageTop(response['body-json']['body']['message']);
         }else{
           Utils.toastMessageTop(response['body-json']['body']['message']);
         }

      }catch(e){

        if(kDebugMode){
          print('Error While Set E-Commerce Add To Cart Data : $e');
        }
      }

    }).onError((error, stackTrace) {

      if(kDebugMode){
        print('Error While Fetching E-Commerce Add To Cart Data : $error');
      }
    });

  }

  /// Remove From Cart
  void removeFromCart(String productId) async{

    String? email = await preferences.getEmail();

    Map<String, dynamic> data = {
      'email': email,
      'productId': productId
    };

    _api.removeFromCartApi(data).then((response) {

      if(kDebugMode){
        print('Response : $response');
      }

      try{

        if(response['body-json']['statusCode'] == 200){
          setRxRequestStatusCartModel(Status.LOADING);
          cartListApi();
          Utils.toastMessageSuccessful(response['body-json']['body']['message']);

        }if(response['body-json']['statusCode'] == 400){
          Utils.toastMessageTop(response['body-json']['body']['message']);
        }else{
          Utils.toastMessageTop(response['body-json']['body']['message']);
        }

      }catch(e){

        if(kDebugMode){
          print('Error While Set E-Commerce Remove From Cart Data : $e');
        }
      }

    }).onError((error, stackTrace) {

      if(kDebugMode){
        print('Error While Fetching E-Commerce Remove From Cart Data : $error');
      }
    });

  }

  /// Update Quantity
  void updateQuantityFromCartApi(String isQuantity, String productId) async{
    String? email = await preferences.getEmail();

    Map<String, dynamic> data = {
      "email": email,
      "productId": productId,
      "Isquantity": isQuantity
    };

    _api.updateQuantityApi(data).then((response) {

      if(kDebugMode){
        print('Api response received');
        print(response);
      }

      if(response['body-json']['statusCode'] == 200){
        setRxRequestStatusCartModel(Status.LOADING);
        cartListApi();
        Utils.toastMessageTop('Quantity updated Successfully');

      }else if(response['body-json']['statusCode'] == 400){

        Utils.toastMessageTop(response['body-json']['body'].toString());

      }else{

        if(kDebugMode){
          print('Response : $response');
        }
      }

    }).onError((error, stackTrace) {
      setRxRequestStatusCartModel(Status.ERROR);
      if(kDebugMode){
        print('Error while parsing response : $error');
      }
    });

  }

}