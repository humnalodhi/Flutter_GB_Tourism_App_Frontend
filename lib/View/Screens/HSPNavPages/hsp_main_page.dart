import 'package:flutter/material.dart';
import 'package:gb_tour/View/Screens/HSPNavPages/hsp_chat_page.dart';
import 'package:gb_tour/View/Screens/HSPNavPages/hsp_home_page.dart';
import 'package:gb_tour/View/Screens/HSPNavPages/hsp_request_page.dart';

import 'hsp_notification_page.dart';

class HSPMainPage extends StatefulWidget {
  const HSPMainPage({Key? key}) : super(key: key);

  @override
  State<HSPMainPage> createState() => _HSPMainPageState();
}

class _HSPMainPageState extends State<HSPMainPage> {
  List hsp_pages = [
    HSPHomePage(),
    HSPRequestPage(),
    HSPChatPage(),
    HSPNotificationPage(),
  ];
  int myIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: hsp_pages[myIndex],
      bottomNavigationBar: BottomNavigationBar(
        unselectedFontSize: 0,
        selectedFontSize: 14,
        iconSize: 30,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.indigo,
        unselectedItemColor: Colors.indigo.withOpacity(0.3),
        showSelectedLabels: true,
        showUnselectedLabels: false,
        elevation: 0,
        onTap: (index) {
          setState(() {
            myIndex = index;
          });
        },
        currentIndex: myIndex,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.dashboard), label: 'Dashboard'),
          BottomNavigationBarItem(
              icon: Icon(Icons.request_page), label: 'Requests'),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chat'),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: 'Notifications'),
        ],
      ),
    );
  }
}
