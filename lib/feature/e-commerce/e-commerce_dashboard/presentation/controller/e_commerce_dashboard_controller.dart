import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:one_app/core/response/status.dart';
import 'package:one_app/feature/e-commerce/e-commerce_dashboard/data/model/e_commerce_category_model.dart';
import 'package:one_app/feature/e-commerce/e-commerce_dashboard/data/model/grocery_deals_model.dart';
import 'package:one_app/feature/e-commerce/e-commerce_dashboard/data/model/popular_dishes_model.dart';
import 'package:one_app/feature/e-commerce/e-commerce_dashboard/data/model/prescribed_medicine_model.dart';
import 'package:one_app/feature/e-commerce/e-commerce_dashboard/data/repository/e_commerce_dashboard_repository.dart';

class ECommerceDashboardController extends GetxController{

  List<Map<String, String>> categoryList = [
    {
      'title': 'Fashion',
      'image': 'assets/images/products/fashion.png'
    },
    {
      'title': 'Homemade',
      'image': 'assets/images/products/homemade.png'
    },
    {
      'title': 'Art & Craft',
      'image': 'assets/images/products/art and craft.png'
    },
    {
      'title': 'Snacks',
      'image': 'assets/images/products/snacks.png'
    },
    {
      'title': 'Oil & Masala',
      'image': 'assets/images/products/oil and masala.png'
    }
  ];

  final _api = ECommerceDashboardRepository();

  final rxCategoryModel = Rxn<ECommerceCategoryModel>();
  final rxRequestStatusCategory = Status.LOADING.obs;

  final rxPopularDishesModel = Rxn<PopularDishesModel>();
  final rxRequestStatusPopularDish = Status.LOADING.obs;

  final rxGroceryDealsModel = Rxn<GroceryDealsModel>();
  final rxRequestStatusGroceryDeals = Status.LOADING.obs;

  final rxPrescribedMedicineModel = Rxn<PrescribedMedicineModel>();
  final rxRequestStatusPrescribedMedicine = Status.LOADING.obs;


  void setRxCategoryModel(ECommerceCategoryModel value) => rxCategoryModel.value = value;
  void setRxRequestStatusCategory(Status value) => rxRequestStatusCategory.value = value;

  void setRxPopularDishesModel(PopularDishesModel value) => rxPopularDishesModel.value = value;
  void setRxRequestStatusPopularDish(Status value) => rxRequestStatusPopularDish.value = value;

  void setRxGroceryDealsModel(GroceryDealsModel value) => rxGroceryDealsModel.value = value;
  void setRxRequestStatusGroceryDeals(Status value) => rxRequestStatusGroceryDeals.value = value;

  void setRxPrescribedMedicineModel(PrescribedMedicineModel value) => rxPrescribedMedicineModel.value = value;
  void setRxRequestStatusPrescribedMedicine(Status value) => rxRequestStatusPrescribedMedicine.value = value;

  /// Get Categories For E-Commerce
  void eCommerceCategoryList(){

    Map<String, dynamic> data = {
      'id': 'e-commerce'
    };

    _api.eComCategoryApi(data).then((response) {

      if(kDebugMode){
        print('Response : $response');
      }

      try{

        ECommerceCategoryModel eCommerceCategoryModel = ECommerceCategoryModel.fromJson(response['body-json']['body']);
        setRxCategoryModel(eCommerceCategoryModel);
        setRxRequestStatusCategory(Status.COMPLETED);

        if(kDebugMode){
          print('E-Commerce Category List Data Set Successfully');
        }

      }catch(e){
        setRxRequestStatusCategory(Status.ERROR);
        if(kDebugMode){
          print('Error While Set E-Commerce Category Data : $e');
        }
      }

    }).onError((error, stackTrace) {
      setRxRequestStatusCategory(Status.ERROR);
      if(kDebugMode){
        print('Error While Fetching E-Commerce Category Data : $error');
      }
    });

  }

  /// Get Popular Dishes List
  void popularDoctorList(){

    _api.popularDishesApi().then((response) {

      if(kDebugMode){
        print('Response : $response');
      }

      try{

        PopularDishesModel popularDishesModel = PopularDishesModel.fromJson(response['body-json']);
        setRxPopularDishesModel(popularDishesModel);
        setRxRequestStatusPopularDish(Status.COMPLETED);

        if(kDebugMode){
          print('Popular Dish List Data Set Successfully');
        }

      }catch(e){
        setRxRequestStatusPopularDish(Status.ERROR);
        if(kDebugMode){
          print('Error While Set Popular Dish List Data : $e');
        }
      }

    }).onError((error, stackTrace) {
      setRxRequestStatusPopularDish(Status.ERROR);
      if(kDebugMode){
        print('Error While Fetching Popular Dish List data : $error');
      }
    });

  }

  /// Get Popular Dishes List
  void groceryDealsList(){

    _api.groceryDealsApi().then((response) {

      if(kDebugMode){
        print('Response : $response');
      }

      try{

        GroceryDealsModel groceryDealsModel = GroceryDealsModel.fromJson(response['body-json']);
        setRxGroceryDealsModel(groceryDealsModel);
        setRxRequestStatusGroceryDeals(Status.COMPLETED);

        if(kDebugMode){
          print('Grocery Deals List Data Set Successfully');
        }

      }catch(e){
        setRxRequestStatusGroceryDeals(Status.ERROR);
        if(kDebugMode){
          print('Error While Set Grocery Deals List Data : $e');
        }
      }

    }).onError((error, stackTrace) {
      setRxRequestStatusGroceryDeals(Status.ERROR);
      if(kDebugMode){
        print('Error While Fetching Grocery Deals List data : $error');
      }
    });

  }

  /// Get Popular Dishes List
  void prescribedMedicineList(){

    _api.prescribedMedicineApi().then((response) {

      if(kDebugMode){
        print('Response : $response');
      }

      try{

        PrescribedMedicineModel prescribedMedicineModel = PrescribedMedicineModel.fromJson(response['body-json']);
        setRxPrescribedMedicineModel(prescribedMedicineModel);
        setRxRequestStatusPrescribedMedicine(Status.COMPLETED);

        if(kDebugMode){
          print('Prescribed Medicine List Data Set Successfully');
        }

      }catch(e){
        setRxRequestStatusPrescribedMedicine(Status.ERROR);
        if(kDebugMode){
          print('Error While Set Prescribed Medicine List Data : $e');
        }
      }

    }).onError((error, stackTrace) {
      setRxRequestStatusPrescribedMedicine(Status.ERROR);
      if(kDebugMode){
        print('Error While Fetching Prescribed Medicine List data : $error');
      }
    });

  }

}