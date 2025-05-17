import 'package:bloc/bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:slicing_uiquran/data/lokal_storage.dart';

class LokalCubit extends Cubit<String> {
  final SharedPreferences shared;
  LokalCubit({required this.shared}) : super("-");
  void saveData(String nama) async {
    saveLastRead(nama, shared);
    emit(nama);
  }

  Future<void> getData() async {
    var data = await getLastRead(shared);
    emit(data.isEmpty ? "-" : data);
  }
}
