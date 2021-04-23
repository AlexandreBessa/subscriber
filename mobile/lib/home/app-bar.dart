import 'package:flutter/material.dart';

class AppBarWidget extends PreferredSize {
  AppBarWidget()
      : super(
            preferredSize: Size.fromHeight(150),
            child: Container(
              height: 150,
              decoration: BoxDecoration(color: Colors.yellowAccent),
            ));
}
