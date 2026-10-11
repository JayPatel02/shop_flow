import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop_flow/core/constants/app_string.dart';

class SharedPreferenceService {
  SharedPreferenceService._internal();

  static final SharedPreferenceService _instance = SharedPreferenceService._internal();

  static SharedPreferenceService get instance => _instance;

  late final SharedPreferences _prefs;

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

 // bool values
  bool get introShown => _prefs.getBool(AppString.isIntroScreenShown) ?? false;
  set isIntroShow(bool value) => _prefs.setBool(AppString.isIntroScreenShown, value);
}