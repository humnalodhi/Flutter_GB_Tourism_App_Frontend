import 'package:flutter/material.dart';
import 'package:gb_tour/View/Screens/hsp_service_form.dart';
import 'package:gb_tour/Widgets/default_button.dart';

import '../../../Widgets/app_large_text.dart';
import '../../../Widgets/app_text.dart';
import '../drawer.dart';

class HSPHomePage extends StatefulWidget {
  const HSPHomePage({Key? key}) : super(key: key);

  @override
  State<HSPHomePage> createState() => _HSPHomePageState();
}

class _HSPHomePageState extends State<HSPHomePage> {
  Color _buttonColor = Colors.red;
  String _buttonText = 'Booked';

  void _changeButtonState() {
    setState(() {
      if (_buttonColor == Colors.grey) {
        _buttonColor = Colors.red;
        _buttonText = 'Booked';
      } else {
        _buttonColor = Colors.grey;
        _buttonText = 'Unbooked';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Container(
            margin: EdgeInsets.only(left: 30),
            child: Row(
              children: [
                AppLargeText(
                  text: 'Welcome to Dashboard',
                  size: 20,
                ),
                Spacer(),
                Icon(Icons.person_rounded)
              ],
            )),
        iconTheme: IconThemeData(color: Colors.black87),
      ),
      drawer: DrawerScreen(),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: AppLargeText(text: "Active Services"),
          ),
          Padding(
            padding: EdgeInsets.only(top: 50, bottom: 85),
            child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 8, vertical: 8),
                    padding: const EdgeInsets.all(10),
                    height: 220,
                    width: 160,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: const DecorationImage(
                        image: AssetImage("lib/assets/WelcomeImage.jpeg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        PopupMenuButton(
                          itemBuilder: (BuildContext context) => [
                            PopupMenuItem(
                              padding: const EdgeInsets.symmetric(horizontal: 15),
                              child: AppText(
                                text: "Update",
                              ),
                            ),
                            PopupMenuItem(
                              padding: const EdgeInsets.symmetric(horizontal: 15),
                              child: AppText(
                                text: "Delete",
                              ),
                              onTap: () {},
                            ),
                          ],
                          child: Container(
                            child: Icon(
                              Icons.more_vert,
                              color: Colors.white,
                              size: 25,
                            ),
                            alignment: Alignment.topRight,
                          ),
                        ),
                        const SizedBox(
                          height: 45,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              child: AppText(
                                text: 'Room Name',
                                color: Colors.white,
                                size: 20,
                              ),
                              alignment: Alignment.center,
                            ),
                          ],
                        ),
                        Container(
                          height: 50,
                          margin: const EdgeInsets.symmetric(vertical: 5),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 5),
                          width: size.width * 0.9,
                          child: TextButton(
                            style: TextButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              backgroundColor: _buttonColor,
                            ),
                            onPressed: _changeButtonState,
                            child: AppLargeText(
                                text: _buttonText,
                                color: Colors.white,
                                size: 18),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
          ),
          Positioned(
            bottom: 0,
              left: 20,
              child: DefaultButton(buttonText: "Create a Service", press: (){
                showDialogWidget(context);
              })),
        ],
      ),
    );
  }

  showDialogWidget(BuildContext context) {
    AlertDialog alert = AlertDialog(
      title: AppLargeText(text: "Alert"),
      content: AppText(text: "Please register your hotel first!",),
      actions: [
        DefaultButton(buttonText: "Register Hotel", press: (){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> HSPServiceForm()));
        },),
      ],
    );
    
    showDialog(context: context, builder: (BuildContext context){
  return alert;
    });
  }
}
