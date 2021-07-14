import 'package:flutter/material.dart';

class BackgroundImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => LinearGradient(colors: [
        Colors.white,
        Colors.red.withOpacity(0.8),
        Colors.red.withOpacity(0.8),
        Colors.white,
      ], begin: Alignment.topRight, end: Alignment.bottomLeft)
          .createShader(bounds),
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage("assets/3.jpg"),
          fit: BoxFit.cover,
        )),
      ),
    );
  }
}
