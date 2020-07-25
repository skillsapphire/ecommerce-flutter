import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
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
                  color: const Color(0xFF262AAA),
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
                          "www.skillsapphire.com",
                          style: TextStyle(
                            color: Color(0xFF1BB5FD),
                            fontSize: 14,
                          ),
                        ),
                        leading: CircleAvatar(
                          child: Icon(
                            Icons.perm_identity,
                            color: Colors.white,
                          ),
                          radius: 40,
                        ),
                      ),
                      Divider(
                        height: 10,
                        thickness: 0.5,
                        color: Colors.white.withOpacity(0.3),
                        indent: 32,
                        endIndent: 32,
                      ),
                      MenuItem(
                        icon: Icons.home,
                        title: "News",
                        onTap: () {
                          Navigator.of(context).pop();
                          Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen(menu: "News")));
                        },
                      ),
                      MenuItem(
                        icon: Icons.home,
                        title: "Explore",
                        onTap: () {
                          Navigator.of(context).pop();
                          Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen(menu: "Explore")));
                        },
                      ),
                      MenuItem(
                        icon: Icons.settings,
                        title: "Emergency",
                        onTap: () {
                          Navigator.of(context).pop();
                          Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen(menu: "Emergency")));
                        },
                      ),
                      MenuItem(
                        icon: Icons.exit_to_app,
                        title: "Covid-19",
                        onTap: () {
                          Navigator.of(context).pop();
                          Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen(menu: "Covid-19")));
                        },
                      ),
                      MenuItem(
                        icon: Icons.home,
                        title: "Healthcare",
                        onTap: () {
                          Navigator.of(context).pop();
                          Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen(menu: "Healthcare")));
                        },
                      ),
                      MenuItem(
                        icon: Icons.person,
                        title: "Education",
                        onTap: () {
                          Navigator.of(context).pop();
                          Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen(menu: "Education")));
                        },
                      ),
                      MenuItem(
                        icon: Icons.shopping_basket,
                        title: "Tourism",
                        onTap: () {
                          Navigator.of(context).pop();
                          Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen(menu: "Tourism")));
                        },
                      ),
                      MenuItem(
                        icon: Icons.card_giftcard,
                        title: "Shopping",
                      ),
                      MenuItem(
                        icon: Icons.card_giftcard,
                        title: "Events",
                      ),
                      MenuItem(
                        icon: Icons.card_giftcard,
                        title: "About",
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