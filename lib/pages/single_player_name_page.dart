import 'package:flutter/material.dart';
import 'package:xo_game/constants/colors.dart';
import 'package:xo_game/pages/single_game_page.dart';
import 'package:xo_game/widgets/custom_button.dart';
import 'package:xo_game/widgets/custom_text_form_field.dart';

class SinglePlayerNamePage extends StatelessWidget {
  SinglePlayerNamePage({super.key});
  final TextEditingController singlePlayerNameController =
      TextEditingController();
  final GlobalKey<FormState> _myKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kMainColor,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Form(
          key: _myKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 100,
              ),
              Center(
                child: CustomTextFormField(
                    textFieldController: singlePlayerNameController,
                    shadowColor: xShadowColor),
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
                      return SingleGamePage(
                        xName: singlePlayerNameController.text,
                      );
                    }));
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
