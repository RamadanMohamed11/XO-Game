import 'package:flutter/material.dart';
import 'package:xo_game/constants/colors.dart';

class XCharWidget extends StatelessWidget {
  const XCharWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("X",
          style: TextStyle(fontSize: 70, color: Colors.white, shadows: [
            Shadow(
                blurRadius: 50, color: xShadowColor, offset: const Offset(0, 0))
          ])),
    );
  }
}
