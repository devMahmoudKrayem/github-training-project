import 'package:shared_preferences/shared_preferences.dart';

class PrefsUser {
  static  String firstNameKey = 'firstname';
  static  String lastNameKey = 'lastName';
  static  String emailKey = 'email';
  static  String passwordKey = 'password';
  static  String isLogInKey = 'isLoggIn';

  static Future<void> signUp({
    required String firstName,
    required String lastName,
    required String email,
    required String password,}) async {
    final prefs = await SharedPreferences.getInstance();

     prefs.setString(firstNameKey, firstName);
     prefs.setString(lastNameKey, lastName);
     prefs.setString(emailKey, email.trim());
     prefs.setString(passwordKey, password);
     prefs.setBool(isLogInKey, false);
  }


  static Future<bool> login({
    required String email,
    required String password,
  }) async {
    final prefs = await SharedPreferences.getInstance();

    final savedEmail = prefs.getString(emailKey);
    final savedPassword = prefs.getString(passwordKey);

    if (savedEmail == email.trim() && savedPassword == password) {
       prefs.setBool(isLogInKey, true);
      return true;
    }

    return false;
  }

  static Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
     prefs.setBool(isLogInKey, false);
  }

  static Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(isLogInKey) ?? false;
  }

  static Future<Map<String, String>> getUser() async {
    final prefs = await SharedPreferences.getInstance();
    return {
      'firstName': prefs.getString(firstNameKey) ?? '',
      'lastName': prefs.getString(lastNameKey) ?? '',
      'email': prefs.getString(emailKey) ?? '',
      'password': prefs.getString(passwordKey) ?? '',
    };
  }

  static Future<void> updateUser({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  }) async {
    final prefs = await SharedPreferences.getInstance();

     prefs.setString(firstNameKey, firstName);
     prefs.setString(lastNameKey, lastName);
     prefs.setString(emailKey, email.trim());
     prefs.setString(passwordKey, password);
  }

  static Future<void> deleteAccount() async {
    final prefs = await SharedPreferences.getInstance();

     prefs.remove(firstNameKey);
     prefs.remove(lastNameKey);
     prefs.remove(emailKey);
     prefs.remove(passwordKey);
     prefs.remove(isLogInKey);
  }
}
