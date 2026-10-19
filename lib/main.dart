import 'package:flutter/material.dart';

import 'home_page.dart';

void main() {
  runApp(const MovieLibraryApp());
}

class MovieLibraryApp extends StatelessWidget {
  const MovieLibraryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie Library',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF6C4CF1)),
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFF7F6FC),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFF7F6FC),
          surfaceTintColor: Colors.transparent,
          centerTitle: false,
        ),
      ),
      home: const HomePage(),
    );
  }
}
