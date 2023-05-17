import 'package:flutter/material.dart';
import 'package:gb_tour/View/Screens/NavPages/home_page.dart';
import 'package:gb_tour/View/Screens/welcome.dart';

class AnimatedSplash extends StatefulWidget {
  const AnimatedSplash({Key? key}) : super(key: key);

  @override
  State<AnimatedSplash> createState() => _AnimatedSplashState();
}

class _AnimatedSplashState extends State<AnimatedSplash> {
  void initState(){
    super.initState();
    _navigatetohome();
  }

  _navigatetohome() async{
    await Future.delayed(Duration(milliseconds: 1500), (){});
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Welcome()));

  }
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF40916C),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Text(
            //   "GB Tourism",
            //     style: TextStyle(
            //     fontSize: 24,
            //       fontWeight: FontWeight.bold,
            //     color: Colors.white,
            //   ),
            // ),
            Container(
              height: 100,
              width: 100,
              color: Colors.blue,
              child: Image.asset('lib/assets/Logo.jpg'),
            ),
          ],
        ),
      ),
    );
  }
}