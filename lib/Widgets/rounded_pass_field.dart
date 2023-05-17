import 'package:flutter/material.dart';
import 'package:gb_tour/Widgets/text_field_container.dart';


class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;

  const RoundedPasswordField({
    Key? key,
    required this.onChanged
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
        child: TextField(
          obscureText: true,
          onChanged: onChanged,
          decoration: InputDecoration(
              icon: Icon(Icons.lock),
              iconColor: Colors.indigo,
              border: InputBorder.none,
              hintText: 'Password',
              suffixIcon: Icon(Icons.visibility, color: Colors.indigo,)
          ),

        ));
  }
}
