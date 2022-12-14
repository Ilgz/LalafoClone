import 'package:flutter/material.dart';


class FavoritesPage extends StatelessWidget {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.teal,
      child: Center(
        child: ElevatedButton(
          onPressed: () {
            // Navigator.push(context, MaterialPageRoute(
            //     builder: (context) => Screen2()
            // ));
          },
          child: Text('Go to next screen'),
        ),
      ),
    );
  }
}
