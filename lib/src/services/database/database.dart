import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../../models/register_model.dart';

Future<Database> createDatabase() {
  //db_app
  return getDatabasesPath().then((dbPath) {
    final String path = join(dbPath, 'database_off.db');
    return openDatabase(
      path,
      onCreate: (db, version) async {
        db.execute("PRAGMA foreign_keys = ON");
        db.execute('CREATE TABLE register('
            'id INTEGER PRIMARY KEY, '
            'code TEXT, '
            'status TEXT)');
      },
      version: 1,
    );
  });
}

/* CRUD - REGISTER */

Future<int> create(Register register) async {
  return await createDatabase().then((db) {
    final Map<String, dynamic> map = Map();
    map['code'] = register.code;
    map['status'] = register.status;
    return db.insert('register', map);
  });
}

Future<List<Register>> read() {
  return createDatabase().then((db) {
    return db.query('register').then((maps) {
      final List<Register> registers = [];
      for (Map<String, dynamic> map in maps) {
        final Register register = Register(
          map['id'] ?? '',
          map['code'] ?? '',
          map['status'] ?? '',
        );
        registers.add(register);
      }
      return registers;
    });
  });
}
