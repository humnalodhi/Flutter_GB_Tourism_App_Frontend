import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Widgets/app_text.dart';

class Attractions extends StatefulWidget {
  const Attractions({Key? key}) : super(key: key);

  @override
  State<Attractions> createState() => _AttractionsState();
}

class _AttractionsState extends State<Attractions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AppText(text: "Attractions"),
      ),
    );
  }
}
