import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:slicing_uiquran/cubit/cubit/ayat_cubit.dart';
import 'package:slicing_uiquran/cubit/cubit/lokal_cubit.dart';
import 'package:slicing_uiquran/cubit/surat_cubit/surat_cubit.dart';
import 'package:slicing_uiquran/pages/surah_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  runApp(MyApp(prefs: prefs));
}

class MyApp extends StatelessWidget {
  final SharedPreferences prefs;
  const MyApp({super.key, required this.prefs});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => SuratCubit()),
        BlocProvider(create: (context) => AyatCubit()),
        BlocProvider(create: (context) => LokalCubit(shared: prefs))
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Al-Quran",
        home: DashboardPage(),
      ),
    );
  }
}
