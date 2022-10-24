import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:test_app/all_characters.dart';
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
        toolbarTextStyle: Theme.of(context).textTheme.bodyText1,
      ),
      body: SafeArea(
        child: Center(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            width: MediaQuery.of(context).size.width > 600 ? 600 : MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(character.name, style: Theme.of(context).textTheme.headline3!.copyWith(color: Theme.of(context).colorScheme.secondary)),
                        Text(character.occupation, style: Theme.of(context).textTheme.headline6!.copyWith(color: Theme.of(context).colorScheme.secondary)),
                      ],
                    ),
                    Container(
                      width: 200.00 - character.occupation.length,
                      height: 130,
                      padding: const EdgeInsets.only(top: 8),
                      alignment: Alignment.bottomCenter,
                      decoration: BoxDecoration(
                        border: Border.all(color: Theme.of(context).colorScheme.secondary),
                        borderRadius: const BorderRadius.all(Radius.circular(12)),
                      ),
                      child: PhotoHero(
                        photo: 'assets/images/characters/${character.name.toLowerCase()}.png',
                        width: 120,
                        onTap: () {},
                      ),
                    ),
                  ],
                ),
                Divider(
                  color: Theme.of(context).colorScheme.secondary,
                  height: 32,
                  thickness: 1,
                  indent: 0,
                  endIndent: 0,
                ),
                Container(
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
