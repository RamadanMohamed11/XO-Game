import 'package:flutter/material.dart';
import 'package:xo_game/constants/colors.dart';
import 'package:xo_game/pages/single_player_name_page.dart';
import 'package:xo_game/pages/two_players_name_page.dart';
import 'package:xo_game/widgets/custom_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kMainColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: CustomButton(
                text: "Single Player",
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return SinglePlayerNamePage();
                  }));
                }),
          ),
          const SizedBox(
            height: 100,
          ),
          Center(
            child: CustomButton(
                text: "Two Players",
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return TwoPlayersNamePage();
                  }));
                }),
          )
        ],
      ),
    );
  }
}
