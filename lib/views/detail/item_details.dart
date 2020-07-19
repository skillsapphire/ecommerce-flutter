import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {

  final item;

  const DetailPage({Key key, @required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
          decoration: BoxDecoration(gradient: LinearGradient(colors: [
          Colors.teal, Colors.orange
        ])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text(item.title),
          elevation: 0.0,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Hero(
                  tag: item.id,
                  child: CircleAvatar(
                    radius: 100.0,
                    backgroundImage: NetworkImage("https://jssors8.azureedge.net/demos/img/gallery/720x480/006.jpg")),
              ),
              SizedBox(height: 10.0,),
              Text("Post Id: ${item.id}",
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.white,
                  ),
              ),
              SizedBox(height: 10.0,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("${item.title}",
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.white,
                    ),
                ),
              ),
              SizedBox(height: 10.0,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("${item.content}",
                    style: TextStyle(
                      //fontSize: 22.0,
                      color: Colors.white,
                    ),
                ),
              ),
            ],
          ),
        )
      ),
    );
  }
}