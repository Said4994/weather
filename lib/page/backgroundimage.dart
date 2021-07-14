import 'package:flutter/material.dart';
import 'package:weather_app/const/screen.dart';

class BackgroundImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenView(context).heightS,
      width: ScreenView(context).widthS,
      decoration: new BoxDecoration(
        color: Colors.purple,
        gradient: new LinearGradient(
            colors: [Colors.white, Colors.green.withOpacity(0.6), Colors.white],
            begin: Alignment.bottomLeft,
            end: Alignment.topLeft),
      ),
    );
  }
}
