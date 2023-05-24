import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gb_tour/View/Screens/hotel_detail_page.dart';
import 'package:gb_tour/Widgets/app_text.dart';

import '../../Widgets/app_large_text.dart';
import 'Profile/profile_page.dart';
import 'drawer.dart';

class Hotels extends StatefulWidget {
  const Hotels({Key? key}) : super(key: key);

  @override
  State<Hotels> createState() => _HotelsState();
}

class _HotelsState extends State<Hotels> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Row(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 105),
              child: AppLargeText(
                text: 'Hotels',
                size: 20,
              ),
            ),
            Spacer(),
            GestureDetector(
              child: CircleAvatar(
                radius: 18,
                backgroundColor: Colors.grey,
                child: Icon(
                  Icons.person_rounded,
                  color: Colors.black87,
                ),
              ),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> ProfilePage()));
              },
            ),
          ],
        ),
        iconTheme: IconThemeData(color: Colors.black87),
      ),
      drawer: DrawerScreen(),
      body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemCount: 8,
          itemBuilder: (context, index){
            return GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> HotelDetailPage()));
              },
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                padding: const EdgeInsets.all(12),
                height: 180,
                width: 160,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: AssetImage("lib/assets/WelcomeImage.jpeg"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      child: Icon(
                        Icons.favorite_border,
                        color: Colors.white,
                        size: 25,
                      ),
                      alignment: Alignment.topRight,
                    ),
                    Spacer(),
                    Container(
                      child: AppText(
                        text: 'Hotel Name',
                        color: Colors.white,
                        size: 20,
                      ),
                      alignment: Alignment.bottomLeft,
                    ),
                    SizedBox(
                      height: 8,
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
