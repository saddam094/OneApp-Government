import 'package:one_app/core/network/network_api_services.dart';
import 'package:one_app/res/url/consturl.dart';

class ParticularProductRepository{
  
  final _apiServices = NetworkApiServices();

  Future<dynamic> particularProductApi(Map<String, dynamic> data) async{
    final response = await _apiServices.postApi(data, ConstUrl.particularProduct);
    return response;
  }

}