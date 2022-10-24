import 'package:flutter/material.dart';

import 'scenes/characters_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static final ValueNotifier<ThemeMode> themeNotifier = ValueNotifier(ThemeMode.dark);

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
        valueListenable: themeNotifier,
        builder: (_, ThemeMode currentMode, __) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Navn',
            theme: ThemeData(useMaterial3: true, colorSchemeSeed: const Color(0xFFFFB88D), brightness: Brightness.light),
            darkTheme: ThemeData(useMaterial3: true, colorSchemeSeed: const Color(0xFFFFB88D), brightness: Brightness.dark),
            themeMode: currentMode,
            home: _Home(),
          );
        });
  }
}

class _Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Chocolatier's Guide"),
        actions: [
          IconButton(
              icon: Icon(MyApp.themeNotifier.value == ThemeMode.light ? Icons.dark_mode : Icons.light_mode),
              onPressed: () {
                MyApp.themeNotifier.value = MyApp.themeNotifier.value == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
              }),
        ],
      ),
      body: const CharactersPage(),
    );
  }
}
