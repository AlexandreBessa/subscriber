import 'package:flutter/material.dart';
import 'package:mobile/screens/signature/signature_list.dart';

void main() => runApp(Subscriber());

class Subscriber extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.amber[500],
        accentColor: Colors.amber[500],
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.amber[500],
          textTheme: ButtonTextTheme.primary,
        ),
      ),
      home: SignatureList(),
    );
  }
}
