import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as path;

class MyOpenHelper {
  //static const String userTableCreate='CREATE TABLE IF NOT EXISTS usuarios (id INTEGER PRIMARY KEY AUTOINCREMENT,email TEXT,password TEXT)';

  static const String userTableCreate =
      'CREATE TABLE usuarios(id INTEGER PRIMARY KEY AUTOINCREMENT, nombre TEXT, apellido TEXT, telefono TEXT, direccion TEXT, email TEXT, password TEXT)';
  
  static const String dogsTableCreate =
      'CREATE TABLE dogs(id INTEGER PRIMARY KEY AUTOINCREMENT, nombre TEXT, edad TEXT, raza TEXT, tamaño TEXT, genero TEXT, vac1 TEXT, vac2 TEXT, vac3 TEXT, vac4 TEXT, imagen_path TEXT, usuario_id INTEGER, FOREIGN KEY(usuario_id) REFERENCES usuarios(id))';
  static const String solicitudTableCreate =
      'CREATE TABLE solicitudes(id INTEGER PRIMARY KEY AUTOINCREMENT, nombres TEXT, telefono TEXT, interes TEXT, vivienda TEXT, espacio TEXT, tiempo TEXT, usuario_id INTEGER, FOREIGN KEY(usuario_id) REFERENCES usuarios(id))';

  static const String dbName = 'datosPractica5.db';
  static const int dbVersion = 1;

  static Future<Database> initDatabase() async {
    final databasePath = await getDatabasesPath();
    final pathToDatabase = path.join(databasePath, dbName);

    return openDatabase(
      pathToDatabase,
      version: dbVersion,
      onCreate: (db, version) async {
        await db.execute(userTableCreate);
        await db.execute(dogsTableCreate);
        await db.execute(solicitudTableCreate);
      },
    );
  }
}
