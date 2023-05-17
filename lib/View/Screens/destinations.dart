import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Widgets/app_text.dart';

class PopularDestinations extends StatelessWidget {
  const PopularDestinations({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemBuilder: (context, index){
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              padding: const EdgeInsets.all(12),
              height: 220,
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
                  // Container(
                  //   child: Icon(
                  //     Icons.favorite_border,
                  //     color: Colors.white,
                  //     size: 25,
                  //   ),
                  //   alignment: Alignment.topRight,
                  // ),
                  // SizedBox(
                  //   height: 60,
                  // ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
                  //     Container(
                  //       child: Icon(
                  //         Icons.location_on_outlined,
                  //         color: Colors.white,
                  //         size: 20,
                  //       ),
                  //       alignment: Alignment.center,
                  //     ),
                  //     Container(
                  //       child: AppText(
                  //         text: 'City Name',
                  //         color: Colors.white,
                  //         size: 20,
                  //       ),
                  //       alignment: Alignment.center,
                  //     ),
                  //   ],
                  // ),
                ],
              ),
            );
          }),
    );
  }
}
