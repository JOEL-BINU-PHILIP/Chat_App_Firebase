import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flash_chat/constants.dart';
class AnimatedCard extends StatelessWidget {
  const AnimatedCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: DefaultTextStyle(
        style: kAnimatedCardTextStyle,
        child: AnimatedTextKit(
          animatedTexts: [
            TypewriterAnimatedText('FARM DOST',
                speed: const Duration(milliseconds: 300))
          ],
        ),
      ),
    );
  }
}
