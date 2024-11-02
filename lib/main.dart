import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slicing_uiquran/cubit/surat_cubit/surat_cubit.dart';
import 'package:slicing_uiquran/pages/surah_page.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => SuratCubit()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Al-Quran",
        home: DashboardPage(),
      ),
    );
  }
}
