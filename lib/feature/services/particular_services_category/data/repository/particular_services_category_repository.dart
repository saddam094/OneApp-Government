import 'package:one_app/core/network/network_api_services.dart';
import 'package:one_app/res/url/consturl.dart';

class ParticularServicesCategoryRepository{

  final _apiServices = NetworkApiServices();

  Future<dynamic> particularCategoryServiceManListApi(Map<String, dynamic> data){
    final response = _apiServices.postApi(data, ConstUrl.particularCategoryServiceManList);
    return response;
  }
}