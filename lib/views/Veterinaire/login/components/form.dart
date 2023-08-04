import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:sos_volaille/core/services/authentification.dart';
import 'package:sos_volaille/widgets/inputs/input.dart';
import 'package:sos_volaille/widgets/loading/loading.dart';

import '../../../../theme/animations/delay_animation.dart';
import '../../../../widgets/alerts/showErrorMsg.dart';

class LoginForm extends StatefulWidget {
  TextEditingController emailCont;
  TextEditingController passWordCont;
  final GlobalKey<FormState> formKey;
  LoginForm({super.key, required this.emailCont, required this.passWordCont, required this.formKey});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  //-------------------------------------------------------------//

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: DelayedAnimation(
          delay: 1000,
          child: SizedBox(
            width: MediaQuery.of(context).size.width < 400
                ? MediaQuery.of(context).size.width * 0.9
                : MediaQuery.of(context).size.width * 0.8,
            child: Form(
              key: widget.formKey, 
              child: Column(children: <Widget>[
                //Le name
                Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 5.0, vertical: 5),
                        child: Text(
                          'Email / Numero Téléphone',
                          style: TextStyle(
                            fontSize: 12,
                            fontFamily: "Aller",
                            fontWeight: FontWeight.bold,
                            color: Color(0xff696D6E),
                          ),
                        ),
                      ),
                      InputTextField(
                        type: "Email",
                        text: "Votre Adresse Email",
                        controller: widget.emailCont,
                        prefixIcon: false,
                        requis: true,
                      ),
                    ]),

                const SizedBox(
                  height: 5,
                ),
                Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 5.0, vertical: 5),
                        child: Text(
                          'Mot de Passe',
                          style: TextStyle(
                            fontSize: 12,
                            fontFamily: "Aller",
                            fontWeight: FontWeight.bold,
                            color: Color(0xff696D6E),
                          ),
                        ),
                      ),
                      InputTextField(
                        type: "password",
                        text: "Mot de passe",
                        controller: widget.passWordCont,
                        prefixIcon: false,
                        requis: true,
                      ),
                    ]),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
