import 'package:sqflite/sqflite.dart';
import 'package:crud_app_2/modelos/notas.dart';
import 'package:path/path.dart';

class Operaciones{
  static Future<Database> _openDB() async { //Abrir la base de datos
    try {
      return await openDatabase(
        join(await getDatabasesPath(), 'notas.db'),
        onCreate: (db, version) {
          return db.execute(
            "CREATE TABLE IF NOT EXISTS notas(id INTEGER PRIMARY KEY, titulo TEXT, descripcion TEXT)",
          );
        },
        version: 1,
      );
    } catch (e) {
      print('Error al abrir la base de datos: $e');
      throw Exception('Error al abrir la base de datos');
    }
  }

  static Future<void> insertarOperacion(Nota nota) async { //Insertar una nota
    Database db = await _openDB();
    db.insert('notas', nota.toMap());
  }

   static Future<void> eliminarOperacion(Nota nota) async { //Insertar una nota
    Database db = await _openDB();
    db.delete('notas', where: 'id = ?', whereArgs: [nota.id]);
  }

 static Future<void> actualizarOperacion(Nota nota) async { //Insertar una nota
    Database db = await _openDB();
    db.update('notas',nota.toMap(), where: 'id = ?', whereArgs: [nota.id]);
  }  

  static Future<List<Nota>> obtenerNotas() async { //Obtener todas las notas
    Database db = await _openDB();
    final List<Map<String, dynamic>> notasMaps = await db.query('notas');

    for(var n in notasMaps){ //Recorrer las notas x el debug
      print("____" + n['titulo'].toString());
      print("____" + n['descripcion'].toString());
    }

    return List.generate(notasMaps.length, (i) { //Generar una lista de notas
      return Nota(
        id: notasMaps[i]['id'],
        titulo: notasMaps[i]['titulo'],
        descripcion: notasMaps[i]['descripcion'],
      );
    });
  }
}