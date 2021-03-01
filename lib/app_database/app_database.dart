import 'package:moor/moor.dart';
import 'package:moor_flutter/moor_flutter.dart';

// assuming that your file is called filename.dart. This will give an error at first,
// but it's needed for moor to know about the generated code
part 'app_database.g.dart';

/*LazyDatabase _openConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return VmDatabase(file, logStatements: true);
  });
}*/

class Items extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get descricao => text().withLength(min: 1, max: 30)();
  RealColumn get valor => real().withDefault(Constant(0))();
  IntColumn get quantidade => integer().withDefault(Constant(0))();
}

@UseMoor(tables: [Items])
class AppDatabase extends _$AppDatabase {
  // we tell the database where to store the data with this constructor
  AppDatabase()
      // Specify the location of the database file
      : super((FlutterQueryExecutor.inDatabaseFolder(
          path: 'db.sqlite',
          // Good for debugging - prints SQL in the console
          logStatements: true,
        )));

  // you should bump this number whenever you change or add a table definition. Migrations
  // are covered later in this readme.
  @override
  int get schemaVersion => 10;

  //Querys da tabela 'Item'
  Future<List<Item>> getAllItems() => select(items).get();
  Future insertItem(Item item) => into(items).insert(item);
  Future deleteItem(Item item) => delete(items).delete(item);
  Future updateItem(Item item) => update(items).replace(item);
}
