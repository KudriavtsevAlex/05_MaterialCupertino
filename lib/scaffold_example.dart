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
      home: DefaultTabController(
        initialIndex: 1,
        length: 3,
        child: Scaffold(
          key: scaffoldKey,
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
                ),
              ),
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
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: openBottomSheet,
          ),
          bottomNavigationBar: BottomNavigationBar(
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
      child: SafeArea(
        child: Column(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(),
              child: CircleAvatar(
                radius: 68,
                backgroundColor: Colors.cyan,
                backgroundImage: NetworkImage(
                    'https://omoro.ru/wp-content/uploads/2018/11/rozshi_parnei-21.jpg'),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.account_box_rounded),
              title: const Text('Profile'),
              trailing: const Icon(Icons.keyboard_arrow_right),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.image_rounded),
              title: const Text('Images'),
              trailing: const Icon(Icons.keyboard_arrow_right),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.file_copy_rounded),
              title: const Text('Files'),
              trailing: const Icon(Icons.keyboard_arrow_right),
              onTap: () {},
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text('Вход'),
                        ),
                      ),
                      Container(
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text('Регистрация'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
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
          children: [
            const CircleAvatar(
              radius: 100,
              backgroundImage: NetworkImage(
                  'https://www.pressfoto.ru/mediasample/s.pfst.net/2010.11/370896342083aaf4ff84b8e49da5168156c2179576_b.jpg?PressFoto_370896.jpg'),
            ),
            Container(
              child: Text('Добрый вечер!'),
              padding: const EdgeInsets.fromLTRB(10, 50, 10, 10),
            ),
          ],
        ),
      ),
    );
  }
}
