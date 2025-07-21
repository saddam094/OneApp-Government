import 'package:one_app/core/network/network_api_services.dart';
import 'package:one_app/res/url/consturl.dart';

class ECommerceDashboardRepository{

  final _apiServices = NetworkApiServices();

  Future<dynamic> eComCategoryApi(Map<String, dynamic> data){
    final response = _apiServices.postApi(data, ConstUrl.allServicesCategory);
    return response;
  }

  Future<dynamic> popularDishesApi(){
    final response = _apiServices.getApi(ConstUrl.popularDishes);
    return response;
  }

  Future<dynamic> groceryDealsApi(){
    final response = _apiServices.getApi(ConstUrl.groceryDeals);
    return response;
  }

  Future<dynamic> prescribedMedicineApi(){
    final response = _apiServices.getApi(ConstUrl.prescribedMedicine);
    return response;
  }

}