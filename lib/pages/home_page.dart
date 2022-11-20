import 'package:flutter/material.dart';

import '../screen2.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.teal,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            child: Text(
              'Главная',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            margin: EdgeInsets.all(16),
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) => Screen2()
                ));
              },
          child: Text('Go to next screen'),
          ),
        ],
      ),
    );
  }
}
