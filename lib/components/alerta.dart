import 'package:flutter/material.dart';

class Alerta extends StatelessWidget {
  final String titulo, mensagem;
  final Function onPressed;

  const Alerta({
    @required this.mensagem,
    @required this.titulo,
    @required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(this.titulo),
      content: Text(this.mensagem),
      actions: [
        TextButton(
          child: Text(
            "Cancelar",
            style: TextStyle(color: Colors.black),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: Text(
            "Continuar",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          onPressed: this.onPressed,
        ),
      ],
    );
  }
}