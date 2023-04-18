// ignore_for_file: depend_on_referenced_packages

import 'dart:io';

import 'package:crud_pessoas/models/pessoa.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DbConnection {
  static final DbConnection instance = DbConnection._init();

  static Database? _database;

  DbConnection._init();
  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('Itens.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    const textType = 'TEXT NOT NULL';
    const numberType = 'INTEGER NOT NULL';

    await db.execute('''CREATE TABLE Pessoas (
      id $idType,
      nome $textType,
      idade $numberType,
      endereco $textType,
      email $textType
    )''');
  }

  Future<Pessoa> insertPessoa(Pessoa pessoa) async {
    final db = await instance.database;
    final id = await db.insert('Pessoas', pessoa.toMap());
    return pessoa.copyWith(id: id);
  }

  Future<Pessoa> readPessoa(int id) async {
    final db = await instance.database;
    final maps = await db.query(
      'Pessoas',
      columns: PessoaFields().values,
      where: 'id = ?',
      whereArgs: [id],
    );
    if (maps.isNotEmpty) {
      return Pessoa.fromMap(maps.first);
    } else {
      throw Exception('Id $id não encontrado');
    }
  }

  Future<List<Pessoa>> readAllPessoas() async {
    final db = await instance.database;
    final results = await db.query('Pessoas', orderBy: 'id ASC');

    return results.map((json) => Pessoa.fromMap(json)).toList();
  }

  Future<int> updatePessoa(Pessoa pessoa) async {
    final db = await instance.database;

    return db.update('Pessoas', pessoa.toMap(),
        where: 'id = ? ', whereArgs: [pessoa.id]);
  }

  Future<int> deletePessoa(int id) async {
    final db = await instance.database;

    return db.delete('Pessoas', where: 'id = ? ', whereArgs: [id]);
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}
