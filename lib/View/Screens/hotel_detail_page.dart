import 'package:bulleted_list/bulleted_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gb_tour/View/Screens/room_detail_page.dart';
import 'package:gb_tour/View/Screens/rooms.dart';
import 'package:gb_tour/Widgets/app_large_text.dart';
import 'package:gb_tour/Widgets/default_button.dart';

import '../../Widgets/app_text.dart';
import 'onboarding_hotel_images.dart';

class HotelDetailPage extends StatefulWidget {
  const HotelDetailPage({Key? key}) : super(key: key);

  @override
  State<HotelDetailPage> createState() => _HotelDetailPageState();
}

class _HotelDetailPageState extends State<HotelDetailPage> {
  late PageController _controller;
  int current_index = 0;
  var images = {
    "car_icon.png": "Car",
    "hotel_icon.png": "Hotel",
    "destination_icon.png": "Destination",
    "attraction_icon.png": "Attraction"
  };
  double rating = 0;

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            PageView.builder(
                controller: _controller,
                itemCount: hotelImages.length,
                onPageChanged: (int index) {
                  setState(() {
                    current_index = index;
                  });
                },
                itemBuilder: (_, index) {
                  return Image.asset(
                    hotelImages[index].hotelImage,
                    //height: 300,
                    fit: BoxFit.cover,
                  );
                }),
            const Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(18),
                  child: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  width: 280,
                ),
                Padding(
                  padding: EdgeInsets.all(18),
                  child: Icon(
                    Icons.favorite_border,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            // SizedBox(
            //   height: MediaQuery.of(context).size.height * 0.2,
            // ),
            SizedBox(
              height: 220,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  hotelImages.length,
                  (index) => buildDot(index, context),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: EdgeInsets.only(top: 240),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AppLargeText(
                                text: 'Hotel Name',
                                size: 36,
                              ),
                            ],
                          ),
                          const SizedBox(height: 3),
                          Row(
                            children: [
                              const Icon(Icons.location_on,
                                  size: 16, color: Colors.indigo),
                              AppText(
                                  text: 'Location',
                                  size: 18,
                                  color: Colors.indigo),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          AppLargeText(text: 'Description'),
                          AppText(
                              text:
                                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book."),
                          const SizedBox(
                            height: 20,
                          ),
                          AppLargeText(text: 'Facilities'),
                          BulletedList(
                              bullet: const Padding(
                                padding: EdgeInsets.all(2),
                                child: Icon(
                                  Icons.check_circle,
                                  size: 24,
                                  color: Colors.indigo,
                                ),
                              ),
                              listItems: [
                                AppText(text: "Car Parking"),
                                AppText(text: "Car Parking"),
                                AppText(text: "Car Parking"),
                                AppText(text: "Car Parking"),
                                AppText(text: "Car Parking"),
                              ]),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                AppLargeText(text: 'Explore Rooms'),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) => Rooms()));
                                  },
                                  child: Icon(
                                    Icons.arrow_forward,
                                    color: Colors.indigo,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            height: 180,
                            width: double.maxFinite,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: 4,
                                itemBuilder: (_, Index) {
                                  return Column(
                                    children: [
                                      GestureDetector(
                                        child: Container(
                                          margin: const EdgeInsets.symmetric(horizontal: 10),
                                          padding: const EdgeInsets.all(12),
                                          height: 160,
                                          width: 160,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(20),
                                            image: DecorationImage(
                                              image:
                                              AssetImage("lib/assets/WelcomeImage.jpeg"),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          child: Column(
                                            children: [
                                              Container(
                                                child: Icon(
                                                  Icons.favorite_border,
                                                  color: Colors.white,
                                                ),
                                                alignment: Alignment.topRight,
                                              ),
                                              Spacer(),
                                              Container(
                                                child: AppText(
                                                  text: 'Room Name',
                                                  color: Colors.white,
                                                ),
                                                alignment: Alignment.bottomLeft,
                                              ),
                                            ],
                                          ),
                                        ),
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) => RoomDetailPage()));
                                        },
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                    ],
                                  );
                                }),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
            ),
          ],
        ),
      ),
    );
  }

  Container buildDot(int index, BuildContext context) {
    return Container(
      height: 10,
      width: current_index == index ? 10 : 10,
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: current_index == index
            ? Colors.white
            : Colors.white.withOpacity(0.3),
      ),
    );
  }
}
