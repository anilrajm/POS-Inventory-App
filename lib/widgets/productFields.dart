import 'package:flutter/material.dart';

class Fields extends StatelessWidget {
final String hint;
final Icon? preIcon;

Fields({required this.hint,
this.preIcon,
 }

    );
  @override
  Widget build(BuildContext context) {
    return   Container(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width / 28,
      ),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: hint,
          border: OutlineInputBorder(),
          prefixIcon: preIcon,
        ),
      ),
    );
  }
}
