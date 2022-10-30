import 'package:flutter/material.dart';
import 'package:test_app/components/PhotoHero.dart';
import 'package:test_app/scenes/combat.dart';

import 'components/characters_grid.dart';

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
          child: Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(" People", style: Theme.of(context).textTheme.headline6),
                  const SizedBox(height: 270, child: CharactersPage()),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(" Chocolate", style: Theme.of(context).textTheme.headline6),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 16),
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          color: Theme.of(context).colorScheme.secondaryContainer,
                        ),
                        child: ListTile(
                          title: Text("Make Chocolate",
                              style:
                                  Theme.of(context).textTheme.headline6!.copyWith(color: Theme.of(context).colorScheme.onPrimaryContainer).copyWith(fontWeight: FontWeight.w500)),
                          subtitle:
                              Text("Recipies and ingredients", style: Theme.of(context).textTheme.subtitle1!.copyWith(color: Theme.of(context).colorScheme.onPrimaryContainer)),
                          leading: Container(
                            padding: const EdgeInsets.all(7),
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.onPrimaryContainer.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.all(color: Theme.of(context).colorScheme.onPrimaryContainer, width: 2),
                            ),
                            child: PhotoHero(
                                photo: MyApp.themeNotifier.value == ThemeMode.light ? 'assets/images/chocolate/white_chocolate.png' : 'assets/images/chocolate/chocolate_bar.png',
                                width: 30,
                                onTap: () {}),
                          ),
                          trailing: Icon(Icons.arrow_forward_ios, color: Theme.of(context).colorScheme.onPrimaryContainer),
                          onTap: () {},
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(" Combat", style: Theme.of(context).textTheme.headline6),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 16),
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          color: Theme.of(context).colorScheme.tertiaryContainer,
                        ),
                        child: ListTile(
                          onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Combat())),
                          title: Text("Prepare for battle",
                              style:
                                  Theme.of(context).textTheme.headline6!.copyWith(color: Theme.of(context).colorScheme.onTertiaryContainer).copyWith(fontWeight: FontWeight.w500)),
                          subtitle:
                              Text("Creatures, weapons & arms", style: Theme.of(context).textTheme.subtitle1!.copyWith(color: Theme.of(context).colorScheme.onTertiaryContainer)),
                          leading: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 4),
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.onTertiaryContainer.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.all(color: Theme.of(context).colorScheme.onTertiaryContainer, width: 2),
                            ),
                            child: PhotoHero(photo: 'assets/images/creatures/blub.png', width: 30, onTap: () {}),
                          ),
                          trailing: Icon(Icons.arrow_forward_ios, color: Theme.of(context).colorScheme.onPrimaryContainer),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
