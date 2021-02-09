import 'package:checklist/database/dao/nota_dao.dart';
import 'package:checklist/models/modelo_nota.dart';
import 'package:checklist/screens/adicionarnotas/components/botao_confirmar.dart';
import 'package:checklist/screens/adicionarnotas/components/input.dart';
import 'package:flutter/material.dart';

const _labelInputUm = "Título";
const _labelInputDois = "Descrição";

class AdicionarNotas extends StatefulWidget {
  @override
  _AdicionarNotasState createState() => _AdicionarNotasState();
}

class _AdicionarNotasState extends State<AdicionarNotas> {
  final TextEditingController _controllerTitulo = TextEditingController();
  final TextEditingController _controllerDescricao = TextEditingController();
  final NotaDao _dao = NotaDao();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_rounded),
          color: Colors.black,
        ),
        title: Text(
          "Adicionar Nota",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.only(
          left: size.width * 0.03889,
          right: size.width * 0.03889,
        ),
        children: [
          Input(
            label: _labelInputUm,
            controller: this._controllerTitulo,
          ),
          Input(
            label: _labelInputDois,
            controller: this._controllerDescricao,
          ),
          BotaoConfirmar(
            onTap: () {
              final ModeloNota novaNota = ModeloNota(
                0,
                this._controllerTitulo.text,
                this._controllerDescricao.text,
              );
              this
                  ._dao
                  .salvar(novaNota)
                  .then((value) => Navigator.pop(context));
            },
          ),
        ],
      ),
    );
  }
}
