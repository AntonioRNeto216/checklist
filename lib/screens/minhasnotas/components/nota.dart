import 'package:checklist/components/alerta.dart';
import 'package:checklist/constants.dart';
import 'package:checklist/models/modelo_nota.dart';
import 'package:flutter/material.dart';

const _cardElevation = 4.0;
const _tituloAlerta = "Terminou!";
const _descricao = "Concluiu sua nota?";
const _iconeCard = Icons.check_circle_outline;

class Nota extends StatelessWidget {
  final ModeloNota modeloNota;
  final Function onTapExcluir;

  Nota({
    @required this.modeloNota,
    @required this.onTapExcluir,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Card(
      elevation: _cardElevation,
      shadowColor: shadow,
      child: ListTile(
        title: Text(
          this.modeloNota.titulo,
          style: TextStyle(
            color: corTexto,
            fontSize: size.height * 0.028455,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              this.modeloNota.descricao,
              style: TextStyle(
                color: corTexto,
                fontSize: size.height * 0.0165989,
              ),
            ),
            SizedBox(height: size.height * 0.038),
            Container(
              alignment: Alignment.bottomRight,
              width: double.infinity,
              child: IconButton(
                onPressed: () {
                  return alerta(
                    context,
                    _tituloAlerta,
                    _descricao,
                    this.onTapExcluir,
                  );
                },
                iconSize: size.height * 0.03,
                icon: Icon(_iconeCard),
                color: corCheck,
              ),
            ),
          ],
        ),
      ),
    );
  }
}