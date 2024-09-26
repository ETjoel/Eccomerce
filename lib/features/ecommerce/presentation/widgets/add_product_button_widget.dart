import 'package:flutter/material.dart';

import '../../../../core/constants.dart';

class AddButton extends StatelessWidget {
  final Function onPressed;
  final String name;
  final double width;
  const AddButton({
    Key? key,
    required this.onPressed,
    this.width = double.infinity,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          onPressed();
        },
        child: Container(
          alignment: Alignment.center,
          width: width,
          height: 50,
          decoration: BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            name,
            style: const TextStyle(color: Colors.white, fontSize: 20),
          ),
        ));
  }
}
