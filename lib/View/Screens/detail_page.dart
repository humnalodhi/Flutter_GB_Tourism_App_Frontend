import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:gb_tour/Widgets/app_large_text.dart';
import 'package:gb_tour/Widgets/app_text.dart';

import 'onboardingContent.dart';
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
        child: Container(
          width: double.maxFinite,
          height: double.maxFinite,
          child: Stack(
            children: [
              Positioned(
                left: 0,
                right: 0,
                child: Expanded(
                  child: PageView.builder(
                      controller: _controller,
                      itemCount: hotelImages.length,
                      onPageChanged: (int index) {
                        setState(() {
                          current_index = index;
                        });
                      },
                      itemBuilder: (_, index) {
                        return Container(
                          width: double.maxFinite,
                          height: 300,
                          child: Column(
                              children: [
                                Image.asset(
                                  hotelImages[index].hotelImage,
                                  //height: 300,
                                  fit: BoxFit.cover,
                                ),
                              ],
                          ),
                        );
                      }),
                ),
              ),
              Positioned(
                left: 20,
                  top: 40,
                  child: Row(
                children: [
                  IconButton(onPressed: (){}, icon: const Icon(Icons.menu), color: Colors.white, iconSize: 28),
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
                  padding: EdgeInsets.only(top: 30, right: 20, left: 20),
                  width: MediaQuery.of(context).size.width,
                  height: 550,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppLargeText(text: 'Hunza', size: 36,),
                          AppLargeText(text: '\$ 250', size: 32,),
                        ],
                      ),
                      SizedBox(height: 3),
                      Row(
                        children: [
                          Icon(Icons.location_on, size: 16,color: Colors.indigo),
                          AppText(text: 'Gilgit-Baltistan', size: 18, color: Colors.indigo),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          RatingBar.builder(
                            initialRating: 0,
                            minRating: 1,
                            allowHalfRating: true,
                            unratedColor: Colors.grey,
                            itemCount: 5,
                            itemSize: 24,
                            itemPadding: EdgeInsets.symmetric(horizontal: 1),
                            updateOnDrag: true,
                            itemBuilder: (context, index)=> Icon(Icons.star, color: Colors.amber),
                            onRatingUpdate: (ratingval){
                              setState(() {
                                rating = ratingval;
                              });
                            },
                          ),
                          Text('$rating', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.amber),),

                        ],
                      ),
                      SizedBox(height: 12,),
                      AppLargeText(text: 'Description'),
                      AppText(text:"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book."),
                      SizedBox(height: 10,),
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
              Positioned(
                bottom: 0,
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.all(10),
                        height: 70,
                        width: 70,
                        child: Icon(Icons.favorite),
                        decoration: BoxDecoration(
                          border: Border.all( color: Colors.black87),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      Container(
                        width: 310,
                        height: 70,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.indigo,
                        ),
                        child: Center(child: AppLargeText(color: Colors.white, text: 'Book Now',)),
                      ),
                    ],
                  ),
              ),
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
