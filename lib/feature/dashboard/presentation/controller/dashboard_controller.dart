import 'package:get/get.dart';
// import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:one_app/res/preferences/user_preferences.dart';

class DashboardController extends GetxController{

  final userPreferences = UserPreference();
  final name = ''.obs;

  void getEmail()async{
    String? e = await userPreferences.getEmail();
    name.value = e!;

    // String? token = await userPreferences.getToken();
    //
    // Map<String, dynamic> decodedToken = JwtDecoder.decode(token);
    // name.value = decodedToken['name'];
    // print(decodedToken);

  }

}