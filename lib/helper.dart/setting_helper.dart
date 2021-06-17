import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

final String contactTable = "contactTable";
final String idColunm = "idColumn";
final String nomeColunm = "nomeColunm";
final String emailColunm = "emailColunm";
final String telColunm = "telColunm";
final String imgColunm = "imgColunm";

class ContactHelper {
  static final ContactHelper _instance = ContactHelper.internal();

  factory ContactHelper() => _instance;

  ContactHelper.internal();

  Database _db;

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    } else {
      _db = await initDb();
      return _db;
    }
  }

  Future<Database> initDb() async {
    final databasesPath = await getDatabasesPath();
    final path = join(databasesPath, "contacts.db");

    return await openDatabase(path, version: 1,
        onCreate: (Database db, int newerVersion) async {
      await db.execute(
          "CREATE TABLE $contactTable ($idColunm INTEGER PRIMARY KEY, $nomeColunm TEXT, $emailColunm TEXT, $telColunm TEXT, $imgColunm TEXT)");
    });
  }

  Future<Contato> saveContato(Contato contato) async {
    Database dbContact = await db;
    contato.id = await dbContact.insert(contactTable, contato.toMap());
    return contato;
  }

  Future<Contato> getContato(int id) async {
    Database dbContact = await db;
    List<Map> maps = await dbContact.query(contactTable,
        columns: [idColunm, nomeColunm, emailColunm, telColunm, imgColunm],
        where: "$idColunm = ?",
        whereArgs: [id]);
    if (maps.length > 0) {
      return Contato.fromMap(maps.first);
    } else {
      return null;
    }
  }

  Future<int> deleteContato(int id) async {
    Database dbContact = await db;
    return await dbContact
        .delete(contactTable, where: "$idColunm = ?", whereArgs: [id]);
  }

  Future<int> updateContact(Contato contato) async {
    Database dbContact = await db;
    return await dbContact.update(contactTable, contato.toMap(),
        where: "$idColunm = ?", whereArgs: [contato.id]);
  }

  getAllContatos() async {
    Database dbContact = await db;
    List listMap = await dbContact.rawQuery("SELECT * FROM $contactTable");
    List<Contato> listContato = List();
    for (Map m in listMap) {
      listContato.add(Contato.fromMap(m));
    }
    return listContato;
  }

  Future<int> getNumber() async {
    Database dbContact = await db;
    return Sqflite.firstIntValue(
        await dbContact.rawQuery("SELECT COUNT(*) FROM $contactTable"));
  }

  Future close() async {
    Database dbContact = await db;
    dbContact.close();
  }
}

class Contato {
  int id;
  String nome;
  String email;
  String tel;
  String img;

  Contato.fromMap(Map map) {
    id = map[idColunm];
    nome = map[nomeColunm];
    email = map[emailColunm];
    tel = map[telColunm];
    img = map[imgColunm];
  }

  Map toMap() {
    Map<String, dynamic> map = {
      nomeColunm: nome,
      emailColunm: email,
      telColunm: tel,
      imgColunm: img,
    };
    if (id != null) {
      map[idColunm] = id;
    }
    return map;
  }

  @override
  String toString() {
    return "Contato(id: $id, nome: $nome, email: $email, tel: $tel, img: $img)";
  }
}