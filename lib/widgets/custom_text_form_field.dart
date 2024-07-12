import 'package:flutter/material.dart';
import 'package:xo_game/constants/colors.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key,
      required this.textFieldController,
      required this.shadowColor});

  final TextEditingController textFieldController;
  final Color shadowColor;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) return "This place can't be empty";
        return null;
      },
      style: TextStyle(color: shadowColor, fontSize: 24),
      controller: textFieldController,
      decoration: InputDecoration(
          suffixIcon: shadowColor == xShadowColor
              ? Text("X",
                  style: TextStyle(fontSize: 50, color: Colors.white, shadows: [
                    Shadow(
                        blurRadius: 50,
                        color: xShadowColor,
                        offset: const Offset(0, 0))
                  ]))
              : Text("O",
                  style: TextStyle(fontSize: 50, color: Colors.white, shadows: [
                    Shadow(
                        blurRadius: 50,
                        color: oShadowColor,
                        offset: const Offset(0, 0))
                  ])),
          labelText: shadowColor == xShadowColor ? "Player X" : "Player O",
          labelStyle: TextStyle(color: shadowColor, fontSize: 24),
          hintText: shadowColor == xShadowColor ? "Player 1" : "Player 2",
          hintStyle:
              TextStyle(color: shadowColor.withOpacity(0.5), fontSize: 26),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(color: Colors.white60)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(color: Colors.white60)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: shadowColor))),
    );
  }
}
