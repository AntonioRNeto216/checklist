import 'package:checklist/screens/adicionarnotas/components/input.dart';
import 'package:flutter/material.dart';

class AdicionarNotas extends StatelessWidget {
  final TextEditingController _controllerTitulo = TextEditingController();
  final TextEditingController _controllerDescricao = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ListView(
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.only(
        left: size.width * 0.03889,
        right: size.width * 0.03889,
      ),
      children: [
        Input(
          label: "Título",
          controller: this._controllerTitulo,
        ),
        Input(
          label: "Descrição",
          controller: this._controllerDescricao,
        ),
      ],
    );
  }
}

