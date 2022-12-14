import 'package:flutter/material.dart';
import 'package:test_app/components/PhotoHero.dart';
import 'package:test_app/data/all_characters.dart';
import 'package:test_app/scenes/character_info.dart';

class CharactersPage extends StatelessWidget {
  const CharactersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
        ),
        itemCount: characters.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => CharacterInfo(characters[index].name))),
            child: Card(
              color: Theme.of(context).colorScheme.surface,
              shadowColor: Theme.of(context).colorScheme.primary,
              elevation: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    // Scaling for web and phone
                    width: double.infinity,
                    height: 60,
                    padding: const EdgeInsets.only(top: 16),
                    decoration: BoxDecoration(
                      color: characters[index].color,
                      borderRadius:
                          const BorderRadius.only(topLeft: Radius.circular(12), topRight: Radius.circular(12), bottomLeft: Radius.circular(32), bottomRight: Radius.circular(32)),
                    ),
                    child: PhotoHero(
                      photo: 'assets/images/characters/${characters[index].name.toLowerCase()}.png',
                      width: double.infinity,
                      onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => CharacterInfo(characters[index].name))),
                    ),
                  ),
                  Container(
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(characters[index].name, style: Theme.of(context).textTheme.subtitle1),
                        ],
                      )),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
