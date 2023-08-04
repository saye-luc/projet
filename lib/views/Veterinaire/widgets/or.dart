import 'package:flutter/material.dart';
import 'package:sos_volaille/theme/color/AppColors.dart';

class Or extends StatefulWidget {
  const Or({super.key});

  @override
  State<Or> createState() => _OrState();
}

class _OrState extends State<Or> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        const Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Divider(
              height: 1,
              color: AppColors.ColorGrey,
            ),
          ),
        ),
        Container(
          color: Colors.transparent,
          child: const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 5,
              vertical: 8,
            ),
            child: Text(
              "-○-",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Aller',
                fontSize: 11,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        const Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Divider(
              height: 1,
              color: AppColors.ColorGrey,
            ),
          ),
        ),
      ],
    );
  }
}
