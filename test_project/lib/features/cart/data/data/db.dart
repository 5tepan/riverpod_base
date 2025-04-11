import 'package:drift/drift.dart';

part 'db.g.dart';

class CartItems extends Table {
  TextColumn get id => text()(); // product id
  TextColumn get name => text()();
  TextColumn get image => text()();
  RealColumn get price => real()();
  IntColumn get quantity => integer()();

  @override
  Set<Column> get primaryKey => {id};
}

@DriftDatabase(tables: [CartItems])
class AppDatabase extends _$AppDatabase {
  AppDatabase(QueryExecutor e) : super(e);

  @override
  int get schemaVersion => 1;
}
