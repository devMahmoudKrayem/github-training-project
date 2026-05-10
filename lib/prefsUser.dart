import 'package:shared_preferences/shared_preferences.dart';

class PrefsUser {
  static const String firstNameKey = 'firstname';
  static const String lastNameKey = 'lastName';
  static const String emailKey = 'email';
  static const String passwordKey = 'password';
  static const String isLoggedInKey = 'isLoggedIn';

  // SIGN UP
  static Future<void> signUp({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  }) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setString(firstNameKey, firstName);
    await prefs.setString(lastNameKey, lastName);
    await prefs.setString(emailKey, email.trim());
    await prefs.setString(passwordKey, password);
    await prefs.setBool(isLoggedInKey, false);
  }

  // LOGIN
  static Future<bool> login({
    required String email,
    required String password,
  }) async {
    final prefs = await SharedPreferences.getInstance();

    final savedEmail = prefs.getString(emailKey);
    final savedPassword = prefs.getString(passwordKey);

    final isValid =
        savedEmail == email.trim() && savedPassword == password;

    if (isValid) {
      await prefs.setBool(isLoggedInKey, true);
    }

    return isValid;
  }

  // LOGOUT
  static Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(isLoggedInKey, false);
  }

  // CHECK LOGIN STATUS
  static Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(isLoggedInKey) ?? false;
  }

  // GET USER DATA
  static Future<Map<String, String>> getUser() async {
    final prefs = await SharedPreferences.getInstance();

    return {
      'firstName': prefs.getString(firstNameKey) ?? '',
      'lastName': prefs.getString(lastNameKey) ?? '',
      'email': prefs.getString(emailKey) ?? '',
      'password': prefs.getString(passwordKey) ?? '',
    };
  }

  // UPDATE USER
  static Future<void> updateUser({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  }) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setString(firstNameKey, firstName);
    await prefs.setString(lastNameKey, lastName);
    await prefs.setString(emailKey, email.trim());
    await prefs.setString(passwordKey, password);
  }

  // DELETE ACCOUNT
  static Future<void> deleteAccount() async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.remove(firstNameKey);
    await prefs.remove(lastNameKey);
    await prefs.remove(emailKey);
    await prefs.remove(passwordKey);
    await prefs.remove(isLoggedInKey);
  }
}