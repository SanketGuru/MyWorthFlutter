//https://pub.dartlang.org/packages/sqflite
//https://applandeo.com/blog/sqflite-flutter-database/
import 'dart:async';

import 'package:sqflite/sqflite.dart';

class Folio {
  int uId = 0;
  String name = '';
  String desc = '';

  Folio(this.uId, this.name, this.desc);

  @override
  String toString() => 'Folio{uId: $uId, name: $name, desc: $desc}';

  Map<String, dynamic> toMap() => <String, dynamic>{
        FolioProvider.Id: uId,
        FolioProvider.Name: name,
        FolioProvider.Desc: desc
      };

//    if (id != null) {
//      map[columnId] = id;
//    }

  Folio.fromMap(Map<String, dynamic> map) {
    uId = map[FolioProvider.Id];
    name = map[FolioProvider.Name];
    desc = map[FolioProvider.Desc];
  }
}

class FolioProvider {
  static const Table = 'Folio';
  static const Id = '_id';
  static const Name = 'Name';
  static const Desc = 'Desc';
  Database db;
  static const CREATE = '''CREATE TABLE  IF NOT EXISTS $Table (
      $Id INTEGER PRIMARY KEY AUTOINCREMENT,
       $Name TEXT  NOT NULL,
        $Desc TEXT
        )''';

  Future open(String path) async {
    db = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      print(CREATE);
      await db.execute(CREATE).then((valuue) {
        print(CREATE);
      });
    });
  }

  Future<Folio> insert(Folio todo) async {
    print('Db is ${db == null ? 'null' : 'nonulls'}');
    todo.uId = await db.insert(Table, todo.toMap());
    return todo;
  }

  Future<Folio> getFolio(int id) async {
    List<Map> maps = await db.query(Table,
        columns: [Id, Name, Desc], where: '$Id = ?', whereArgs: [id]);
    if (maps.length > 0) {
      return Folio.fromMap(maps.first);
    }
    return null;
  }

  Future<List<Folio>> getAllFolios() async {
    List<Map> maps = await db.query(
      Table,
      columns: [Id, Name, Desc],
    );
    if (maps.length > 0) {
      return maps.map((folio) => Folio.fromMap(folio)).toList();
    }
    return null;
  }

  Future<int> delete(int id) async {
    return await db.delete(Table, where: '$Id = ?', whereArgs: [id]);
  }

  Future<int> update(Folio todo) async {
    return await db
        .update(Table, todo.toMap(), where: '$Id = ?', whereArgs: [todo.uId]);
  }

  Future close() async => db.close();
}

abstract class FolioRepo {
  Future<List<Folio>> getFolio();

  Folio getFolioById(int uId);

  Future<Folio> addFolioById(Folio folio);

  void updateFolioById(Folio folio);

  void deleteFolioById(int uId);
}

class FolioRepoImpl implements FolioRepo {
  FolioProvider db = new FolioProvider();

  @override
  Future<Folio> addFolioById(Folio folio) {
    db.open('pathNet.db');
    return db.insert(folio);
  }

  @override
  void deleteFolioById(int uId) {
    // TODO: implement deleteFolioById
  }

  @override
  Future<List<Folio>> getFolio() => db.getAllFolios();
  Future openDn() => db.open('pathNet.db');

  @override
  Folio getFolioById(int uId) {
    // TODO: implement getFolioById
    return null;
  }

  @override
  void updateFolioById(Folio folio) {
    // TODO: implement updateFolioById
  }
}
