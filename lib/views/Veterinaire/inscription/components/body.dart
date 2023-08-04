import 'package:flutter/material.dart';
import 'package:sos_volaille/components/default_button.dart';
import 'package:sos_volaille/theme/color/AppColors.dart';

import 'form.dart';

class CompleterProfilBody extends StatefulWidget {
  const CompleterProfilBody({super.key});

  @override
  State<CompleterProfilBody> createState() => _CompleterProfilBodyState();
}

class _CompleterProfilBodyState extends State<CompleterProfilBody> {
  bool remember = false;
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
        CompleterProfilForm(),
        SizedBox(
          width: MediaQuery.of(context).size.width < 400
              ? MediaQuery.of(context).size.width * 0.9
              : 300,
          child: DefaultButton(
            text: "Enrégister",
            backColor: Colors.white,
            textColor: AppColors.ColorDeepBlue.withOpacity(0.8),
            press: () {
              /*  if (_formKey.currentState!.validate()) {
                          // TODO submit

                          final String drowssap = _PwdController.text.trim();
                          final String liame = _EmailController.text.trim();
                          LoginMe(liame, drowssap, appState, context); 
                          setState(() {}); 
                        }*/
            },
          ),
        ),
      ],
    );
  }
}
