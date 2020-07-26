import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:listing_app/constants/ui_constants.dart';
import 'package:listing_app/views/manage/edit_location.dart';
import 'package:listing_app/views/overview/home.dart';
import 'package:listing_app/views/sidebar/menu_item.dart';

//https://www.youtube.com/watch?v=iX07Xnn4ol8&t=12s
class MainDrawer extends StatefulWidget {
  @override
  _MainDrawerState createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {

  var apiRes, categories;
  var menus = ["Healthcare", "Education", "Tourism", "Shopping", "Emergency"];
  @override
  void initState() {
    super.initState();
    //getCategoriesFromAPI();
  }

  getCategoriesFromAPI() async{
    //apiRes = await http.get("/listingcategory?_fields=id,name");
    //print(apiRes.body);// this is as string response, so it has to be converted to json
    categories = ["Home", "Orders", "Details", "Profile"];//jsonDecode(apiRes.body);
    //print(categories);
    setState(() {
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
          child:  Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  color: appPrimaryColor,
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 35,
                      ),
                      ListTile(
                        title: Text(
                          "MoCity",
                          style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.w800),
                        ),
                        subtitle: Text(
                          "Sambalpur",
                          style: TextStyle(
                            color: Color(0xFF1BB5FD),
                            fontSize: 16,
                          ),
                        ),
                        leading: CircleAvatar(
                          child: Icon(
                            Icons.location_city,
                            color: Colors.white,
                          ),
                          radius: 40,
                        ),
                        trailing: CircleAvatar(
                          child: Icon(
                            Icons.edit_location,
                            color: Colors.white,
                          ),
                          radius: 20,
                        ),
                        onTap: () {
                          Navigator.pop(context);
                          Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EditLocation(),
                          ));
                        },    
                      ),
                      Divider(
                        height: 10,
                        thickness: 0.5,
                        color: Colors.white.withOpacity(0.3),
                        indent: 32,
                        endIndent: 32,
                      ),
                      MenuItem(
                        icon: Icons.local_pharmacy,
                        title: "Doctors",
                        onTap: () {
                          Navigator.of(context).pop();
                          Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen(menu: "Doctors")));
                        },
                      ),
                      MenuItem(
                        icon: Icons.info,
                        title: "News",
                        onTap: () {
                          Navigator.of(context).pop();
                          Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen(menu: "News")));
                        },
                      ),
                      MenuItem(
                        icon: Icons.list,
                        title: "Explore",
                        onTap: () {
                          Navigator.of(context).pop();
                          Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen(menu: "Explore")));
                        },
                      ),
                      MenuItem(
                        icon: Icons.live_help,
                        title: "Emergency",
                        onTap: () {
                          Navigator.of(context).pop();
                          Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen(menu: "Emergency")));
                        },
                      ),
                      MenuItem(
                        icon: Icons.grain,
                        title: "Covid-19",
                        onTap: () {
                          Navigator.of(context).pop();
                          Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen(menu: "Covid-19")));
                        },
                      ),
                      MenuItem(
                        icon: Icons.local_hospital,
                        title: "Healthcare",
                        onTap: () {
                          Navigator.of(context).pop();
                          Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen(menu: "Healthcare")));
                        },
                      ),
                      MenuItem(
                        icon: Icons.school,
                        title: "Education",
                        onTap: () {
                          Navigator.of(context).pop();
                          Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen(menu: "Education")));
                        },
                      ),
                      MenuItem(
                        icon: Icons.card_travel,
                        title: "Tourism",
                        onTap: () {
                          Navigator.of(context).pop();
                          Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen(menu: "Tourism")));
                        },
                      ),
                      MenuItem(
                        icon: Icons.shopping_cart,
                        title: "Shopping",
                        onTap: () {
                          Navigator.of(context).pop();
                          Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen(menu: "Shopping")));
                        },
                      ),
                      /*MenuItem(
                        icon: Icons.card_giftcard,
                        title: "Events",
                      ),*/
                      MenuItem(
                        icon: Icons.contact_mail,
                        title: "Contact",
                      ),
                     /* Divider(
                        height: 30,
                        thickness: 0.5,
                        color: Colors.white.withOpacity(0.3),
                        indent: 32,
                        endIndent: 32,
                      ),*/
                    ],
                  ),
                ),
              ),
            ],
          ),
      );
  }
}