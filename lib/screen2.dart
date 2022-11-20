import 'package:flutter/material.dart';

class Screen2 extends StatelessWidget {
  const Screen2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.teal,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Text(
                'Screen 2',
                style: TextStyle(
                  color: Colors.white24,
                  fontSize: 20,
                ),
              ),
              margin: EdgeInsets.all(16),
            ),
            ElevatedButton(onPressed: () {
              Navigator.pop(context);
            },
              child: Text('Go back'),
            ),
          ],
        ),
      ),
    );
  }
}
