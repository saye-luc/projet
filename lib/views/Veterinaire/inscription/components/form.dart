import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:sos_volaille/views/Veterinaire/login/login.page.dart';
import 'package:sos_volaille/widgets/inputs/input.dart';

import '../../../../components/square_tile.dart';
import '../../../../core/services/auth_services.dart';
import '../../../../theme/animations/delay_animation.dart';

class CompleterProfilForm extends StatefulWidget {
  const CompleterProfilForm({super.key});

  @override
  State<CompleterProfilForm> createState() => _CompleterProfilFormState();
}

class _CompleterProfilFormState extends State<CompleterProfilForm> {
  final _formKey = GlobalKey<FormState>();
  bool remember = false;
  var nomCont = TextEditingController();
  var prenomCont = TextEditingController();
  var telCont = TextEditingController();
  var adresseCont = TextEditingController();
  var emailCont = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  //############################################################################///

  String? currentSelectedValue;

  final ValueNotifier<List<String>> _listNotifier =
      ValueNotifier<List<String>>(["type1", "type2", "type3"]);

  Color inputBorderColor = Color(0xffd0e2ea);
  Color textColor = Color(0xff90a1ac);

  Widget typeFieldWidget() {
    return ValueListenableBuilder(
      valueListenable: _listNotifier,
      builder: (BuildContext context, List<String> list, Widget? child) {
        return Container(
          padding: const EdgeInsets.all(2.0),
          margin: const EdgeInsets.only(left: 10, right: 10),
          child: FormField<String>(
            builder: (FormFieldState<String> state) {
              return InputDecorator(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: inputFillColor,
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: inputBorderColor)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: inputBorderColor)),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide: BorderSide(color: inputBorderColor)),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black87,
                        fontFamily: "Aller"),
                    hint: Text(
                      "Choisir type",
                      style: TextStyle(
                        color: Colors.grey.shade800.withOpacity(0.6),
                      ),
                    ),
                    value: currentSelectedValue,
                    isDense: true,
                    onChanged: (newValue) {
                      currentSelectedValue = newValue;
                      _listNotifier.notifyListeners();
                    },
                    items: list.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.black87,
                            fontFamily: "Aller",
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }

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
              key: _formKey,
              child: Column(children: <Widget>[
                //Le name
                Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 5.0, vertical: 5),
                        child: Text(
                          'Nom',
                          style: TextStyle(
                            fontSize: 12,
                            fontFamily: "Aller",
                            fontWeight: FontWeight.bold,
                            color: Color(0xff696D6E),
                          ),
                        ),
                      ),
                      InputTextField(
                        type: "nom",
                        text: "Votre nom",
                        controller: nomCont,
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
                          'Prénom(s)',
                          style: TextStyle(
                            fontSize: 12,
                            fontFamily: "Aller",
                            fontWeight: FontWeight.bold,
                            color: Color(0xff696D6E),
                          ),
                        ),
                      ),
                      InputTextField(
                        type: "prenom",
                        text: "Prénom(s)",
                        controller: prenomCont,
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
                          'Téléphone',
                          style: TextStyle(
                            fontSize: 12,
                            fontFamily: "Aller",
                            fontWeight: FontWeight.bold,
                            color: Color(0xff696D6E),
                          ),
                        ),
                      ),
                      InputTextField(
                        type: "phone",
                        text: "(+223) xx xx xx x",
                        controller: telCont,
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
                          'Adresse',
                          style: TextStyle(
                            fontSize: 12,
                            fontFamily: "Aller",
                            fontWeight: FontWeight.bold,
                            color: Color(0xff696D6E),
                          ),
                        ),
                      ),
                      InputTextField(
                        type: "adresse",
                        text: "Votre Adresse",
                        controller: adresseCont,
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
                          'Mot de passe',
                          style: TextStyle(
                            fontSize: 12,
                            fontFamily: "Aller",
                            fontWeight: FontWeight.bold,
                            color: Color(0xff696D6E),
                          ),
                        ),
                      ),
                      InputTextField(
                        type: "Mot de passe",
                        text: "Votre Mot de passe ",
                        controller: adresseCont,
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
                          'Comfirmer',
                          style: TextStyle(
                            fontSize: 12,
                            fontFamily: "Aller",
                            fontWeight: FontWeight.bold,
                            color: Color(0xff696D6E),
                          ),
                        ),
                      ),
                      InputTextField(
                        type: "confirmer",
                        text: "confirmer votre mot de passe  ",
                        controller: adresseCont,
                        prefixIcon: false,
                        requis: true,
                      ),
                    ]),
                const SizedBox(
                  height: 15,
                ),
                // google + apple sign in buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // google button
                    SquareTile(
                      onTap: () => AuthService().signInwithGoogle(),
                      imagePath: 'lib/images/google.png',
                    ),
                    const SizedBox(width: 25),
                  ],
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
