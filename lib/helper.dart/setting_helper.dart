/* import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

final String emoteTable = "emoteTable";
final String idColunm = "idColumn";
final String _medColunm = "_medColunm";
final String _ansiColunm = "_ansiColunm";
final String _tristeColunm = "_tristeColunm";
final String _raivaColunm = "_raivaColunm";
final String _stressColunm = "_stresColunm";

class EmoteHelper {
  static final EmoteHelper _instance = EmoteHelper.internal();

  factory EmoteHelper() => _instance;

  EmoteHelper.internal();

  Database? _db;

  Future<Database?> get db async {
    if (_db != null) {
      return _db;
    } else {
      _db = await initDb();
      return _db;
    }
  }

  Future<Database> initDb() async {
    final databasesPath = await getDatabasesPath();
    final path = join(databasesPath, "emotes.db");

    return await openDatabase(path, version: 1,
        onCreate: (Database db, int newerVersion) async {
      await db.execute(
          "CREATE TABLE $emoteTable ($idColunm INTEGER PRIMARY KEY, $_medColunm TEXT, $_ansiColunm TEXT, $_tristeColunm TEXT, $_raivaColunm TEXT)");
    });
  }

  Future<Emote> saveEmote(Emote Emote) async {
    Database dbEmote = await (db as FutureOr<Database>);
    Emote.id =
        await dbEmote.insert(emoteTable, Emote.toMap() as Map<String, Object?>);
    return Emote;
  }

  Future<Emote?> getEmote(int id) async {
    Database dbemote = await (db as FutureOr<Database>);
    List<Map> maps = await dbemote.query(emoteTable,
        columns: [
          idColunm,
          _medColunm,
          _ansiColunm,
          _tristeColunm,
          _raivaColunm,
          _stressColunm
        ],
        where: "$idColunm = ?",
        whereArgs: [id]);
    if (maps.length > 0) {
      return Emote.fromMap(maps.first);
    } else {
      return null;
    }
  }

  Future<int> deleteEmote(int id) async {
    Database dbemote = await (db as FutureOr<Database>);
    return await dbemote
        .delete(emoteTable, where: "$idColunm = ?", whereArgs: [id]);
  }

  Future<int> updateemote(Emote Emote) async {
    Database dbemote = await (db as FutureOr<Database>);
    return await dbemote.update(
        emoteTable, Emote.toMap() as Map<String, Object?>,
        where: "$idColunm = ?", whereArgs: [Emote.id]);
  }

  getAllEmotes() async {
    Database dbemote = await (db as FutureOr<Database>);
    List listMap = await dbemote.rawQuery("SELECT * FROM $emoteTable");
    List<Emote> listEmote = [];
    for (Map m in listMap as Iterable<Map<dynamic, dynamic>>) {
      listEmote.add(Emote.fromMap(m));
    }
    return listEmote;
  }

  Future<int?> getNumber() async {
    Database dbemote = await (db as FutureOr<Database>);
    return Sqflite.firstIntValue(
        await dbemote.rawQuery("SELECT COUNT(*) FROM $emoteTable"));
  }

  Future close() async {
    Database dbemote = await (db as FutureOr<Database>);
    dbemote.close();
  }
}

class Emote {
  int? id;
  bool? _med = false;
  bool? _ansi = false;
  bool? _triste = false;
  bool? _raiva = false;
  bool? _stress = false;

  Emote.fromMap(Map map) {
    id = map[idColunm];
    _med = map[_medColunm];
    _ansi = map[_ansiColunm];
    _triste = map[_tristeColunm];
    _raiva = map[_raivaColunm];
    _stress = map[_stressColunm];
  }

  Map toMap() {
    Map<String, dynamic> map = {
      _medColunm: _med,
      _ansiColunm: _ansi,
      _tristeColunm: _triste,
      _raivaColunm: _raiva,
      _stressColunm: _stress
    };
    if (id != null) {
      map[idColunm] = id;
    }
    return map;
  }

  @override
  String toString() {
    return "Emote(id: $id, _med: $_med, _ansi: $_ansi, _triste: $_triste, _raiva: $_raiva)";
  }
}
 */