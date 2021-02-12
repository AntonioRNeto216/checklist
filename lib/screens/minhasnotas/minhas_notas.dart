import 'package:checklist/components/alerta.dart';
import 'package:checklist/constants.dart';
import 'package:checklist/database/dao/nota_dao.dart';
import 'package:checklist/models/modelo_nota.dart';
import 'package:checklist/screens/adicionarnotas/adicionar_notas.dart';
import 'package:checklist/screens/minhasnotas/components/nota.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const _tituloAlerta = "Sair";
const _descricaoAlerta = "Deseja sair do CheckList?";

const _tituloAppBar = "Minhas Notas";
const _iconeAppBar = Icons.add;
const _fraseIconeAppBar = "Adicionar Nota";

const _imagemListaVazia = "assets/images/lista_vazia.png";
const _textoListaVazia = "Nenhuma nota criada até o momento";

const _erro = "ERRO NÃO CONHECIDO!!!";

class MinhasNotas extends StatefulWidget {
  @override
  _MinhasNotasState createState() => _MinhasNotasState();
}

class _MinhasNotasState extends State<MinhasNotas> {
  final NotaDao _dao = NotaDao();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () {
        return alerta(
          context,
          _tituloAlerta,
          _descricaoAlerta,
          () => SystemChannels.platform.invokeMethod('SystemNavigator.pop'),
        );
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: corAppBar,
          automaticallyImplyLeading: false,
          title: Text(
            _tituloAppBar,
            style: TextStyle(
              color: corTexto,
              fontWeight: FontWeight.bold,
              fontSize: size.height * 0.0213414,
            ),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.only(
                right: 16, // constante
              ),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AdicionarNotas(),
                    ),
                  ).then((value) => setState(() {}));
                },
                child: Row(
                  children: [
                    Icon(
                      _iconeAppBar,
                      color: corIcone,
                      size: size.height * 0.0284553,
                    ),
                    Text(
                      _fraseIconeAppBar,
                      style: TextStyle(
                        color: corTexto,
                        fontSize: size.height * 0.0142276,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        body: FutureBuilder<List<ModeloNota>>(
          future: this._dao.getNotas(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                break;
              case ConnectionState.waiting:
                return Center(
                  child: CircularProgressIndicator(
                    backgroundColor: backgroundCircularProgress,
                    valueColor: AlwaysStoppedAnimation<Color>(corIcone),
                  ),
                );
              case ConnectionState.active:
                break;
              case ConnectionState.done:
                final List<ModeloNota> _listaDeNotas = snapshot.data;
                if (_listaDeNotas.length != 0) {
                  return ListView.builder(
                    physics: BouncingScrollPhysics(),
                    padding: EdgeInsets.symmetric(
                      vertical: size.height * 0.0094851,
                      horizontal: size.width * 0.0194444,
                    ),
                    itemCount: _listaDeNotas.length,
                    itemBuilder: (context, index) {
                      final ModeloNota nota = _listaDeNotas[index];
                      return Nota(
                        modeloNota: nota,
                        onTapExcluir: () {
                          this._dao.remove(nota.id);
                          setState(() {});
                          Navigator.pop(context);
                        },
                      );
                    },
                  );
                } else {
                  return Align(
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(_imagemListaVazia),
                        Text(
                          _textoListaVazia,
                          style: TextStyle(
                            color: corTexto,
                            fontSize: size.height * 0.0189702,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  );
                }
            }
            return Center(child: Text(_erro));
          },
        ),
      ),
    );
  }
}
