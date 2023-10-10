import 'dart:developer';

import 'package:sqflite/sqflite.dart' as sqf;
import 'package:path/path.dart' as path;

import '../data/models/currency.dart';

class SqfDB {
  static sqf.Database? _db;

  Future<sqf.Database?> get db async {
    if (_db == null) {
      _db = await _initSqf();
      return _db;
    } else {
      return _db;
    }
  }

  Future<sqf.Database> _initSqf() async {
    String databaseSqfLite = await sqf.getDatabasesPath();
    String pathDatabase = path.join(databaseSqfLite, "currency_database.db");
    sqf.Database database =
        await sqf.openDatabase(pathDatabase, version: 1, onCreate: _onCreate);
    return database;
  }

  Future<void> _onCreate(sqf.Database db, int version) async {
    await db.execute(
      '''
          CREATE TABLE currency (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            symbol TEXT,
            name TEXT,
            symbol_native TEXT,
            decimal_digits INTEGER,
            rounding INTEGER,
            code TEXT,
            name_plural TEXT,
            imageUrl TEXT
          )
        ''',
    );

    log("done create database and table");
  }

  Future<int> insertCurrency(Datum datum) async {
    final db = await this.db;

    final existingCurrencies = await db!.query(
      'currency',
      where: 'code = ?',
      whereArgs: [datum.code],
    );
    if (existingCurrencies.isNotEmpty) {
      return await db.update(
        'currency',
        datum.toJson(),
        where: 'code = ?',
        whereArgs: [datum.code],
      );
    }else{
      return await db.insert('currency', datum.toJson());
    }
  }

  Future<List<Datum>> getAllCurrencies() async {
    final db = await this.db;
    final List<Map<String, dynamic>> maps = await db!.query('currency');
    return List.generate(
      maps.length,
      (i) {
        return Datum.fromJson(maps[i]);
      },
    );
  }
}
