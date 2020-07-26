import 'package:flutter/material.dart';
import 'package:listing_app/constants/ui_constants.dart';

class EditLocation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Change city"),
        backgroundColor: appPrimaryColor,
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text("Choose your city!")
          ],
        ),
      ),
    );
  }
}