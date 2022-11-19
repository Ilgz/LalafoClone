import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<String> _list = [''];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Lalafo",
            style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Colors.black87),
          ),
        ),
        body: Center(
            child: ElevatedButton(
              onPressed: () {
                Route route = MaterialPageRoute(builder: (context) => SecondPage());
                Navigator.push(context, route);
              }, child: Text('Next'),
            )));
  }

  getHomePageBody(BuildContext context) {
    return ListView.builder(
      itemCount: _list.length,
      itemBuilder: _getItemUI,
      padding: EdgeInsets.all(0.0),
    );

  }
  // First Attempt
  Widget _getItemUI(BuildContext context, int index) {
    return Text(_list[index]);
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {Navigator.pop(context);},
      child: Scaffold(
        body: Column(
          children: [
            Center(
              child: Container(child: Text('Удерживайте чтобы выйти')),
            ),
          ],
        ),
      ),
    );
  }
}

