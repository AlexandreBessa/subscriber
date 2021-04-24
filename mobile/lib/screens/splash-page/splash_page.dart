import 'package:flutter/material.dart';
import 'package:mobile/widgets/app_images.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: Colors.black),
        child: Center(child: Image.asset(AppImages.logo)),
      ),
    );
  }
}
