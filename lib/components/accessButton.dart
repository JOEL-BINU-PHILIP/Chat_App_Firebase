import 'package:flutter/material.dart';

class AccessButton extends StatelessWidget {
  const AccessButton({super.key , required this.buttonColour, required this.buttonText ,required this.whenPressed});
  final Color buttonColour;
  final String buttonText;
  final Function() whenPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: buttonColour,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: whenPressed,
          minWidth: 200.0,
          height: 42.0,
          child: Text(buttonText, style: const TextStyle(color: Colors.white),),
        ),
      ),
    );
  }
}
