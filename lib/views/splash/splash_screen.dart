import 'dart:async';
import 'package:flutter/material.dart';
import 'package:listing_app/constants/ui_constants.dart';
import 'package:listing_app/views/manage/edit_location.dart';
import 'package:listing_app/views/overview/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {

  final TextStyle styleTextUnderTheLoader = TextStyle(
      fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.black);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  SharedPreferences _prefs;
  String _cityName;
  bool _hasSelectedLocation = false;

  String _versionName = 'v1.0';
  final splashDelay = 4;

  @override
  void initState() {
    super.initState();
    _loadWidget();
  }

  _loadWidget() async {
     _prefs = await SharedPreferences.getInstance();
    _cityName = _prefs.getString('cityName');
    if(_cityName == null){
      _hasSelectedLocation = false;
    }else{
      _hasSelectedLocation = true;
    }
    var _duration = Duration(seconds: splashDelay);
    return Timer(_duration, navigationPage);
  }

  void navigationPage() {
    if(_hasSelectedLocation){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => HomeScreen(menu: "Doctors")));
    }else{
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => EditLocation()));
    } 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appPrimaryColor,
      body: InkWell(
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  flex: 7,
                  child: Container(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      /*Image.asset(
                        'assets/images/splash.jpg',
                        height: 300,
                        width: 300,
                      ),*/
                      Text(
                          "MoCity",
                          style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.w800),
                        ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                      ),
                    ],
                  )),
                ),
                Expanded(
                  child: Column(
                    children: <Widget>[
                     // CircularProgressIndicator(),
                      Container(
                        height: 10,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Spacer(),
                            Text(_versionName, style: TextStyle(color: Colors.white),),
                            Spacer(
                              flex: 4,
                            ),
                            Text('Made In Sambalpur', style: TextStyle(color: Colors.white),),
                            Spacer(),
                          ])
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
