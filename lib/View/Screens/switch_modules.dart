import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gb_tour/View/Screens/CSPNavPages/csp_home_page.dart';
import 'package:gb_tour/View/Screens/CSPNavPages/csp_main_page.dart';
import 'package:gb_tour/View/Screens/HSPNavPages/hsp_home_page.dart';
import 'package:gb_tour/View/Screens/HSPNavPages/hsp_main_page.dart';
import 'package:gb_tour/View/Screens/NavPages/main_page.dart';
import 'package:gb_tour/Widgets/default_button.dart';

class SwitchModules extends StatelessWidget {
  const SwitchModules({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            DefaultButton(buttonText: "Switch as Tourist", press: (){
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> MainPage()));
            },),
            DefaultButton(buttonText: "Switch to HSP", press: (){
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HSPHomePage()));
            },),
            DefaultButton(buttonText: "Switch to CSP", press: (){
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>CSPHomePage()));
            },),
          ],
        ),
      ),
    );
  }
}
