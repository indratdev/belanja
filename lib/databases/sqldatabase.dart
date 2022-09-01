import 'package:belanja/models/supermarket_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SqlDatabase {
  static final SqlDatabase instance = SqlDatabase._init();
  static Database? _database;
  static const String _dbName = 'dbshop.db';

  final String tableSupermarket = 'm_supermarket';
  final String tableLocation = 'm_location';
  final String tableTransaction = 'm_transaction';

  SqlDatabase._init();

  Future<Database?> get database async {
    if (_database != null) return _database;

    _database = await _initDB(_dbName);
    return _database;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    print('lokasi db : $dbPath');
    final path = join(dbPath, filePath);

    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
    );
  }

  // create table category
  Future _createDB(Database db, int version) async {
    // create table transaction
    await db.execute('''
    CREATE TABLE $tableTransaction    (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      idSupermarket INTEGER,
      transactionDate TEXT NULL,
      itemName TEXT NULL,
      description TEXT NULL,
      amount REAL
      )
      ''');

    await db.execute('''
    CREATE TABLE $tableSupermarket    (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name TEXT NULL
      )
      ''');

    await db.execute('''
    CREATE TABLE $tableLocation    (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      id_supermarket INTEGER,
      locationName TEXT NULL
      )
      ''');

    // insert default data
  }

  // Future _configureDB(Database db) async {
  //   var createTime = DateTime.now().toString();
  //   await db.rawInsert(
  //       ''' INSERT INTO $tableLocation (isIncome, name, iconName,isActive, isDefault, createdTime, modifieldTime) VALUES (1, 'GAJI', 'sackDollar', 1, 1, '$createTime', '');       ''');
  //   await db.rawInsert(
  //       ''' INSERT INTO $tableLocation (isIncome, name, iconName,isActive, isDefault, createdTime, modifieldTime) VALUES (1, 'TABUNGAN', 'piggyBank', 1, 1, '$createTime', '');       ''');
  //   await db.rawInsert(
  //       ''' INSERT INTO $tableLocation (isIncome, name, iconName,isActive, isDefault, createdTime, modifieldTime) VALUES (1, 'DEPOSITO', 'buildingColumns', 1, 1, '$createTime', '');       ''');
  //   await db.rawInsert(
  //       ''' INSERT INTO $tableLocation (isIncome, name, iconName,isActive, isDefault, createdTime, modifieldTime) VALUES (1, 'PENDAPATAN LAINNYA', 'boxesStacked', 1, 1, '$createTime', '');       ''');
  //   await db.rawInsert(
  //       ''' INSERT INTO $tableLocation (isIncome, name, iconName,isActive, isDefault, createdTime, modifieldTime) VALUES (0, 'MAKANAN & MINUMAN', 'champagneGlasses', 1, 1, '$createTime', '');       ''');
  //   await db.rawInsert(
  //       ''' INSERT INTO $tableLocation (isIncome, name, iconName,isActive, isDefault, createdTime, modifieldTime) VALUES (0, 'TRANSPORTASI', 'car', 1, 1, '$createTime', '');       ''');
  //   await db.rawInsert(
  //       ''' INSERT INTO $tableLocation (isIncome, name, iconName,isActive, isDefault, createdTime, modifieldTime) VALUES (0, 'RENTAL', 'cars', 1, 1, '$createTime', '');       ''');
  //   await db.rawInsert(
  //       ''' INSERT INTO $tableLocation (isIncome, name, iconName,isActive, isDefault, createdTime, modifieldTime) VALUES (0, 'PEMBAYARAN', 'fileInvoiceDollar', 1, 1, '$createTime', '');       ''');
  //   await db.rawInsert(
  //       ''' INSERT INTO $tableLocation (isIncome, name, iconName,isActive, isDefault, createdTime, modifieldTime) VALUES (0, 'ASURANSI', 'handHoldingHeart', 1, 1, '$createTime', '');       ''');
  //   await db.rawInsert(
  //       ''' INSERT INTO $tableLocation (isIncome, name, iconName,isActive, isDefault, createdTime, modifieldTime) VALUES (0, 'PEMELIHARAAN KENDARAAN', 'screwdriverWrench', 1, 1, '$createTime', '');       ''');
  //   await db.rawInsert(
  //       ''' INSERT INTO $tableLocation (isIncome, name, iconName,isActive, isDefault, createdTime, modifieldTime) VALUES (0, 'PENGELUARAN LAINNYA', 'boxesStacked', 1, 1, '$createTime', '');       ''');
  //   await db.rawInsert(
  //       ''' INSERT INTO $tableLocation (isIncome, name, iconName,isActive, isDefault, createdTime, modifieldTime) VALUES (0, 'FITNESS', 'dumbbell', 1, 1, '$createTime', '');       ''');
  //   await db.rawInsert(
  //       ''' INSERT INTO $tableLocation (isIncome, name, iconName,isActive, isDefault, createdTime, modifieldTime) VALUES (0, 'MAKEUP', 'heart', 1, 1, '$createTime', '');       ''');
  //   await db.rawInsert(
  //       ''' INSERT INTO $tableLocation (isIncome, name, iconName,isActive, isDefault, createdTime, modifieldTime) VALUES (0, 'HADIAH', 'gifts', 1, 1, '$createTime', '');       ''');
  //   await db.rawInsert(
  //       ''' INSERT INTO $tableLocation (isIncome, name, iconName,isActive, isDefault, createdTime, modifieldTime) VALUES (0, 'REKREASI', 'umbrellaBeach', 1, 1, '$createTime', '');       ''');
  // }

  Future closeDB() async {
    final db = await instance.database;

    if (db != null) {
      db.close();
    }
  }

  // insert supermarket
  // ,${category.iconName}
  Future<int> insertNote(String supermarketName) async {
    final db = await instance.database;
    int result = 0;
    if (db != null) {
      result = await db.rawInsert('''
      INSERT INTO $tableSupermarket (name)
      VALUES
      (
        '$supermarketName'
        );
      ''');
    }
    return result;
  }

  // CHECK SUPERMARKET IS EXIST ?

  Future<int> isExistSupermarket(String value) async {
    final db = await instance.database;
    var result;
    if (db != null) {
      List<Map> maps = await db.rawQuery(
          ''' select * from $tableSupermarket where name = '$value' ;  ''');
      if (maps.length > 0) {
        result = 1;
      } else {
        result = 0;
      }
    }
    return result;
  }

  Future<List<SupermarketModel>> readAllSupermarket() async {
    final db = await instance.database;
    var result = [];
    if (db != null) {
      result = await db.rawQuery('''select id, name from $tableSupermarket ''');
    } else {
      throw Exception('Error on DB');
    }

    return result.map((e) => SupermarketModel.fromJson(e)).toList();
  }

  //read all
  // Future<List<CategoryModel>> readCategory(int isIncome) async {
  //   final db = await instance.database;
  //   // const orderBy = 'createdTime ASC';

  //   if (db != null) {
  //     // final result = await db.query(tableNotes, orderBy: orderBy);
  //     // final result = await db.query(tableLocation);
  //     final result = (isIncome == 1)
  //         ? await db.rawQuery(
  //             ''' select isIncome, name, iconName,isActive, isDefault, createdTime, modifieldTime from $tableLocation where isIncome = 1; ''')
  //         : await db.rawQuery(
  //             ''' select isIncome, name, iconName,isActive, isDefault, createdTime, modifieldTime from $tableLocation where isIncome = 0; ''');
  //     // print('===> $result');
  //     return result.map((e) => CategoryModel.fromJson(e)).toList();
  //   } else {
  //     throw Exception('DB is NULL');
  //   }
  // }

  // read note by id
  // Future<NotesModel?> readNoteByID(int id) async {
  //   final db = await instance.database;

  //   if (db != null) {
  //     final result =
  //         await db.query(tableNotes, where: 'id = ?', whereArgs: [id]);

  //     if (result.isNotEmpty) {
  //       return NotesModel.fromJson(result.first);
  //     }
  //     return null;
  //   } else {
  //     throw Exception('DB is NULL');
  //   }
  // }

  // delete data table note
  // Future<int> deleteTableNotes() async {
  //   final db = await instance.database;

  //   if (db != null) {
  //     return await db.rawDelete(''' DELETE FROM $tableLocation''');
  //   }
  //   return 0;
  // }

  // Future<int> updateNote(int id, NotesModel note) async {
  //   final db = await instance.database;
  //   int result = 0;

  //   if (db != null) {
  //     return result = await db.rawUpdate('''UPDATE $tableNotes
  //         SET
  //         title = ?
  //         , content = ?
  //         , noteColor = ?
  //         , createdTime = ?
  //         , modifieldTime = ?
  //         WHERE id = ?''', [
  //       note.title,
  //       note.content,
  //       note.noteColor,
  //       '${note.createdTime}',
  //       '${note.modifieldTime}',
  //       '$id'
  //     ]);
  //     // return result = await db
  //     //     .update(tableNotes, note.toJson(), where: 'id = ?', whereArgs: [id]);
  //   }

  //   return result;
  // }

  // delete note by id
  // Future<void> deleteNoteByID(int id) async {
  //   final db = await instance.database;

  //   if (db != null) {
  //     // ('DELETE FROM Test WHERE name = ?', ['another name']);
  //     await db.rawDelete('''
  //     DELETE FROM $tableNotes WHERE id = ? ''', [id]);
  //     // return result;
  //   }
  // }

  Future<int> deleteDataSupermarketByID(int value) async {
    final db = await instance.database;
    var result;
    if (db != null) {
      List<Map> maps = await db
          .rawQuery(''' delete  from $tableSupermarket where id = '$value';  
              delete from $tableLocation where id_supermarket = '$value'
          ''');

      print(maps);
      if (maps.length > 0) {
        result = 1;
      } else {
        result = 0;
      }
    }
    return result;
  }

  Future<int> isExistLocation(int idSupermarket, String locationName) async {
    final db = await instance.database;
    var result;
    if (db != null) {
      List<Map> maps = await db.rawQuery(
          ''' select * from $tableLocation where id_supermarket = $idSupermarket and locationName = '$locationName';  ''');

      print(maps);
      if (maps.length > 0) {
        result = 1;
      } else {
        result = 0;
      }
    }
    return result;
  }

  // insert location -----------------------------------------------------------------
  Future<int> insertLocation(int idSupermarket, String locationName) async {
    final db = await instance.database;
    int result = 0;
    if (db != null) {
      result = await db.rawInsert('''
      INSERT INTO $tableLocation (id_supermarket, locationName)
      VALUES
      (
        $idSupermarket,
        '$locationName'
        );
      ''');
    }
    return result;
  }

  Future<List<SupermarketLocationModel>> readLocationByIDSuper(
      int idSupermarket) async {
    final db = await instance.database;
    var result = [];
    if (db != null) {
      result = await db.rawQuery(
          '''select id_supermarket, locationName from $tableLocation where id_supermarket = $idSupermarket ;   ''');

      print("result 2 : $result");
    } else {
      throw Exception('Error on DB');
    }

    return result.map((e) => SupermarketLocationModel.fromJson(e)).toList();
  }

  // end location ---------------------------------------------------------------------
}
