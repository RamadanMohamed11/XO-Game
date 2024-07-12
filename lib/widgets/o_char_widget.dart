import 'package:flutter/material.dart';
import 'package:xo_game/constants/colors.dart';

class OCharWidget extends StatelessWidget {
  const OCharWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("O",
          style: TextStyle(fontSize: 70, color: Colors.white, shadows: [
            Shadow(
                blurRadius: 50, color: oShadowColor, offset: const Offset(0, 0))
          ])),
    );
  }
}
