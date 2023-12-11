import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:test_serasi_raya/application/config/app_constant.dart';
import 'package:test_serasi_raya/data/local/contracts/cart_contract.dart';

class BaseProvider {
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

    _database = await onInitDB();
    return _database!;
  }

  onInitDB() async {
    Database? dbConnection;
    var path = await getDatabasesPath();
    var dbPath = join(path, App.databaseName);
    dbConnection = await openDatabase(
      dbPath,
      version: 1,
      onCreate: (db, version) async {
        await db.execute(
          _buildQuery(
            CartContract.tableName,
            CartContract.columnName,
          ),
        );
      },
    );

    return dbConnection;
  }

  String _buildQuery(String tableName, Map<String, dynamic> columnName) {
    String query = "CREATE TABLE IF NOT EXISTS ";
    query += tableName;
    query += "(";
    columnName.forEach((column, field) {
      query += "$column $field,";
    });
    query = query.substring(0, query.length - 1);
    query += " )";

    return query;
  }
}
