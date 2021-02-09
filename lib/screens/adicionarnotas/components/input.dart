import 'dart:ui';
import 'package:checklist/constants.dart';
import 'package:flutter/material.dart';

const _iconeInput = Icons.label_important_outline;

class Input extends StatelessWidget {
  final TextEditingController controller;
  final String label;

  const Input({
    Key key,
    @required this.controller,
    @required this.label,
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
        cursorColor: corInput,
        controller: this.controller,
        textCapitalization: TextCapitalization.sentences,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(
            bottom: size.height * 0.05,
          ),
          counterText: "",
          prefixIcon: Icon(
            _iconeInput,
            color: corIcone,
          ),
          labelText: this.label,
          labelStyle: TextStyle(
            color: corTexto,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: BorderSide(
              color: corInput,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: BorderSide(
              color: corInput,
            ),
          ),
        ),
      ),
    );
  }
}