import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'eZikar',
      theme: ThemeData(primaryColor: Colors.brown),
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _increment() {
    setState(() {
      _counter++;
      SystemSound.play(SystemSoundType.click);
    });
  }

  void _reset() {
    setState(() {
      _counter = 0;
      SystemSound.play(SystemSoundType.click);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          toolbarOpacity: 1.0,
          elevation: 50,
          title: Center(
            child: Text(
              "eZikar",
              style: new TextStyle(
                  color: Colors.white54,
                  fontSize: 24.0,
                  fontStyle: FontStyle.italic),
            ),
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/zikar.jpg"), fit: BoxFit.cover)),
          child: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text('$_counter',
                      style: new TextStyle(
                          fontSize: 50.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                  RawMaterialButton(
                    constraints: BoxConstraints.tight(Size(120, 120)),
                    fillColor: Colors.black54,
                    shape: CircleBorder(),
                    elevation: 50,
                    child: RawMaterialButton(
                      elevation: 0,
                      hoverElevation: 20.0,
                      constraints: BoxConstraints.tight(Size(100, 100)),
                      fillColor: Colors.white54,
                      onPressed: _increment,
                      shape: CircleBorder(),
                    ),
                  ),
                  RawMaterialButton(
                    child: Text("Reset",
                        style:
                            new TextStyle(fontSize: 24.0, color: Colors.white)),
                    fillColor: Colors.transparent,
                    constraints: BoxConstraints.tight(Size(150, 50)),
                    shape: RoundedRectangleBorder(),
                    onPressed: _reset,
                  ),
                ]),
          ),
        ));
  }
}
