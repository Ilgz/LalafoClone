import 'package:flutter/material.dart';
import 'package:lalafo/pages/favorites_page.dart';
import 'package:lalafo/pages/home_page.dart';
import 'package:lalafo/pages/profile_page.dart';

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
  int _selectedIndex = 0;

  List<Widget> _list = <Widget>[
    HomePage(),
    FavoritesPage(),
    ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(
            label: 'Главная',
      icon: Icon(Icons.home,
          color: Colors.deepPurple,
          ),
          activeIcon: Icon(Icons.home,
          color: Colors.black,
    ),
    ),
          BottomNavigationBarItem(
              label: "Избранное",
              icon: Icon(Icons.favorite,
          color: Colors.deepPurple,
          ),
            activeIcon: Icon(Icons.favorite,
            color: Colors.black,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Профиль',
            icon: Icon(Icons.person,
          color: Colors.deepPurple,
          size: 36,
          ),
          activeIcon: Icon(Icons.person,
          color: Colors.black,
          size: 36,
          ),
          ),
        ],
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
        // body: Center(
        //     child: ElevatedButton(
        //       onPressed: () {
        //         Route route = MaterialPageRoute(builder: (context) => SecondPage());
        //         Navigator.push(context, route);
        //       }, child: Text('Next'),
        //     ))
          body: _list.elementAt(_selectedIndex),
    );
  }

  // getHomePageBody(BuildContext context) {
  //   return ListView.builder(
  //     itemCount: _list.length,
  //     itemBuilder: _getItemUI,
  //     padding: EdgeInsets.all(0.0),
  //   );

  }
  // First Attempt
//   Widget _getItemUI(BuildContext context, int index) {
//     return Text(_list[index]);
//   }
// }
//
// class SecondPage extends StatelessWidget {
//   const SecondPage({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onLongPress: () {Navigator.pop(context);},
//       child: Scaffold(
//         body: Column(
//           children: [
//             Center(
//               child: Container(child: Text('Удерживайте чтобы выйти')),
//             ),
//           ],
//         ),
//       ),
//     );
//  }
//}

