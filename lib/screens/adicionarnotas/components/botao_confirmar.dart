import 'package:flutter/material.dart';

const _textoBotao = "Confirmar";

class BotaoConfirmar extends StatelessWidget {
  final Function onTap;

  const BotaoConfirmar({
    @required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: this.onTap,
      child: Container(
        height: size.height * 0.075881,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.grey[500],
          borderRadius: BorderRadius.circular(20.0),
        ),
        alignment: Alignment.center,
        child: Text(
          _textoBotao,
          style: TextStyle(
            color: Colors.white,
            fontSize: size.height * 0.021341,
          ),
        ),
      ),
    );
  }
}