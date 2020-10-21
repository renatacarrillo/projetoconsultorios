import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;

//classe responsável por acessar o banco de dados
class DbUtil {
  //comando de DDL - banco relacional = sqlite
  static Future<sql.Database> database() async {
    final dbPath = await sql.getDatabasesPath();
    return sql.openDatabase(
      path.join(dbPath, 'places.db'),
      //método onCreate é sempre chamado quando se roda o db pela primeira vez
      onCreate: (db, version) {
        return db.execute(
          //salva apenas o caminho da imagem
          'CREATE TABLE places (id TEXT PRIMARY KEY, title TEXT, image TEXT, latitude REAL, longitude REAL, address TEXT)',
        );
      },
      version: 1,
    );
  }

  static Future<void> insert(String table, Map<String, Object> data) async {
    final db = await DbUtil.database();
    await db.insert(
      table,
      data,
      //função ConflictAlgorithm = para conflito no cadastro de dados no db
      conflictAlgorithm: sql.ConflictAlgorithm.replace,
    );
  }

  static Future<List<Map<String, dynamic>>> getData(String table) async {
    final db = await DbUtil.database();
    return db.query(table);
  }
}
