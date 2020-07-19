import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:listing_app/constants/ui_constants.dart';
import 'package:listing_app/views/overview/body.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: WillPopScope(
        //Wrap out body with a `WillPopScope` widget that handles when a user is cosing current route
        onWillPop: () async {
          Future.value(false); //return a `Future` with false value so this route cant be popped or closed.
        },
        child: Body()
      ),
    );
  }

  AppBar buildAppBar(context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.indigo,
      title: Text("Listings"),
      centerTitle: true,
      elevation: 1,
      actions: <Widget>[
        IconButton(
          icon: SvgPicture.asset(
            "assets/icons/search.svg",
            // By default our  icon color is white
            color: kTextColor,
          ),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(Icons.arrow_right),
          onPressed: () {
            Navigator.of(context).pushNamed("/");
          },
        ),
        SizedBox(width: kDefaultPaddin / 2)
      ],
    );
  }
}
