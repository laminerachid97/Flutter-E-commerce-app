import 'package:flutter/material.dart';

class ScrollScreen extends StatefulWidget {
  const ScrollScreen({super.key});

  @override
  State<ScrollScreen> createState() => _ScrollScreen();
}

class _ScrollScreen extends State<ScrollScreen> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Counter: $_counter'),
            ElevatedButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true, // Allows the bottom sheet to take up more screen space
                  builder: (BuildContext context) {
                    return FractionallySizedBox(
                      heightFactor: 0.75, // Approximately 75% of the screen height
                      widthFactor: 1,
                      child: Container(
                        padding: EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min, // Prevents unnecessary extra space
                          children: <Widget>[
                            Text('This is a bottom sheet!'),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.pop(
                                  context,
                                ); // Close the bottom sheet
                              },
                              child: Text('Close'),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
              child: Text("show"),
            ),
          ],
        ),
      ),
    );
  }
}
