import 'package:shared_preferences/shared_preferences.dart';

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
