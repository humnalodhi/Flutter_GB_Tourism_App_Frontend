import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gb_tour/View/Screens/NavPages/booked_page.dart';
import 'package:gb_tour/View/Screens/NavPages/fav_items_page.dart';
import 'package:gb_tour/View/Screens/NavPages/home_page.dart';
import 'package:gb_tour/View/Screens/NavPages/notifications_page.dart';
import 'package:gb_tour/View/Screens/Profile/profile_page.dart';


class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List pages = [
    HomePage(),
    BookedPage(),
    FavItemsPage(),
    NotificationPage(),
    ProfilePage(),
  ];
  int currentIndex = 0;
  void onTap(int index){
    setState(() {
      currentIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        unselectedFontSize: 0,
        selectedFontSize: 0,
        iconSize: 30,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        onTap: onTap,
        currentIndex: currentIndex,
        selectedItemColor: Colors.indigo,
        unselectedItemColor: Colors.indigo.withOpacity(0.3),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        elevation: 0,
        items: const<BottomNavigationBarItem>[
          BottomNavigationBarItem(label: 'Home', icon: Icon(Icons.home)),
          BottomNavigationBarItem(label: 'Booked', icon: Icon(Icons.check_circle)),
          BottomNavigationBarItem(label: 'Favorites', icon: Icon(Icons.favorite)),
          BottomNavigationBarItem(label: 'Notifications', icon: Icon(Icons.notifications)),
          BottomNavigationBarItem(label: 'Chat', icon: Icon(Icons.chat)),
        ],
      ),
    );
  }
}
