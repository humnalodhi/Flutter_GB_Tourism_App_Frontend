import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Widgets/app_large_text.dart';
import '../../Widgets/default_button.dart';
import '../../Widgets/rounded_input_field.dart';

class ResetPassScreen extends StatefulWidget {
  const ResetPassScreen({Key? key}) : super(key: key);

  @override
  State<ResetPassScreen> createState() => _ResetPassScreenState();
}

class _ResetPassScreenState extends State<ResetPassScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
                left: 0,
                right: 0,
                child: Container(
                  height: 250,
                  color: Colors.indigo,
                ),
            ),
            Positioned(
              top: 200,
                child: Container(
                  padding: const EdgeInsets.only( top: 50, right: 20, left: 20),
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(child: AppLargeText(text: 'Reset Password')),
                  const SizedBox(height: 20),
                  RoundedInputField(hintText: 'Your Email', onChanged: (value) {}),
                  DefaultButton(
                    buttonText: 'Reset',
                    press: () {},
                  ),
                ],
              ),
            ))
          ],
        )
      ),
    );
  }
}