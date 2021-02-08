import 'package:checklist/screens/minhasnotas/components/nota.dart';
import 'package:flutter/material.dart';

class MinhasNotas extends StatelessWidget {
  final List<Nota> _lista = [
    Nota(
      titulo: "Titulo",
      descricao: "Subtitulo",
    ),
    Nota(
      titulo: "Titulo",
      descricao: "Subtitulo",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.all(8.0),
      itemCount: this._lista.length,
      itemBuilder: (context, index) {
        return this._lista[index];
      },
    );
  }
}