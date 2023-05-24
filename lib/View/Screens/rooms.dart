import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gb_tour/View/Screens/room_detail_page.dart';

import '../../Widgets/app_large_text.dart';
import '../../Widgets/app_text.dart';
import 'Profile/profile_page.dart';
import 'drawer.dart';
import 'hotel_detail_page.dart';

class Rooms extends StatefulWidget {
  const Rooms({Key? key}) : super(key: key);

  @override
  State<Rooms> createState() => _RoomsState();
}

class _RoomsState extends State<Rooms> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Row(
          children: [
            Icon(
              Icons.arrow_back,
              color: Colors.black87,
            ),
            Container(
              margin: EdgeInsets.only(left: 130),
              child: AppLargeText(
                text: 'Rooms',
                size: 20,
              ),
            ),
          ],
        ),
        iconTheme: IconThemeData(color: Colors.black87),
      ),
      body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemCount: 8,
          itemBuilder: (context, index){
            return GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> RoomDetailPage()));
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
                        text: 'Room Name',
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
