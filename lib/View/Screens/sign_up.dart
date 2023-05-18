import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../Widgets/app_large_text.dart';
import '../../Widgets/app_text.dart';
import '../../Widgets/default_button.dart';
import '../../Widgets/rounded_input_field.dart';
import '../../Widgets/rounded_pass_field.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _username = TextEditingController();
  final _email = TextEditingController();
  final _pass = TextEditingController();
  final _phone = TextEditingController();

  signUp(){
    try{
      FirebaseAuth.instance.createUserWithEmailAndPassword(email: _email.text, password: _pass.text);
      Navigator.pop(context);

    }on FirebaseException catch(e){
      print(e.toString());
    }
  }
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
                  AppLargeText(text: 'Sign Up'),
                  const SizedBox(height: 20),
                  RoundedInputField(hintText: 'User Name', onChanged: (value) {}, controller: _username,),
                  RoundedInputField(hintText: 'Your Email', icon: Icons.email, onChanged: (value) {}, controller: _email,),
                  RoundedInputField(hintText: 'Phone', icon: Icons.phone, onChanged: (value) {}, controller: _phone,),
                  RoundedPasswordField(onChanged: (value) {}, controller: _pass,),
                  DefaultButton(
                    buttonText: 'Sign Up',
                    press: () {
                      signUp();
                    },
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AppText(text: "Already have an Account? ", size: 16,),
                      GestureDetector(
                          onTap: (){
                            Navigator.pop(context);
                          },
                          child: AppLargeText(text: "Sign In", color: Colors.indigo, size: 16,)),
                    ],
                  )
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
