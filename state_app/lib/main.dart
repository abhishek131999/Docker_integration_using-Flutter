import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as httpd;
import 'package:nice_button/nice_button.dart';
import 'package:characters/characters.dart';

void main() {
  runApp(MaterialApp(
    home: MyAppState(),
  ));
}

class MyAppState extends StatefulWidget {
  @override
  _MyAppStateState createState() => _MyAppStateState();
}

String cmd;
var webdata;

class _MyAppStateState extends State<MyAppState> {
  myweb(cmd) async {
    var url = "http://192.168.43.148/cgi-bin/web1.py?x=${cmd}";
    var r = await httpd.get(url);
    setState(() {
      webdata = r.body;
    });
    webdata = r.body;
    print(webdata);
  }

  // mybutton() {
  //   setState(() {
  //     index += 1;
  //   });
  //   print("clicked");

  //   print("data changed");
  // }

  // var db = ["abhishek", "vimal", "rajesh", "hello", "raj", "apple"];
  // var index = 0;

  @override
  Widget build(BuildContext context) {
    var firstColor = Color(0xff5b86e5);
    return Scaffold(
      backgroundColor: Colors.red[200],
      appBar: AppBar(
          backgroundColor: Colors.lightGreen[100],
          title: Center(
            child: Text(
              'MyApp',
              style: TextStyle(
                fontSize: 50,
                foreground: Paint()
                  ..style = PaintingStyle.stroke
                  ..strokeWidth = 2
                  ..color = Colors.blue[700],
              ),
            ),
          )),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.8,
          height: MediaQuery.of(context).size.height * 0.6,
          color: Colors.lightBlue[100],
          child: Column(
            children: <Widget>[
              Card(
                margin: EdgeInsets.all(20),
                child: Text(
                  "Enter your Docker cmd",
                  style: TextStyle(fontSize: 20, backgroundColor: Colors.amber),
                ),
              ),
              TextField(
                  onChanged: (value) {
                    cmd = value;
                  },
                  decoration: InputDecoration(
                      fillColor: Colors.white,
                      hintText: "enter the cmd ",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.devices))),
              NiceButton(
                mini: true,
                // width: 515,

                elevation: 1.0,
                radius: 40.0,
                text: "OUTPUT",
                background: firstColor,
                icon: Icons.android,

                onPressed: () {
                  myweb(cmd);
                },
              ),
              Text(webdata ?? "......")
            ],
          ),
        ),
      ),
    );
  }
}
