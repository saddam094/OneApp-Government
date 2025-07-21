import 'package:one_app/core/network/network_api_services.dart';
import 'package:one_app/res/url/consturl.dart';

class ServiceHomeRepository{

  final _apiServices = NetworkApiServices();

  Future<dynamic> servicesCategoryListApi(Map<String, dynamic> data){
    final response = _apiServices.postApi(data, ConstUrl.allServicesCategory);
    return response;
  }

  Future<dynamic> recommendedServiceManListApi(){
    final response = _apiServices.getApi(ConstUrl.recommendedServiceManList);
    return response;
  }
}