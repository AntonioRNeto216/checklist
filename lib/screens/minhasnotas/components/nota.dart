import 'package:flutter/material.dart';

const _cardElevation = 4.0;
const _shadowColor = Colors.black;
const _tituloCard = Colors.black;
const _bottomTexto = "Clique para saber mais";
const _subtituloColor = Colors.grey;

class Nota extends StatelessWidget {
  final String titulo, descricao;

  const Nota({
    Key key,
    @required this.titulo,
    @required this.descricao,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Card(
      elevation: _cardElevation,
      shadowColor: _shadowColor,
      child: ListTile(
        onTap: () {},
        title: Text(
          this.titulo,
          style: TextStyle(
            color: _tituloCard,
            fontSize: size.height * 0.028455,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextoCard(texto: this.descricao),
            SizedBox(height: size.height * 0.03794),
            Container(
              alignment: Alignment.bottomRight,
              width: double.infinity,
              child: TextoCard(texto: _bottomTexto),
            )
          ],
        ),
      ),
    );
  }
}

class TextoCard extends StatelessWidget {
  final String texto;

  const TextoCard({
    Key key,
    @required this.texto,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Text(
      this.texto,
      style: TextStyle(
        color: _subtituloColor,
        fontSize: size.height * 0.0165989,
      ),
    );
  }
}