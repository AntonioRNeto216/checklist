import 'package:checklist/components/alerta.dart';
import 'package:checklist/database/dao/nota_dao.dart';
import 'package:checklist/models/modelo_nota.dart';
import 'package:checklist/screens/adicionarnotas/adicionar_notas.dart';
import 'package:checklist/screens/minhasnotas/components/nota.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
        return showDialog(
          context: context,
          builder: (BuildContext context) {
            return Alerta(
              titulo: "Sair",
              mensagem: "Deseja sair do CheckList?",
              onPressed: () {
                SystemChannels.platform.invokeMethod("SystemNavigator.pop");
              }
            );
          },
        );
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          title: Text(
            "Minhas Notas",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
            ),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.only(
                right: 16.0,
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
                      Icons.add,
                      color: Colors.black,
                      size: 24.0,
                    ),
                    Text(
                      "Adicionar Nota",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12.0,
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
                    backgroundColor: Colors.grey[200],
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
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
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset("assets/images/lista_vazia.png"),
                      Text(
                        "Nenhuma nota criada até o momento",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: size.height * 0.0189702,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  );
                }
            }
            return Center(child: Text("ERRO NÃO CONHECIDO!!!"));
          },
        ),
      ),
    );
  }
}