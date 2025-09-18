import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FAB',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int i = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FloatingActionButton"),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Floating action button pressed this many times"),
            Text(
              "$i",
              textScaleFactor: 3,
            )
          ],
        ),
      ),

      // 🔽 Multiple FABs using Stack
      floatingActionButton: Stack(
        children: <Widget>[
          // FAB 1 - Increment
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 16.0, right: 16.0),
              child: FloatingActionButton(
                heroTag: "fab1", // Unique heroTag
                child: Icon(Icons.add),
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                onPressed: () {
                  setState(() {
                    i++;
                  });
                },
              ),
            ),
          ),

          // FAB 2 - Decrement
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 80.0, right: 16.0), // Slightly above the first FAB
              child: FloatingActionButton(
                heroTag: "fab2", // Unique heroTag
                child: Icon(Icons.remove),
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                onPressed: () {
                  setState(() {
                    if (i > 0) i--;
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}