import 'package:flutter/material.dart';
import 'package:test_app/components/PhotoHero.dart';

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
            theme: ThemeData(useMaterial3: true, colorSchemeSeed: const Color.fromRGBO(244, 185, 64, 1), brightness: Brightness.light),
            darkTheme: ThemeData(useMaterial3: true, colorSchemeSeed: const Color.fromRGBO(244, 185, 64, 1), brightness: Brightness.dark),
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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(" People", style: Theme.of(context).textTheme.headline6),
              const Expanded(
                child: CharactersPage(),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.surface,
                    ),
                    child: ListTile(
                      title: Text("Make Chocolate",
                          style: Theme.of(context).textTheme.headline6!.copyWith(color: Theme.of(context).colorScheme.secondary).copyWith(fontWeight: FontWeight.w500)),
                      subtitle: Text("Recipies and ingredients",
                          style: Theme.of(context).textTheme.subtitle1!.copyWith(color: Theme.of(context).colorScheme.secondary).copyWith(fontWeight: FontWeight.w500)),
                      leading: Container(
                        padding: const EdgeInsets.all(7),
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.secondary,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: PhotoHero(
                            photo: MyApp.themeNotifier.value == ThemeMode.light ? 'assets/images/chocolate/white_chocolate.png' : 'assets/images/chocolate/chocolate_bar.png',
                            width: 30,
                            onTap: () {}),
                      ),
                      trailing: Icon(Icons.arrow_forward_ios, color: Theme.of(context).colorScheme.secondary),
                      onTap: () {},
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
