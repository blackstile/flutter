import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> getDatabase(sqlCreateTable) async {
  final String path = join(await getDatabasesPath(), 'bytebank.db');
  return openDatabase(
    path,
    onCreate: (db, version) => db.execute(sqlCreateTable),
    version: 1,
    // onDowngrade: onDatabaseDowngradeDelete,
  );
}
