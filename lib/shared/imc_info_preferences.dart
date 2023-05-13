import 'package:shared_preferences/shared_preferences.dart';

class MySharedPreferences {
  static const String poids = "poids";
  static const String taille = "taille";
  static const String imc = "imc";

  static Future<double> getPoids() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getDouble(poids) ?? 0.0;
  }

  static Future<bool> setPoids(double value) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setDouble(poids, value);
  }

  static Future<double> getTaille() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getDouble(taille) ?? 0.0;
  }

  static Future<bool> setTaille(double value) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setDouble(taille, value);
  }

  static Future<double> getIMC() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getDouble(imc) ?? 0.0;
  }

  static Future<bool> setIMC(double value) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setDouble(imc, value);
  }
}
