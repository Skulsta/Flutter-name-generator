import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:test_app/data/all_characters.dart';
import 'package:test_app/components/PhotoHero.dart';

class CharacterInfo extends StatelessWidget {
  const CharacterInfo(this.name, {Key? key}) : super(key: key);

  final String name;

  @override
  Widget build(BuildContext context) {
    Character character = characters.firstWhere((element) => element.name == name);
    timeDilation = 3.0;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: character.color,
        toolbarTextStyle: Theme.of(context).textTheme.bodyText1,
      ),
      body: SafeArea(
        child: Center(
          child: SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.1),
                  alignment: Alignment.bottomRight,
                  decoration: BoxDecoration(
                    color: character.color,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                          width: MediaQuery.of(context).size.width * 0.5,
                          padding: const EdgeInsets.only(top: 16, left: 16),
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.surface,
                            borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(16),
                            ),
                          ),
                          child: Text(
                            character.name,
                            style: Theme.of(context).textTheme.displayMedium!.copyWith(color: character.color),
                          )),
                      PhotoHero(
                        photo: 'assets/images/characters/${character.name.toLowerCase()}.png',
                        width: 120,
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Some text here', style: Theme.of(context).textTheme.headline4),
                      const SizedBox(height: 8),
                      Text('More text here', style: Theme.of(context).textTheme.subtitle1),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
