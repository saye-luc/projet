import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:sos_volaille/components/default_button.dart';
import 'package:sos_volaille/core/services/authentification.dart';
import 'package:sos_volaille/theme/animations/delay_animation.dart';
import 'package:sos_volaille/theme/color/AppColors.dart';
import 'package:sos_volaille/views/Veterinaire/home/accueil_page.dart';
import 'package:sos_volaille/views/Veterinaire/inscription/inscription.page.dart';
//import 'package:sos_volaille/views/Veterinaire/inscription.dart/Inscription.page.dart';
import 'package:sos_volaille/widgets/alerts/showErrorMsg.dart';
import 'package:sos_volaille/widgets/loading/loading.dart';
import 'package:sos_volaille/widgets/or.dart';

import 'form.dart';

class LoginScreenBody extends StatefulWidget {
  const LoginScreenBody({super.key});

  @override
  State<LoginScreenBody> createState() => _LoginScreenBodyState();
}

class _LoginScreenBodyState extends State<LoginScreenBody> {
  bool remember = false;
  final _formKey = GlobalKey<FormState>();
  var emailCont = TextEditingController();
  var passWordCont = TextEditingController();

  //-------------------------------------------------------------//
  String message = '';

  bool reload = false;

  Future LoginMe(
      String password, String email, bool saveMe, BuildContext ctx) async {
    bool showPop = false;

    print("email: $email - password : $password");
    LoadingDialog.show(context, text: "Veuillez patienter ... ");
    await Future.delayed(const Duration(seconds: 1));

    Authentificator()
        .loginUsingEmailPassword(
            email: email, password: password, setMessage, context: ctx)
        .then((value) {
      if (value != null) {
        LoadingDialog.hide(context);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => AccueilPage(),
          ),
        );
        print("${value}");
      } else {
        LoadingDialog.hide(context);
        setState(() {
          showPop = true;
        });
      }
    }).catchError((error) {
      print("error $error");
      LoadingDialog.hide(context);
      setState(() {});
    }).whenComplete(() {
      if (showPop) {
        setState(() {
          showPop = false;
        });
        showDialog(
          barrierDismissible: true,
          context: context,
          builder: (_) => ShowErrorMessage(
            Message: message,
          ),
        );
      }
    });
  }

  void setMessage(String msg) {
    setState(() {
      message = msg;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        LoginForm(
          emailCont: emailCont,
          passWordCont: passWordCont,
          formKey: _formKey,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width < 400
              ? MediaQuery.of(context).size.width * 0.9
              : MediaQuery.of(context).size.width * 0.8,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Switch(
                    value: remember,
                    onChanged: (value) {
                      setState(() {
                        remember = value;
                      });
                    },
                    activeTrackColor: Colors.grey.shade600,
                    inactiveTrackColor: Colors.grey.shade600,
                    activeColor: AppColors.ColorBlue,
                  ),
                  const SizedBox(
                      width: 8), // Add spacing between Switch and text
                  AutoSizeText(
                    "Se souvenir de moi",
                    presetFontSizes: [12, 11, 10, 9, 8, 7],
                    maxLines: 1,
                    textAlign: TextAlign.left, // Adjust text alignment
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ],
              ),

              const Spacer(), // To create spacing between the two sections
              AutoSizeText(
                "Mot de passe oublié",
                presetFontSizes: [12, 11, 10, 9, 8, 7],
                maxLines: 1,
                textAlign: TextAlign.center,
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  color: AppColors.ColorBlue,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Poppins',
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width < 400
              ? MediaQuery.of(context).size.width * 0.9
              : 300,
          child: DefaultButton(
            text: "Se Connecter",
            backColor: Colors.white,
            textColor: AppColors.ColorDeepBlue.withOpacity(0.8),
            press: () {
              if (_formKey.currentState!.validate()) {
                // TODO submit

                final String drowssap = passWordCont.text.trim();
                final String liame = emailCont.text.trim();
                LoginMe(drowssap, liame, remember, context);
                setState(() {});
              }
            },
          ),
        ),
      ],
    );
  }
}
