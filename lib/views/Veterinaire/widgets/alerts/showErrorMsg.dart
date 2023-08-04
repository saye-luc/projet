import 'package:flutter/material.dart';

import '../../theme/images/images.dart';
 
class ShowErrorMessage extends StatefulWidget {
  String Message;
  ShowErrorMessage({
    Key? key,
    required this.Message,
  }) : super(key: key);
  @override
  State<StatefulWidget> createState() => ShowErrorMessageState();
}

class ShowErrorMessageState extends State<ShowErrorMessage>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> scaleAnimation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
        duration: const Duration(milliseconds: 450), vsync: this);
    scaleAnimation =
        CurvedAnimation(parent: controller, curve: Curves.elasticInOut);

    controller.addListener(() {
      setState(() {});
    });

    controller.forward();
  }

  @override
  // ignore: missing_return
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: ScaleTransition(
            scale: scaleAnimation,
            child: OrientationBuilder(builder: (context, orientation) {
              return SingleChildScrollView(
                child: Container(
                  width: orientation == Orientation.portrait
                      ? MediaQuery.of(context).size.width * 0.8
                      : MediaQuery.of(context).size.width * 0.6,
                  margin: const EdgeInsets.all(5.0),
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    shadows: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        spreadRadius: 3,
                        blurRadius: 7,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const SizedBox(height: 5),
                      Center(
                        child: Container(
                          height: 45,
                          child: Image.asset(
                            Images.iconInfos,
                            fit: BoxFit.contain,
                            color: Colors.red.shade500,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 10.0),
                        child: Text(widget.Message,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontFamily: 'Aller', color: Colors.black)),
                      ),
                    ],
                  ),
                ),
              );
            })),
      ),
    );
  }
}
 