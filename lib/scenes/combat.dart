import 'package:flutter/material.dart';

class Combat extends StatelessWidget {
  const Combat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarTextStyle: Theme.of(context).textTheme.bodyText1,
        backgroundColor: Theme.of(context).colorScheme.tertiaryContainer,
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.tertiaryContainer,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Image(
                  image: AssetImage('assets/images/creatures/bee.png'),
                  width: 80,
                  height: 50,
                ),
                Text("Combat", style: Theme.of(context).textTheme.displayMedium!.copyWith(color: Theme.of(context).colorScheme.onTertiaryContainer).copyWith(letterSpacing: 5)),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 50),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.tertiary,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                Image(
                  image: AssetImage('assets/images/creatures/blub.png'),
                  width: 50,
                  height: 50,
                ),
                Image(
                  image: AssetImage(
                    'assets/images/misc/fighting_girl.png',
                  ),
                  width: 50,
                  height: 50,
                ),
                Image(
                  image: AssetImage('assets/images/misc/fighting_guy.png'),
                  width: 65,
                  height: 65,
                ),
                Image(
                  image: AssetImage('assets/images/creatures/crow.png'),
                  width: 50,
                  height: 50,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
