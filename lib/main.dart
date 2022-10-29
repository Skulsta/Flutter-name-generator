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
            theme: ThemeData(useMaterial3: true, colorSchemeSeed: const Color.fromRGBO(228, 176, 123, 1), brightness: Brightness.light),
            darkTheme: ThemeData(useMaterial3: true, colorSchemeSeed: const Color.fromRGBO(228, 176, 123, 1), brightness: Brightness.dark),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Image(
                    image: AssetImage('assets/images/creatures/bee.png'),
                    width: 80,
                    height: 60,
                  ),
                  Text("Combat", style: Theme.of(context).textTheme.displayLarge!.copyWith(color: Theme.of(context).colorScheme.secondary).copyWith(letterSpacing: 5)),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  Image(
                    image: AssetImage('assets/images/creatures/blub.png'),
                    width: 60,
                    height: 60,
                  ),
                  Image(
                    image: AssetImage(
                      'assets/images/misc/fighting_girl.png',
                    ),
                    width: 60,
                    height: 60,
                  ),
                  Image(
                    image: AssetImage('assets/images/misc/fighting_guy.png'),
                  ),
                  Image(
                    image: AssetImage('assets/images/creatures/crow.png'),
                    width: 60,
                    height: 60,
                  ),
                ],
              ),
              const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: ListTile(
                      title: Text("Make Chocolate", style: Theme.of(context).textTheme.headline6),
                      subtitle: Text("Recipies and ingredients", style: Theme.of(context).textTheme.subtitle1),
                      leading: Container(
                        padding: const EdgeInsets.all(7),
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primary.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: PhotoHero(
                            photo: MyApp.themeNotifier.value == ThemeMode.light ? 'assets/images/chocolate/white_chocolate.png' : 'assets/images/chocolate/chocolate_bar.png',
                            width: 30,
                            onTap: () {}),
                      ),
                      trailing: const Icon(Icons.arrow_forward_ios),
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
