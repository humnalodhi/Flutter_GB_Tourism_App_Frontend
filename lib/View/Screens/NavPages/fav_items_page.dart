import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gb_tour/Widgets/app_large_text.dart';

import '../../../Widgets/app_text.dart';

class FavItemsPage extends StatelessWidget {
  const FavItemsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text("No Favorite items yet!"),
      ),
    );
  }
}
