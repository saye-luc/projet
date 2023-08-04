import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:sos_volaille/theme/animations/delay_animation.dart';
import 'package:sos_volaille/theme/color/AppColors.dart';
import 'package:sos_volaille/theme/images/images.dart';
import 'package:sos_volaille/views/Veterinaire/inscription/components/body.dart';

class CompleterProfilScreen extends StatefulWidget {
  const CompleterProfilScreen({super.key});

  @override
  State<CompleterProfilScreen> createState() => _CompleterProfilScreenState();
}

class _CompleterProfilScreenState extends State<CompleterProfilScreen> {
  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: AppColors.ColorWhite,
      extendBodyBehindAppBar: true,
      body: Stack(children: [
        Positioned(
          right: -20,
          top: -20,
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.ColorGreen.withOpacity(0.1),
              borderRadius: BorderRadius.circular(100),
            ),
            width: 150,
            height: 150,
          ),
        ),
        Positioned(
          left: -50,
          bottom: -50,
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.ColorGreen.withOpacity(0.1),
              borderRadius: BorderRadius.circular(100),
            ),
            width: 200,
            height: 200,
          ),
        ),
        Center(
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 10),
                  DelayedAnimation(
                    delay: 1000,
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Container(
                        width: 150,
                        height: 150,
                        child: Image.asset(
                          Images.yes,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  DelayedAnimation(
                    delay: 1500,
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 10),
                      decoration: BoxDecoration(
                        color: AppColors.ColorGrey.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                            text: "Je n’ai pas de compte",
                            style: TextStyle(
                                color: Colors.black87,
                                fontSize: 14,
                                fontWeight: FontWeight.w300),
                            children: [
                              TextSpan(
                                  text: ' Créer un compte',
                                  style: TextStyle(color: Colors.blue.shade400),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {}),
                            ]),
                      ),
                    ),
                  ),
                  _buildTitleText(context),
                  const SizedBox(
                    height: 5,
                  ),
                  _buildIntroText(context),
                  const SizedBox(
                    height: 5,
                  ),
                  const CompleterProfilBody(),
                  const SizedBox(
                    height: 5,
                  ),
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }

  Widget _buildIntroText(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: DelayedAnimation(
        delay: 1000,
        child: AutoSizeText(
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit,sed do eiusmod tempor incididunt ",
          minFontSize: 11,
          maxLines: 2,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w400,
            fontFamily: 'Poppins',
          ),
        ),
      ),
    );
  }

  Widget _buildTitleText(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: DelayedAnimation(
        delay: 1000,
        child: AutoSizeText(
          "Inscription",
          presetFontSizes: [15, 14, 13, 12, 11],
          maxLines: 1,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w500,
            fontFamily: 'Poppins',
          ),
        ),
      ),
    );
  }
}
