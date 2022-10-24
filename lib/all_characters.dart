class Character {
  const Character(this.name, this.occupation);

  final String name;
  final String occupation;
}

const burk = Character('Burk', 'Blacksmith');
const nigel = Character('Nigel', 'Bartender');
const jett = Character('Jett', 'Bounty Hunter');
const maddie = Character('Maddie', 'Hunter');
const lily = Character('Lily', 'Baker');

const characters = <Character>[burk, nigel, jett, maddie, lily];
