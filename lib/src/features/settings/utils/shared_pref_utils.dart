import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesUtils {
  Future<void> addLang(String locale) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString('locale', locale);
  }

  Future<void> addThemeMode(String mode) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString('mode', mode);
  }

  Future<void> addThemeComb(String comb) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString('comb', comb);
  }

  Future<String> getLang() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString('locale') ?? 'en';
  }

  Future<String> getThemeMode() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString('mode') ?? 'dark';
  }

  Future<String> getThemeComb() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString('comb') ?? 'Sakura';
  }
}
