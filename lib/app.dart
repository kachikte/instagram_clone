import 'package:flutter/material.dart';
import 'presentation/presentation.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Instagram Clone',
      theme: ThemeData.light(),
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
