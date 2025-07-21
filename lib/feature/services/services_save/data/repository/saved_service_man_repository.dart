import 'package:one_app/core/network/network_api_services.dart';
import 'package:one_app/res/url/consturl.dart';

class SavedServiceManRepository{

  final _apiServices = NetworkApiServices();

  Future<dynamic> savedServiceManListApi(Map<String, dynamic> data){
    final response = _apiServices.postApi(data, ConstUrl.savedServiceManList);
    return response;
  }

  Future<dynamic> savedUnsavedApi(Map<String, dynamic> data){
    final response = _apiServices.postApi(data, ConstUrl.savedUnsaved);
    return response;
  }

}