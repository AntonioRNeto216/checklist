import 'package:checklist/database/dao/nota_dao.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> getDatabase() async {
  final String path = join(await getDatabasesPath(), 'checklist.db');
  return openDatabase(
    path,
    onCreate: (db, version) {
      db.execute(NotaDao.tabela);
    },
    version: 1,
    //onDowngrade: onDatabaseDowngradeDelete,
  );
}