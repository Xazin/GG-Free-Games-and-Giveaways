import 'package:flutter/material.dart';
import 'package:getwidget/components/accordion/gf_accordion.dart';

import 'package:free_games_giveaways/app/utils/launch_url.dart';
import 'package:free_games_giveaways/free_games/data/models/free_game_details.dart';

class GameHeader extends StatelessWidget {
  final FreeGameDetails game;

  const GameHeader({
    Key? key,
    required this.game,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Image.network(
              game.thumbnail,
              height: 225,
              width: double.infinity,
              fit: BoxFit.contain,
            ),
            Container(
              height: 225,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [0.8, 1],
                  colors: [
                    Colors.transparent,
                    Theme.of(context).canvasColor,
                  ],
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                game.title,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Theme.of(context).cardColor,
                  side: BorderSide(
                    color: Theme.of(context).accentColor,
                  ),
                ),
                onPressed: () {
                  launchURL(game.gameUrl);
                },
                child: Text(
                  'Get the Game',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
        GFAccordion(
          title: game.shortDescription,
          content: game.description,
          collapsedTitleBackgroundColor: Theme.of(context).canvasColor,
          textStyle: TextStyle(color: Colors.white),
          expandedTitleBackgroundColor: Theme.of(context).cardColor,
          contentBackgroundColor: Theme.of(context).cardColor,
          expandedIcon: Text(
            '- Hide',
            style: TextStyle(color: Theme.of(context).accentColor),
          ),
          collapsedIcon: Text(
            '+ Read more',
            style: TextStyle(color: Theme.of(context).accentColor),
          ),
        ),
      ],
    );
  }
}
