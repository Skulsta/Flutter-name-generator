import 'package:flutter/material.dart';

class Combat extends StatelessWidget {
  const Combat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarTextStyle: Theme.of(context).textTheme.bodyText1,
        backgroundColor: Theme.of(context).colorScheme.tertiaryContainer,
        iconTheme: IconThemeData(
          color: Theme.of(context).colorScheme.onTertiaryContainer,
        ),
        title: Text(
          "Combat",
          style: Theme.of(context).textTheme.headline5!.copyWith(color: Theme.of(context).colorScheme.onTertiaryContainer),
        ),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              "Lots of content",
              style: Theme.of(context).textTheme.displaySmall!.copyWith(color: Theme.of(context).colorScheme.onTertiaryContainer),
            ),
            const SizedBox(
              width: 16,
            ),
            const Image(
              image: AssetImage('assets/images/misc/fighting_guy.png'),
              width: 70,
              height: 70,
            ),
          ],
        ),
      ),
    );
  }
}
