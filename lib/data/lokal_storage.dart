import 'package:shared_preferences/shared_preferences.dart';

  Future<String> getLastRead(SharedPreferences shared) async {
    return shared.getString('namaSurah')!;
  }

  void saveLastRead(String namaSurah, SharedPreferences shared) {
    shared.setString('namaSurah', namaSurah);
  }
