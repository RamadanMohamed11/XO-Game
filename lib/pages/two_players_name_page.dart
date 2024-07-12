import 'package:flutter/material.dart';
import 'package:xo_game/constants/colors.dart';
import 'package:xo_game/pages/two_game_page.dart';
import 'package:xo_game/widgets/custom_button.dart';
import 'package:xo_game/widgets/custom_text_form_field.dart';

class TwoPlayersNamePage extends StatelessWidget {
  TwoPlayersNamePage({super.key});
  TextEditingController xTextFieldController = TextEditingController();
  TextEditingController oTextFieldController = TextEditingController();
  final GlobalKey<FormState> _myKey = GlobalKey<FormState>();
  late String xName;
  late String oName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kMainColor,
      body: Form(
        key: _myKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 250,
                ),
                const Center(
                  child: Text(
                    "Enter The Players Name",
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                CustomTextFormField(
                  textFieldController: xTextFieldController,
                  shadowColor: xShadowColor,
                ),
                const SizedBox(
                  height: 25,
                ),
                CustomTextFormField(
                  textFieldController: oTextFieldController,
                  shadowColor: oShadowColor,
                ),
                const SizedBox(
                  height: 100,
                ),
                CustomButton(
                  text: "Start Game",
                  onTap: () {
                    if (_myKey.currentState!.validate()) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return TwoGamePage(
                          oName: oTextFieldController.text,
                          xName: xTextFieldController.text,
                        );
                      }));
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
