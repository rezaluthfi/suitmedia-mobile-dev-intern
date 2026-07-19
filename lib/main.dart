import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:suitmedia_mobile_dev_intern/core/providers/app_providers.dart';
import 'package:suitmedia_mobile_dev_intern/screens/first_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => AppProvider())],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Suitmedia Mobile Dev Intern',
      debugShowCheckedModeBanner: false,

      home: const FirstScreen(),
    );
  }
}
