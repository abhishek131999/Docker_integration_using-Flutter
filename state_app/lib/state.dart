import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MyAppState(),
  ));
}

class MyAppState extends StatefulWidget {
  @override
  _MyAppStateState createState() => _MyAppStateState();
}

class _MyAppStateState extends State<MyAppState> {
  mybutton() {
    setState(() {
      index += 1;
    });
    print("clicked");

    print("data changed");
  }

  var db = ["abhishek", "vimal", "rajesh", "hello", "raj", "apple"];
  var index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('MyApp')),
      ),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.8,
          height: MediaQuery.of(context).size.height * 0.4,
          color: Colors.transparent,
          child: Column(
            children: <Widget>[
              Text(db[index]),
              Text("its your 1st app"),
              FlatButton(onPressed: mybutton, child: Text("click"))
            ],
          ),
        ),
      ),
    );
  }
}
