import 'package:flutter/material.dart';
import 'package:vendease_text/core/app_assets.dart';

import '../../core/app_colors.dart';
import '../product_view/product.dart';
import 'home.dart';

class HomeNavigationBar extends StatefulWidget {
  const HomeNavigationBar({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomeNavigationBarState();
}

class _HomeNavigationBarState extends State<HomeNavigationBar> {
  int _currentTabIndex = 0;


  Future<bool> shouldExit() async {
    return await showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            title: const Text('Close app?'),
            content: const Text("Click back again to close app"),
            actions: <Widget>[
              TextButton(
                child: const Text("Cancel"),
                onPressed: () {
                  Navigator.of(context, rootNavigator: true).pop(false);
                },
              ),
              TextButton(
                child: const Text("Alright"),
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.of(context, rootNavigator: true).pop(true);
                },
              )
            ],
          );
        });
  }


  @override
  Widget build(BuildContext context) {
    final kTabPages = <Widget>[
     const HomeView(),
      Container(),
       ProductScreen(),
      Container(),
      Container(),
    ];
    final kBottmonNavBarItems = <BottomNavigationBarItem>[
      BottomNavigationBarItem(
          icon: bottomNavIcon(HOME),
          label: 'Home',
          activeIcon: bottomNavIcon(HOME, color: PRIMARY_COLOR)),
      BottomNavigationBarItem(
          icon: bottomNavIcon(ORDER),
          label: 'Orders',
          activeIcon: bottomNavIcon(ORDER,
              color: PRIMARY_COLOR)),
      BottomNavigationBarItem(
          icon: bottomNavIcon(PRODUCT,color: BLUE_GREY),
          label: 'Products',
          activeIcon: bottomNavIcon(PRODUCT)),
      BottomNavigationBarItem(
          icon: bottomNavIcon(INVOICE),
          label: 'Favourite ',
          activeIcon: bottomNavIcon(INVOICE,color: PRIMARY_COLOR)),
      BottomNavigationBarItem(
          icon: bottomNavIcon(DELIVERY),
          label: 'More',
          activeIcon: bottomNavIcon(DELIVERY,color: PRIMARY_COLOR)),
    ];
    assert(kTabPages.length == kBottmonNavBarItems.length);
    final bottomNavBar = BottomNavigationBar(
      backgroundColor: WHITE,
      elevation: 0,
      selectedLabelStyle: const TextStyle(fontFamily:'Gilroy',fontWeight: FontWeight.w500,color:PRIMARY_COLOR,fontSize: 10),
      unselectedLabelStyle: const TextStyle(fontFamily:'Gilroy',fontWeight: FontWeight.w500,fontSize: 10),
      items: kBottmonNavBarItems,
      currentIndex: _currentTabIndex,
      type: BottomNavigationBarType.fixed,
      onTap: (int index) {
        setState(() {
          _currentTabIndex = index;
        });
      },
    );
    return WillPopScope(
      onWillPop: shouldExit,
      child: Scaffold(
        body: kTabPages[_currentTabIndex],
        bottomNavigationBar: bottomNavBar,
      ),
    );
  }
}

Image bottomNavIcon(image, {color}) {
  return Image.asset(
    image,
    height: 25,
    width: 25,
    color: color,
  );
}
