import 'dart:ui';

import 'package:flutter/material.dart';

class Input extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  //final double height;

  const Input({
    Key key,
    @required this.controller,
    @required this.label,
    //@required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(
        bottom: size.height * 0.0284553,
      ),
      child: TextField(
        maxLines: null,
        cursorColor: Colors.black,
        controller: this.controller,
        textCapitalization: TextCapitalization.sentences,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(
            bottom: size.height * 0.05,
          ),
          counterText: "",
          prefixIcon: Icon(
            Icons.label_important_outline,
            color: Colors.black,
          ),
          labelText: this.label,
          labelStyle: TextStyle(
            color: Colors.black,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: BorderSide(
              color: Colors.black,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: BorderSide(
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}