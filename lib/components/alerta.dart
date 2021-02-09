import 'package:checklist/constants.dart';
import 'package:flutter/material.dart';

const _botaoEsquerdo = "Cancelar";
const _botaoDireito = "Continuar";

alerta(BuildContext context, String titulo, String mensagem, Function onPressed) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(titulo),
        content: Text(mensagem),
        actions: [
          TextButton(
            child: Text(
              _botaoEsquerdo,
              style: TextStyle(color: corTexto),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: Text(
              _botaoDireito,
              style: TextStyle(
                color: corTexto,
              ),
            ),
            onPressed: onPressed,
          ),
        ],
      );
    },
  );
}
