import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent, elevation: 0.0,
        title: const Text (
          'Профиль',
          style:TextStyle(
            color: Colors.black,
            fontSize: 28
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed:(){},
              icon:const Icon(Icons.settings,size: 28,
              ),
            color: Colors.black,
          )
        ],
      ),
      body: const Body()
    );
  }
}

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String name = 'userLalafo';
  String email = 'userLalafo.gmail.com';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children:[
          SizedBox(
            height:150,
            child: Card(
              elevation: 2,
              shape:const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
              margin: const EdgeInsets.all(20),
              child: ListTile(
                contentPadding: const EdgeInsets.all(20),
                title:Text(name,style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w500
                ),) ,
                subtitle: Text(email,style: const TextStyle(
                  fontSize: 20
                ),),
                trailing: const CircleAvatar(radius: 30,),
              ),
            ),

          ),

          DefaultTabController(
              length: 2, // length of tabs
              initialIndex: 0,
              child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: <Widget>[
                const TabBar(
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey,
                  labelStyle: TextStyle(fontSize: 20),
                  tabs: [
                    Tab(text: 'Активные'),
                    Tab(text: 'Неактивные'),
                  ],
                ),
                Container(
                    height: 400, //height of TabBarView
                    decoration: const BoxDecoration(
                        border: Border(top: BorderSide(color: Colors.grey, width: 0.5))
                    ),
                    child: TabBarView(children: <Widget>[
                      Column(
                        children: const [
                          SizedBox(
                            height: 20,
                          ),
                          Text('Нет активных объявлений',style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w700
                            ),
                          ),
                          Text('Здесь будут отображаться активные объявления',style: TextStyle(
                            fontSize: 15,

                          ),
                          )
                        ],
                      ),
                      Column(
                        children: const [
                          SizedBox(
                            height: 20,
                          ),
                          Text('Нет неактивных объявлений',style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w700
                          ),
                          ),
                          Text('Здесь будут отображаться неактивные объявления',style: TextStyle(
                            fontSize: 15,

                          ),
                          )
                        ],
                      ),


                    ])
                )
              ])
          ),
        ]
      ),
    );
  }
}
