import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter1/image_widget.dart';
import 'package:flutter1/images.dart';
import 'package:flutter1/navigation_test/error_page.dart';
import 'package:flutter1/navigation_test/page1_test.dart';
import 'package:flutter1/navigation_test/page2_test.dart';
import 'package:flutter1/navigation_test/page3_test.dart';
import 'package:flutter1/todo_app/ui/todo_main_page.dart';
import 'package:flutter1/top_selling_widget.dart';

void main() {
  runApp(MaterialApp(
    home: Page1Nav(),
    routes: {
      Page1Nav.routeName: (context) => Page1Nav(),
      Page2Nav.routeName: (context) => Page2Nav(''),
      Page3Nav.routeName: (context) => Page3Nav(0),
    },
    onGenerateRoute: (RouteSettings routeSettings) {
      String routeName = routeSettings.name;
      var arguments = routeSettings.arguments;

      switch (routeName) {
        case ('aaa'):
          return MaterialPageRoute(builder: (context) {
            return Page2Nav(arguments);
          });
          break;
        case ('bbb'):
          return MaterialPageRoute(builder: (context) {
            return Page2Nav(arguments);
          });
          break;
        default:
          return MaterialPageRoute(builder: (context) {
            return ErrorPage();
          });
      }
    },
  ));
}

/*
materialApp
Scaffold
Appbar
Text
Center
Container
*/
class TestPage2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return TestPage2State();
  }
}

class TestPage2State extends State<StatefulWidget> {
  String textContent = 'OFF';
  bool switchValue = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('StatefulWidget'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Text(
                textContent,
                textAlign: TextAlign.center,
              ),
              CupertinoSwitch(
                  value: switchValue,
                  onChanged: (v) {
                    this.switchValue = v;
                    textContent = v ? 'ON' : 'OFF';
                    setState(() {});
                  }),
            ],
          ),
          RaisedButton(
              child: Text('Change Text'),
              onPressed: () {
                setState(() {});
              })
        ],
      ),
    );
  }
}

class TestPage1 extends StatelessWidget {
  String textContent = 'Hello World';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('StatelessWodget'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            textContent,
            textAlign: TextAlign.center,
          ),
          RaisedButton(
              child: Text('Change Text'),
              onPressed: () {
                textContent = 'I Love flutter';
              })
        ],
      ),
    );
  }
}

class Page1 extends StatefulWidget {
  //
  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1> with SingleTickerProviderStateMixin {
  TabController tabController;
  @override
  initState() {
    super.initState();
    initTabController();
  }

  initTabController() {
    tabController = TabController(length: 3, vsync: this);
  }

  int i = 0;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black.withOpacity(0.5),
        title: Text('Maan Flutter'),
        bottom: TabBar(
          controller: tabController,
          tabs: [
            Tab(
              child: Icon(Icons.home),
            ),
            Tab(
              child: Icon(Icons.favorite),
            ),
            Tab(
              child: Icon(Icons.perm_identity),
            )
          ],
        ),
      ),
      body: TabBarView(controller: tabController, children: [
        Container(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ImageWidget(AppImages.image1, 'JERUSALEM'),
                      ImageWidget(AppImages.image2, 'INTEFADA'),
                      ImageWidget(AppImages.image3, 'PALESTINE'),
                      ImageWidget(AppImages.image4, 'HOMELAND'),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text('Top Selling',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.w700)),
                ),
                Column(
                  children: [
                    TopSellingWidget(AppImages.image5, 'Logo', '50'),
                    TopSellingWidget(AppImages.image6, 'Logo', '60'),
                    TopSellingWidget(AppImages.image5, 'Logo2', '20'),
                    TopSellingWidget(AppImages.image6, 'Logo3', '30'),
                    TopSellingWidget(AppImages.image5, 'Logo4', '40')
                  ],
                )
              ],
            ),
          ),
        ),
        Center(
          child: Text('Favourite'),
        ),
        Center(
          child: Text('Profile'),
        ),
      ]),
      drawer: Drawer(
          child: Column(
        children: [
          UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Colors.black.withOpacity(0.5)),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.black.withOpacity(0.3),
                child: Text('O'),
              ),
              accountName: Text('Omar Shady'),
              accountEmail: Text('omar@gmail.com')),
          ListTile(
            title: Text('home'),
            subtitle: Text('Go to home'),
            leading: Icon(Icons.home),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              tabController.animateTo(0);
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('Favourite'),
            subtitle: Text('Go to favourite'),
            leading: Icon(Icons.favorite),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              tabController.animateTo(1);
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('Profile'),
            subtitle: Text('Go to profile'),
            leading: Icon(Icons.perm_identity_rounded),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              tabController.animateTo(2);
              Navigator.pop(context);
            },
          ),
        ],
      )),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: this.i,
          onTap: (index) {
            this.i = index;
            tabController.animateTo(index);
            setState(() {});
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite), label: 'Favourite'),
            BottomNavigationBarItem(
                icon: Icon(Icons.perm_identity_outlined), label: 'Profile'),
          ]),
    );
  }
}
/*
1- create assets folder in your project root folder
2- put your images in assets folder
3- define your images in pubspec.yaml
4- use Image.asset widget to display your image
*/
