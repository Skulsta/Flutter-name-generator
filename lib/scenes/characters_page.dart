import 'package:flutter/material.dart';
import 'package:test_app/all_characters.dart';
import 'package:test_app/components/PhotoHero.dart';
import 'package:test_app/scenes/character_info.dart';

class CharactersPage extends StatelessWidget {
  const CharactersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
          itemCount: characters.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => CharacterInfo(characters[index].name)));
              },
              child: Card(
                color: Theme.of(context).colorScheme.background,
                shadowColor: Theme.of(context).colorScheme.secondary,
                elevation: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 70,
                      width: double.infinity,
                      padding: const EdgeInsets.only(top: 16),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.secondary,
                        borderRadius:
                            const BorderRadius.only(topLeft: Radius.circular(12), topRight: Radius.circular(12), bottomLeft: Radius.circular(32), bottomRight: Radius.circular(32)),
                      ),
                      child: PhotoHero(
                        photo: 'assets/images/characters/${characters[index].name.toLowerCase()}.png',
                        width: double.infinity,
                        onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => CharacterInfo(characters[index].name))),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(height: 8),
                        Text(characters[index].name, style: Theme.of(context).textTheme.subtitle1, textAlign: TextAlign.center),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
