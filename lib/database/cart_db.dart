import 'package:dogkart/model/dog_mage.dart';
import 'package:dogkart/service/database/database_service.dart';
import 'package:sqflite/sqflite.dart';

class CartDb {
  String tableName = "cart";
  Future<void> createTable(Database database) async {
    String sql =
        """ CREATE TABLE IF NOT EXISTS $tableName("id" INTEGER NOT NULL,"price" INTEGER NOT NULL,"url" TEXT NOT NULL,PRIMARY KEY("id" AUTOINCREMENT) ) """;
    await database.execute(sql);
  }

  Future<int> insertRow(String imageUrl, int price) async {
    String sql = '''INSERT INTO $tableName(price,url) VALUES(?,?)''';
    Database database = await DatabaseService().database;
    return await database.rawInsert(sql, [price, imageUrl]);
  }

  // A method that retrieves all the dogs from the dogs table.
  Future<List<DogImage>> getAllItems() async {
    // Get a reference to the database.
    final db = await DatabaseService().database;

    // Query the table for all The Dogs.
    final List<Map<String, dynamic>> maps = await db.query(tableName);

    // Convert the List<Map<String, dynamic> into a List<Dog>.
    return List.generate(maps.length, (i) {
      return DogImage(
        price: maps[i]['price'] as int,
        id: maps[i]['id'] as int,
        url: maps[i]['url'] as String,
      );
    });
  }

  Future<void> deleteDog(int id) async {
    final db = await DatabaseService().database;

    await db.delete(
      'cart',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
