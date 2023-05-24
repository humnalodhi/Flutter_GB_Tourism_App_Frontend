import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gb_tour/View/Screens/cars.dart';
import 'package:gb_tour/View/Screens/csp_detail_page.dart';
import 'package:gb_tour/View/Screens/destinations.dart';
import 'package:gb_tour/View/Screens/hotel_detail_page.dart';
import 'package:gb_tour/View/Screens/hotels.dart';
import 'package:gb_tour/View/Screens/places_detail_page.dart';
import 'package:gb_tour/Widgets/app_large_text.dart';
import 'package:gb_tour/Widgets/app_text.dart';
import '../Profile/profile_page.dart';
import '../attractions.dart';
import '../drawer.dart';
import '../places.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double Rating = 0;
  var images = {
    "car_icon.png": "Car",
    "hotel_icon.png": "Hotel",
    "destination_icon.png": "Destination",
    "attraction_icon.png": "Attraction"
  };

  List pages = [
  Cars(),
  Hotels(),
  PopularDestinations(),
  Attractions(),

  ];

  late int currentIndex = 0;
  void onTap(){
    setState(() {
      currentIndex = pages as int;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Row(
          children: [
            Container(
              margin: EdgeInsets.only(left: 30),
              child: AppLargeText(
                text: 'Gilgit-Baltistan Tourism',
                size: 20,
              ),
            ),
            Spacer(),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ProfilePage()));
              },
              child: CircleAvatar(
                radius: 18,
                backgroundColor: Colors.grey,
                child: Icon(
                  Icons.person_rounded,
                  color: Colors.black87,
                ),
              ),
            ),
          ],
        ),
        iconTheme: IconThemeData(color: Colors.black87),
      ),
      drawer: DrawerScreen(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 15),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 35),
                  height: 100,
                  width: 220,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('lib/assets/clouds.jpeg'),
                        fit: BoxFit.cover,
                        opacity: 0.8),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        offset: const Offset(0, 1),
                        blurRadius: 5,
                        color: Colors.grey.withOpacity(0.5),
                      ),
                    ],
                  ),
                  child: Center(
                      child: AppLargeText(
                        text: '18°C',
                        size: 40,
                        color: Colors.indigo.withOpacity(0.9),
                      )),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 25),
                  padding: EdgeInsets.all(8),
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.indigo,
                    boxShadow: [
                      BoxShadow(
                        offset: const Offset(0, 1),
                        blurRadius: 5,
                        color: Colors.grey.withOpacity(0.5),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.grid_on,
                        size: 40,
                        color: Colors.white,
                      ),
                      AppLargeText(
                        text: 'Find your',
                        size: 14,
                        color: Colors.white,
                      ),
                      AppLargeText(
                        text: 'perfect place',
                        size: 14,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
              width: 20,
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: 20),
              padding: EdgeInsets.symmetric(horizontal: 20),
              height: 45,
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.indigo),
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, 1),
                    blurRadius: 5,
                    color: Colors.indigo.withOpacity(0.5),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Search",
                        hintStyle: TextStyle(color: Colors.black54),
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                      ),
                    ),
                  ),
                  Icon(
                    Icons.search,
                    color: Colors.indigo,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Container(
              margin: EdgeInsets.only(left: 24),
              child: Row(
                children: [
                  AppLargeText(text: 'What are you looking for?'),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              height: 120,
              width: double.maxFinite,
              margin: const EdgeInsets.only(left: 20),
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 4,
                  itemBuilder: (_, Index) {
                    return Column(
                      children: [
                        GestureDetector(
                          onTap:(){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=> pages.elementAt(Index)));
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 16),
                            //padding: const EdgeInsets.all(20),
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(200),
                              color: Colors.indigo,
                              image: DecorationImage(
                                image: AssetImage(
                                    "lib/assets/" + images.keys.elementAt(Index)),
                                scale: 4,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Container(
                          child: AppText(
                            text: images.values.elementAt(Index),
                            size: 14,
                          ),
                        ),
                      ],
                    );
                  }),
            ),
            SizedBox(
              height: 2,
            ),
            Container(
              margin: EdgeInsets.only(left: 24, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppLargeText(text: 'Popular Destinations'),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PopularDestinations()));
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
              height: 220,
              width: double.maxFinite,
              margin: const EdgeInsets.only(left: 20),
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 4,
                  itemBuilder: (_, Index) {
                    return Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Places()));
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            padding: const EdgeInsets.all(12),
                            height: 200,
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
                                SizedBox(
                                  height: 60,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      child: Icon(
                                        Icons.location_on_outlined,
                                        color: Colors.white,
                                        size: 20,
                                      ),
                                      alignment: Alignment.center,
                                    ),
                                    Container(
                                      child: AppText(
                                        text: 'City Name',
                                        color: Colors.white,
                                        size: 20,
                                      ),
                                      alignment: Alignment.center,
                                    ),
                                  ],
                                ),
                                Spacer(),
                              ],
                            ),
                          ),
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
            Container(
              margin: EdgeInsets.only(left: 24, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppLargeText(text: 'Hotels'),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Hotels()));
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
              margin: const EdgeInsets.only(left: 20),
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
                                    text: 'Hotel Name',
                                    color: Colors.white,
                                  ),
                                  alignment: Alignment.bottomLeft,
                                ),
                                /*Row(
                                  children: [
                                    RatingBar.builder(
                                      initialRating: 0,
                                      minRating: 1,
                                      allowHalfRating: true,
                                      unratedColor: Colors.grey,
                                      itemCount: 5,
                                      itemSize: 20,
                                      itemPadding:
                                          EdgeInsets.symmetric(horizontal: 1),
                                      updateOnDrag: true,
                                      itemBuilder: (context, index) => Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                      ),
                                      onRatingUpdate: (ratingvalue) {
                                        setState(() {
                                          Rating = ratingvalue;
                                        });
                                      },
                                    ),
                                    Text(
                                      '$Rating',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.amber),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                                Row(
                                  children: [
                                    CircleAvatar(
                                      child: Icon(
                                        Icons.person_rounded,
                                        color: Colors.white,
                                      ),
                                      radius: 15,
                                      backgroundColor: Colors.indigo,
                                    ),
                                    SizedBox(
                                      width: 3,
                                    ),
                                    Container(
                                      child: AppText(
                                        text: 'Owner Name',
                                        size: 16,
                                        color: Colors.white,
                                      ),
                                      alignment: Alignment.bottomLeft,
                                    ),
                                  ],
                                ),*/
                              ],
                            ),
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HotelDetailPage()));
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
            Container(
              margin: EdgeInsets.only(left: 24, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppLargeText(text: 'Cars'),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Cars()));
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
              margin: const EdgeInsets.only(left: 20),
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
                                    text: 'Car Name',
                                    color: Colors.white,
                                  ),
                                  alignment: Alignment.bottomLeft,
                                ),
                                /*Row(
                                  children: [
                                    RatingBar.builder(
                                      initialRating: 0,
                                      minRating: 1,
                                      allowHalfRating: true,
                                      unratedColor: Colors.grey,
                                      itemCount: 5,
                                      itemSize: 20,
                                      itemPadding:
                                          EdgeInsets.symmetric(horizontal: 1),
                                      updateOnDrag: true,
                                      itemBuilder: (context, index) => Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                      ),
                                      onRatingUpdate: (ratingvalue) {
                                        setState(() {
                                          Rating = ratingvalue;
                                        });
                                      },
                                    ),
                                    Text(
                                      '$Rating',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.amber),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                                Row(
                                  children: [
                                    CircleAvatar(
                                      child: Icon(
                                        Icons.person_rounded,
                                        color: Colors.white,
                                      ),
                                      radius: 15,
                                      backgroundColor: Colors.indigo,
                                    ),
                                    SizedBox(
                                      width: 3,
                                    ),
                                    Container(
                                      child: AppText(
                                        text: 'Owner Name',
                                        size: 16,
                                        color: Colors.white,
                                      ),
                                      alignment: Alignment.bottomLeft,
                                    ),
                                  ],
                                ),*/
                              ],
                            ),
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CSPDetailPage()));
                          },
                        ),
                      ],
                    );
                  }),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.only(left: 24, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppLargeText(text: 'Attractions'),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Places()));
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
              height: 200,
              width: double.maxFinite,
              margin: const EdgeInsets.only(left: 20),
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
                            height: 180,
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
                                    text: 'Place Name',
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
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PlacesDetailPage()));
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
    );
  }
}
