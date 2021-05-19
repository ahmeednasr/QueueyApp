import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:queuey/2%20-Algaraiehy/12-home.dart';
import 'package:queuey/2%20-Algaraiehy/26%20more%20option.dart';
import 'package:queuey/2%20-Algaraiehy/LocationScreen.dart';

import 'package:queuey/3%20-Nasr/Your%20Booked%20queues/Your%20Booked%20View.dart';

import 'MyAppBar.dart';

class NavBar extends StatefulWidget {
  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _currentindex = 0;
  List<GlobalKey<NavigatorState>> _navigatorKeys = [
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
  ];

  /* List _screens = [
    HomeScreen(),
    YourBookedView(),
    LocationScreen(),
    MoreOption(),
  ];*/

  @override
  /* Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        context: context,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xff79BEBE),
        selectedItemColor: Colors.white,
        unselectedItemColor: Color(0xff666666),
        currentIndex: _currentindex,
        type: BottomNavigationBarType.fixed,
        onTap: (selectitem) {
          setState(() {
            _currentindex = selectitem;
            print(_currentindex);
          });
        },
        items: [
          BottomNavigationBarItem(
            //index = 0
            icon: Icon(
              Icons.home,
              size: 30,
            ),
            // ignore: deprecated_member_use
            title: Text(
              '',
              style: TextStyle(fontSize: 0),
            ),
          ),
          BottomNavigationBarItem(
              //index = 1
              icon: Icon(
                CupertinoIcons.app_badge,
                size: 30,
              ),
              // ignore: deprecated_member_use
              title: Text(
                '',
                style: TextStyle(fontSize: 0),
              )),
          BottomNavigationBarItem(
              //index = 2
              icon: Icon(
                CupertinoIcons.location_solid,
                size: 30,
              ),
              // ignore: deprecated_member_use
              title: Text(
                '',
                style: TextStyle(fontSize: 0),
              )),
          BottomNavigationBarItem(
              //index = 3
              icon: Icon(
                CupertinoIcons.ellipsis_vertical,
                size: 30,
              ),
              // ignore: deprecated_member_use
              title: Text(
                '',
                style: TextStyle(fontSize: 0),
              )),
        ],
      ),
      body: _screens[_currentindex],
    );
  }*/

  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final isFirstRouteInCurrentTab =
            !await _navigatorKeys[_currentindex].currentState.maybePop();

        // let system handle back button if we're on the first route
        return isFirstRouteInCurrentTab;
      },
      child: Scaffold(
          appBar: MyAppBar(
            context: context,
          ),
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Color(0xff79BEBE),
            selectedItemColor: Colors.white,
            unselectedItemColor: Color(0xff666666),
            currentIndex: _currentindex,
            type: BottomNavigationBarType.fixed,
            onTap: (selectitem) {
              setState(() {
                _currentindex = selectitem;
                print(_currentindex);
              });
            },
            items: [
              BottomNavigationBarItem(
                //index = 0
                icon: Icon(
                  Icons.home,
                  size: 30,
                ),
                // ignore: deprecated_member_use
                title: Text(
                  '',
                  style: TextStyle(fontSize: 0),
                ),
              ),
              BottomNavigationBarItem(
                  //index = 1
                  icon: Icon(
                    CupertinoIcons.app_badge,
                    size: 30,
                  ),
                  // ignore: deprecated_member_use
                  title: Text(
                    '',
                    style: TextStyle(fontSize: 0),
                  )),
              BottomNavigationBarItem(
                  //index = 2
                  icon: Icon(
                    CupertinoIcons.location_solid,
                    size: 30,
                  ),
                  // ignore: deprecated_member_use
                  title: Text(
                    '',
                    style: TextStyle(fontSize: 0),
                  )),
              BottomNavigationBarItem(
                  //index = 3
                  icon: Icon(
                    CupertinoIcons.ellipsis_vertical,
                    size: 30,
                  ),
                  // ignore: deprecated_member_use
                  title: Text(
                    '',
                    style: TextStyle(fontSize: 0),
                  )),
            ],
          ),
          body: Stack(
            children: [
              _buildOffstageNavigator(0),
              _buildOffstageNavigator(1),
              _buildOffstageNavigator(2),
              _buildOffstageNavigator(3),
            ],
          )),
    );
  }

  Map<String, WidgetBuilder> _routeBuilders(BuildContext context, int index) {
    return {
      '/': (context) {
        return [
          HomeScreen(),
          YourBookedView(),
          LocationScreen(),
          MoreOption(),
        ].elementAt(index);
      },
    };
  }

  Widget _buildOffstageNavigator(int index) {
    var routeBuilders = _routeBuilders(context, index);

    return Offstage(
      offstage: _currentindex != index,
      child: Navigator(
        key: _navigatorKeys[index],
        onGenerateRoute: (routeSettings) {
          return MaterialPageRoute(
            builder: (context) => routeBuilders[routeSettings.name](context),
          );
        },
      ),
    );
  }
}
