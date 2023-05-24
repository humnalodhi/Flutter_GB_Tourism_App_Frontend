import 'package:bulleted_list/bulleted_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gb_tour/Widgets/app_large_text.dart';
import 'package:gb_tour/Widgets/app_text.dart';
import '../../Widgets/default_button.dart';
import 'onboarding_hotel_images.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int current_index = 0;
  late PageController _controller;
  double rating = 0;
  var images = {
    "car_icon.png": "Car",
    "hotel_icon.png": "Hotel",
    "destination_icon.png": "Destination",
    "attraction_icon.png": "Attraction"
  };
  @override

  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.maxFinite,
          height: double.maxFinite,
          child: Stack(
            children: [
              Positioned(
                left: 0,
                right: 0,
                child: PageView.builder(
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
              ),
              const Positioned(
                left: 20,
                  top: 40,
                  child: Row(
                    children: [
                      Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 280,
                      ),
                      Icon(
                        Icons.favorite_border,
                        color: Colors.white,
                      ),
                    ],
                  ),
              ),
              Positioned(
                child: Container(
                  height: 290,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      hotelImages.length,
                          (index) => buildDot(index, context),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 300,
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
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
                          SizedBox(height: 3),
                          Row(
                            children: [
                              Icon(Icons.location_on,
                                  size: 16, color: Colors.indigo),
                              AppText(
                                  text: 'Location',
                                  size: 18,
                                  color: Colors.indigo),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          AppLargeText(text: 'Description'),
                          AppText(
                              text:
                              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book."),
                          SizedBox(
                            height: 20,
                          ),
                          AppLargeText(text: 'Facilities'),
                          BulletedList(
                              bullet: Padding(
                                padding: const EdgeInsets.all(2),
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
                          // Container(
                          //   //margin: EdgeInsets.only(left: 24),
                          //   child: Row(
                          //     children: [
                          //       AppLargeText(text: 'Facilities'),
                          //     ],
                          //   ),
                          // ),
                          // SizedBox(
                          //   height: 15,
                          // ),
                          // Container(
                          //   height: 120,
                          //   width: double.maxFinite,
                          //   //margin: const EdgeInsets.only(left: 20),
                          //   child: ListView.builder(
                          //       scrollDirection: Axis.horizontal,
                          //       itemCount: 4,
                          //       itemBuilder: (_, index){
                          //         return Column(
                          //           children: [
                          //             Container(
                          //               margin: const EdgeInsets.symmetric(horizontal: 12),
                          //               //padding: const EdgeInsets.all(20),
                          //               height: 70,
                          //               width: 70,
                          //               decoration: BoxDecoration(
                          //                 borderRadius: BorderRadius.circular(20),
                          //                 color: Color(0xFFCCEFE0),
                          //                 image: DecorationImage(
                          //                   image: AssetImage("lib/assets/" +images.keys.elementAt(index)),
                          //                   fit: BoxFit.cover,
                          //                 ),
                          //               ),
                          //             ),
                          //             SizedBox(
                          //               height: 4,
                          //             ),
                          //             Container(
                          //               child: AppText(text: images.values.elementAt(index),
                          //                 size: 14,
                          //               ),
                          //             ),
                          //           ],
                          //         );
                          //       }
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              DefaultButton(buttonText: "Explore Rooms")
            ],
          ),
        ),
      ),
    );
  }

  Container buildDot(int index, BuildContext context) {
    return Container(
      height: 10,
      width: current_index == index ? 10 : 10,
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: current_index == index
            ? Colors.white
            : Colors.white.withOpacity(0.3),
      ),
    );
  }
}
