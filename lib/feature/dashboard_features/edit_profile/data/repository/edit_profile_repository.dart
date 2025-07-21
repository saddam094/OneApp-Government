import 'package:one_app/core/network/network_api_services.dart';
import 'package:one_app/res/url/consturl.dart';

class EditProfileRepository{

  final _apiServices = NetworkApiServices();

  Future<dynamic> userProfileApi(Map<String, dynamic> data){

    final response = _apiServices.postApi(data, ConstUrl.doctorUserProfile);
    return response;

  }

  Future<dynamic> editUserProfileApi(Map<String, dynamic> data){

    final response = _apiServices.postApi(data, ConstUrl.editUserProfile);
    return response;

  }
}