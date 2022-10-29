import 'package:flutter/material.dart';

class Character {
  const Character(this.name, this.occupation, this.color);

  final String name;
  final String occupation;
  final Color color;
}

const burk = Character('Burk', 'Blacksmith', Color.fromRGBO(53, 53, 36, 1));
const nigel = Character('Nigel', 'Bartender', Color.fromRGBO(85, 80, 86, 1));
const jett = Character('Jett', 'Bounty Hunter', Color.fromRGBO(27, 70, 76, 1));
const maddie = Character('Maddie', 'Hunter', Color.fromRGBO(124, 153, 136, 1));
const lily = Character('Lily', 'Baker', Color.fromRGBO(72, 36, 26, 1));

const characters = <Character>[burk, nigel, jett, maddie, lily];
