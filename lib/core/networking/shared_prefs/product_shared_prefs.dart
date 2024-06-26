import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final productSharedPrefsProvider = Provider<ProductSharedPrefs>((ref) {
  return ProductSharedPrefs();
});

class ProductSharedPrefs {
  late SharedPreferences _sharedPreferences;
}
