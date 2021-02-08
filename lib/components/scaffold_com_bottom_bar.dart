import 'package:checklist/screens/adicionarnotas/adicionar_notas.dart';
import 'package:checklist/screens/minhasnotas/minhas_notas.dart';
import 'package:flutter/material.dart';

const _appBarCor = Colors.transparent; 
const _logoutIcone = Icons.logout;
const _corIcone = Colors.black; 
const _alertaTitulo = "Logout";
const _alertaSubtitulo = "Deseja sair da sua conta?";
const _alertaTituloBotaoUm = "Cancelar";
const _alertaTituloBotaoDois = "Continuar";
const _alertaCorBotoes = Colors.black;
const _itemSelecionadoCor = Colors.black;
const _bottomIconeUm = Icons.list_alt_rounded;
const _bottomCorIconeUm = "Minhas Notas";
const _bottomIconeDois = Icons.add_to_photos_outlined;
const _bottomCorIconeDois = "Adicionar Nota";

class ScaffoldComBottomBar extends StatefulWidget {
  final int pagina;
  const ScaffoldComBottomBar({
    Key key,
    @required this.pagina,
  }) : super(key: key);

  @override
  _ScaffoldComBottomBarState createState() => _ScaffoldComBottomBarState();
}

class _ScaffoldComBottomBarState extends State<ScaffoldComBottomBar> {
  int _index;

  @override
  void initState() {
    super.initState();
    this._index = this.widget.pagina;
  }

  static List<Widget> _opcoesWidgets = [
    MinhasNotas(),
    AdicionarNotas(),
  ];

  void _ontap(int index) {
    setState(() {
      _index = index;
    });
  }

  AppBar _opcoesAppBar(Size size) {
    if (this._index == 0) {
      return AppBar(
        elevation: 0,
        backgroundColor: _appBarCor,
        leading: RotatedBox(
          quarterTurns: 2,
          child: IconButton(
            icon: Icon(_logoutIcone),
            color: _corIcone,
            iconSize: size.height * 0.0379404,
            onPressed: () {},
          ),
        ),
      );
    } else {
      return AppBar(
        elevation: 0,
        backgroundColor: _appBarCor,
      );
    }
  }

  Future<bool> _alerta(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(_alertaTitulo),
          content: Text(_alertaSubtitulo),
          actions: [
            TextButton(
              child: Text(
                _alertaTituloBotaoUm,
                style: TextStyle(
                  color: _alertaCorBotoes,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text(
                _alertaTituloBotaoDois,
                style: TextStyle(
                  color: _alertaCorBotoes,
                ),
              ),
              onPressed: () {},
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async {
        if (this._index == 0) {
          return _alerta(context);
        } else {
          _ontap(this._index - 1);
        }
        return false;
      },
      child: Scaffold(
        appBar: _opcoesAppBar(size),
        body: _opcoesWidgets.elementAt(_index),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _index,
          selectedItemColor: _itemSelecionadoCor,
          onTap: _ontap,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(_bottomIconeUm),
              label: _bottomCorIconeUm,
            ),
            BottomNavigationBarItem(
              icon: Icon(_bottomIconeDois),
              label: _bottomCorIconeDois,
            ),
          ],
        ),
      ),
    );
  }
}