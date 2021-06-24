import 'package:shared_preferences/shared_preferences.dart';

/// create register and login form and make validation
/// 1- email validation
/// 2- required validation
/// 3- password must be larger than 6 letters
/// when the user register in the app, his data will be saved in shared prefrences
/// when the user open the app it will redirect him to login or home page
/// based on isLogged key in the sharedprefrences
class SpHelper {
  static final SpHelper spHelper = SpHelper();
  SharedPreferences sharedPreferences;
  initSharedPrefernces() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

///////
  setIsLogged() {
    sharedPreferences.setBool('isLogged', true);
  }

  bool getValue() {
    bool x = sharedPreferences.getBool('isLogged');
    return x ?? false;
  }
}
