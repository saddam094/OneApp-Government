import 'package:one_app/core/network/network_api_services.dart';
import 'package:one_app/res/url/consturl.dart';

class ParticularShopRepository{

  final _apiServices = NetworkApiServices();

  Future<dynamic> particularShopProductCategoryApi(Map<String, dynamic> data){
    final response = _apiServices.postApi(data, ConstUrl.particularShopProductCategory);
    return response;
  }

  Future<dynamic> particularShopCategoryProducts(Map<String, dynamic> data){
    final response = _apiServices.postApi(data, ConstUrl.particularShopCategoryProducts);
    return response;
  }

  Future<dynamic> particularShopDetailApi(Map<String, dynamic> data){
    final response = _apiServices.postApi(data, ConstUrl.particularShopDetails);
    return response;
  }

}