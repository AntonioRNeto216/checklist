import 'package:checklist/components/alerta.dart';
import 'package:checklist/models/modelo_nota.dart';
import 'package:flutter/material.dart';

const _cardElevation = 4.0;

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
      shadowColor: Colors.black,
      child: ListTile(
        title: Text(
          this.modeloNota.titulo,
          style: TextStyle(
            color: Colors.black,
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
                color: Colors.black,
                fontSize: size.height * 0.0165989,
              ),
            ),
            SizedBox(height: size.height * 0.038),
            Container(
              alignment: Alignment.bottomRight,
              width: double.infinity,
              child: IconButton(
                onPressed: () {
                  return showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return Alerta(
                        titulo: "Excluir",
                        mensagem: "Deseja excluir sua nota?",
                        onPressed: this.onTapExcluir,
                      );
                    }
                  );
                },
                iconSize: size.height * 0.0284553,
                icon: Icon(Icons.delete_forever_outlined),
                color: Colors.red[300],
              ),
            ),
          ],
        ),
      ),
    );
  }
}