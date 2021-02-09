import 'package:checklist/constants.dart';
import 'package:checklist/database/dao/nota_dao.dart';
import 'package:checklist/models/modelo_nota.dart';
import 'package:checklist/screens/adicionarnotas/components/botao_confirmar.dart';
import 'package:checklist/screens/adicionarnotas/components/input.dart';
import 'package:flutter/material.dart';

const _botaoAppBar = Icons.arrow_back_ios_rounded;

const _tituloScreen = "Adicionar Nota";

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
        backgroundColor: corAppBar,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(_botaoAppBar),
          color: corIcone,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: size.height * 0.0379404),
          Padding(
            padding: EdgeInsets.only(
              left: size.width * 0.0583333,
              bottom: size.height * 0.0047425,
            ),
            child: Text(
              _tituloScreen,
              style: TextStyle(
                color: corTexto,
                fontWeight: FontWeight.bold,
                fontSize: size.height * 0.0237127,
              ),
            ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.only(
                top: size.height * 0.0047425,
              ),
              decoration: BoxDecoration(
                color: corContainer,
                boxShadow: [
                  BoxShadow(
                    color: shadow,
                    spreadRadius: size.height * 0.0023713,
                  ),
                ],
              ),
              child: ListView(
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.only(
                  left: size.width * 0.03889,
                  right: size.width * 0.03889,
                ),
                children: [
                  SizedBox(height: size.height * 0.0379404),
                  Input(
                    label: _labelInputUm,
                    controller: this._controllerTitulo,
                  ),
                  Input(
                    label: _labelInputDois,
                    controller: this._controllerDescricao,
                  ),
                  BotaoConfirmar(onTap: () {
                    if (this._controllerTitulo.text != "" &&
                        this._controllerDescricao.text != "") {
                      final ModeloNota novaNota = ModeloNota(
                        0,
                        this._controllerTitulo.text,
                        this._controllerDescricao.text,
                      );
                      this._dao.salvar(novaNota).then(
                            (value) => Navigator.pop(context),
                          );
                    }
                  }),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
