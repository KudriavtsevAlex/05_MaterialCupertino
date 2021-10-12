import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class ScaffoldExample extends StatefulWidget {
  const ScaffoldExample({Key? key}) : super(key: key);

  @override
  _ScaffoldExampleState createState() => _ScaffoldExampleState();
}

class _ScaffoldExampleState extends State<ScaffoldExample> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  void openBottomSheet() {
    scaffoldKey.currentState!.showBottomSheet((context) => BottomSheet());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        key: scaffoldKey,
        body: TabBarBody(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: openBottomSheet,
        ),
        bottomNavigationBar: BottomAppBar(
          shape: CircularNotchedRectangle(),
          elevation: 10,
          notchMargin: 8,
          clipBehavior: Clip.antiAlias,
          child: Container(
            child: BottomNavigationBar(
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.business),
                  label: 'Business',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BottomSheet extends StatelessWidget {
  const BottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: TextButton(
        child: const Center(
          child: Text('Close bottom sheet'),
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: Colors.amberAccent,
            height: 100,
            width: 100,
          ),
          Container(
            color: Colors.blue,
            height: 100,
            width: 100,
          ),
        ],
      ),
      //   child: ListView(
      //     children: [
      //       const DrawerHeader(
      //         decoration: BoxDecoration(
      //           color: Colors.blue,
      //         ),
      //         child: CircleAvatar(
      //           radius: 68,
      //           backgroundColor: Colors.cyan,
      //           backgroundImage: NetworkImage(
      //               'https://omoro.ru/wp-content/uploads/2018/11/rozshi_parnei-21.jpg'),
      //         ),
      //       ),
      //       ListTile(
      //         leading: const Icon(Icons.account_box_rounded),
      //         title: const Text('Profile'),
      //         trailing: const Icon(Icons.keyboard_arrow_right),
      //         onTap: () {},
      //       ),
      //       ListTile(
      //         leading: const Icon(Icons.image_rounded),
      //         title: const Text('Images'),
      //         trailing: const Icon(Icons.keyboard_arrow_right),
      //         onTap: () {},
      //       ),
      //       ListTile(
      //         leading: const Icon(Icons.file_copy_rounded),
      //         title: const Text('Files'),
      //         trailing: const Icon(Icons.keyboard_arrow_right),
      //         onTap: () {},
      //       ),
      //       Column(
      //         mainAxisAlignment: MainAxisAlignment.end,
      //         crossAxisAlignment: CrossAxisAlignment.end,
      //         children: [
      //           Row(
      //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //             children: [
      //               Container(
      //                 child: ElevatedButton(
      //                   onPressed: () {},
      //                   child: Text('Вход'),
      //                 ),
      //               ),
      //               Container(
      //                 child: ElevatedButton(
      //                   onPressed: () {},
      //                   child: Text('Регистрация'),
      //                 ),
      //               ),
      //             ],
      //           ),
      //         ],
      //       ),
      //     ],
      //   ),
    );
  }
}

class AppEndDrawer extends StatefulWidget {
  const AppEndDrawer({Key? key}) : super(key: key);

  @override
  State<AppEndDrawer> createState() => _AppEndDrawerState();
}

class _AppEndDrawerState extends State<AppEndDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(
                  'https://biser-mix.ru/wp-content/uploads/2020/12/58.jpeg'),
            ),
            Text('hi!'),
          ],
        ),
      ),
    );
  }
}

class TabBarBody extends StatefulWidget {
  const TabBarBody({Key? key}) : super(key: key);

  @override
  State<TabBarBody> createState() => _TabBarBodyState();
}

class _TabBarBodyState extends State<TabBarBody> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('App bar title!'),
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.cloud_outlined),
              ),
              Tab(
                icon: Icon(Icons.beach_access_sharp),
              ),
              Tab(
                icon: Icon(Icons.brightness_5_sharp),
              ),
            ],
          ),
          actions: [
            Builder(
              builder: (context) => IconButton(
                icon: Icon(Icons.person_outline_rounded),
                onPressed: () {
                  Scaffold.of(context).openEndDrawer();
                },
                // onPressed: toggleBottomSheet,
              ),
            )
          ],
        ),
        body: const TabBarView(
          children: <Widget>[
            Center(
              child: Text("It's cloudy here"),
            ),
            Center(
              child: Text("It's rainy here"),
            ),
            Center(
              child: Text("It's sunny here"),
            ),
          ],
        ),
        drawer: AppDrawer(),
        endDrawer: AppEndDrawer(),
      ),
    );
  }
}
