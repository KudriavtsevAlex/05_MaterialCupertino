import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class ScaffoldExample extends StatefulWidget {
  const ScaffoldExample({Key? key}) : super(key: key);

  @override
  _ScaffoldExampleState createState() => _ScaffoldExampleState();
}

class _ScaffoldExampleState extends State<ScaffoldExample> {
  int tabIndex = 0;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  // PersistentBottomSheetController _controller;

  void openDr() {
    scaffoldKey.currentState!.openEndDrawer();
  }

  // void toggleBottomSheet() {
  //   if (_controller == null) {
  //     _controller = scaffoldKey.currentState.showBottomSheet(
  //       (context) => Container(
  //         color: Colors.deepOrange,
  //         height: 200,
  //         child: const Center(
  //           child: Text('Dottom sheet'),
  //         ),
  //       ),
  //     );
  //   } else {
  //     _controller.close();
  //     _controller = null;
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          title: Text('App bar title!'),
          actions: [
            Builder(
              builder: (context) => IconButton(
                icon: Icon(Icons.person),
                onPressed: () {},
                // onPressed: toggleBottomSheet,
              ),
            )
          ],
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: CircleAvatar(
                  radius: 68,
                  backgroundColor: Colors.cyan,
                ),
              ),
              ListTile(
                leading: const Icon(Icons.home),
                title: const Text('Item 1'),
                onTap: () {},
                onLongPress: () {
                  print('Long press');
                },
              ),
              ListTile(
                leading: const Icon(Icons.backpack),
                title: const Text('Item 2'),
                onTap: () {},
              ),
            ],
          ),
        ),
        endDrawer: const Drawer(
          child: Center(
            child: Text('EndDrawer'),
          ),
        ),
        body: Center(
          child: Builder(
            builder: (context) => TextButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return Text('ssssds');
                  },
                );
              },
              child: const Text('Open drawer'),
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: openDr,
          // child: const Icon(Icons.add_chart_outlined),
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
        // bottomSheet: BottomSheet(
        //   builder: (context) => Container(
        //     height: 200,
        //     color: Colors.black38,
        //     child: const Center(child: Text('Container in BottomSheet')),
        //   ),
        //   onClosing: () {},
        // ),
      ),
    );
  }
}

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Center(
        child: Text(
          'First Page',
          style: TextStyle(color: Colors.blueAccent),
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Center(
        child: Text(
          'Second Page',
          style: TextStyle(color: Colors.redAccent),
        ),
      ),
    );
  }
}
