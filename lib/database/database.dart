import 'dart:io';
import 'package:flutter_study/database/dao/plan_dao.dart';
import 'package:flutter_study/database/table/plan_table.dart';
import 'package:path/path.dart' as p;
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';

import '../enums/plan_type.dart';
import 'entity/plan_entity.dart';

part 'database.g.dart';

@DriftDatabase(tables: [Plans], daos: [PlanDao])
class Database extends _$Database {
  Database._internal() : super(_openConnection());
  static final Database _instance = Database._internal();

  factory Database() {
    return _instance;
  }

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (Migrator m) async {
        await m.createAll();
      },
      onUpgrade: (Migrator m, int from, int to) async {},
    );
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, '../databases/db.sqlite'));
    return NativeDatabase(file);
  });
}
