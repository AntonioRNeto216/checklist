import 'package:checklist/database/app_database.dart';
import 'package:checklist/models/modelo_nota.dart';
import 'package:sqflite/sqflite.dart';

class NotaDao {
  static const String tabela = "CREATE TABLE $_nomeTabela("
      "$_id INTEGER PRIMARY KEY, "
      "$_titulo TEXT, "
      "$_descricao TEXT)";

  static const String _nomeTabela = "notas";
  static const String _id = "id";
  static const String _titulo = "titulo";
  static const String _descricao = "descricao";

  Future<int> salvar(ModeloNota nota) async {
    final Database bancoDeDados = await getDatabase();
    Map<String, dynamic> mapaNota = _toMap(nota);
    return bancoDeDados.insert(_nomeTabela, mapaNota);
  }

  Future<void> remove(int id) async {
    final Database bancoDeDados = await getDatabase();
    await bancoDeDados.delete(
      _nomeTabela,
      where: "$_id = ?",
      whereArgs: [id],
    );
  }

  Future<List<ModeloNota>> getNotas() async {
    final Database bancoDeDados = await getDatabase();
    final List<Map<String, dynamic>> resultadoLista =
        await bancoDeDados.query(_nomeTabela);
    List<ModeloNota> notas = _toList(resultadoLista);
    return notas;
  }

  Map<String, dynamic> _toMap(ModeloNota nota) {
    final Map<String, dynamic> mapaNotas = Map();
    mapaNotas[_titulo] = nota.titulo;
    mapaNotas[_descricao] = nota.descricao;
    return mapaNotas;
  }

  List<ModeloNota> _toList(List<Map<String, dynamic>> resultadoLista) {
    final List<ModeloNota> notas = [];
    for (Map<String, dynamic> conteudo in resultadoLista) {
      final ModeloNota nota = ModeloNota(
        conteudo[_id],
        conteudo[_titulo],
        conteudo[_descricao],
      );
      notas.add(nota);
    }
    return notas;
  }
}
