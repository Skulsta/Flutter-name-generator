import 'package:flutter/material.dart';
import 'package:test_app/all_characters.dart';

class CharacterInfo extends StatelessWidget {
  const CharacterInfo(this.name, {Key? key}) : super(key: key);

  final String name;

  @override
  Widget build(BuildContext context) {
    Character character = characters.firstWhere((element) => element.name == name);

    return Scaffold(
      body: Center(
        child: Text(character.name),
      ),
    );
  }
}
