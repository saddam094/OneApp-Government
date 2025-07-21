import 'package:one_app/core/network/network_api_services.dart';
import 'package:one_app/res/url/consturl.dart';

class MyCartRepository{
  
  final _apiServices = NetworkApiServices();
  
  Future<dynamic> cartListApi(Map<String, dynamic> data){
    final response = _apiServices.postApi(data, ConstUrl.cartProductList);
    return response;
  }

  Future<dynamic> addToCartApi(Map<String, dynamic> data){
    final response = _apiServices.postApi(data, ConstUrl.addToCart);
    return response;
  }

  Future<dynamic> removeFromCartApi(Map<String, dynamic> data){
    final response = _apiServices.postApi(data, ConstUrl.removeFromCart);
    return response;
  }

  Future<dynamic> updateQuantityApi(Map<String, dynamic> data){
    final response = _apiServices.postApi(data, ConstUrl.updateQuantity);
    return response;
  }

}