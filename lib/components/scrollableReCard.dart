import 'package:flutter/material.dart';
class ReusableCard extends StatelessWidget {
  const ReusableCard({
    super.key, required this.colour1, required this.colour2 ,required this.ButtonText, required this.ImageString
  });
  final Color colour1;
  final Color colour2;
  final String ImageString;
  final String ButtonText;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 125,
      width: 263,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.black26, width: 1),
        gradient:LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomLeft,
            colors: [colour1, colour2]),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image(image: AssetImage(ImageString)),
            ),
            SizedBox(width: 30,),
            Padding(
              padding: EdgeInsets.only(top: 8.0, left: 5.0),
              child: Text(
                ButtonText,
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
