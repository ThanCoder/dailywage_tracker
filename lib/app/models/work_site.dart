// ignore_for_file: public_member_api_docs, sort_constructors_first
/*
1. WorkSites Table (လုပ်ငန်းအမည်များ)
Column	Type	Description
id	INTEGER	Primary Key
name	TEXT	Site အမည်
location	TEXT	Optional (တည်နေရာ)
*/

import 'package:hive_flutter/adapters.dart';

part 'work_site.g.dart';

@HiveType(typeId: 0)
class WorkSite {
  static String dbName = 'work_site';
  @HiveField(0)
  String id;
  @HiveField(1)
  String name;
  @HiveField(2)
  double dailyWage;
  @HiveField(3)
  DateTime date;
  @HiveField(4)
  String location;
  @HiveField(5)
  String desc;

  WorkSite({
    required this.id,
    required this.name,
    required this.dailyWage,
    required this.date,
    this.location = '',
    this.desc = '',
  });

  Future<int> add() async {
    return await db.add(this);
  }

  Future<void> update() async {
    final index = db.values.toList().indexWhere((e) => e.id == id);
    if (index == -1) throw Exception('index: `$index` not found!');
    await db.put(index, this);
  }

  Future<void> delete() async {
    final index = db.values.toList().indexWhere((e) => e.id == id);
    if (index == -1) throw Exception('index: `$index` not found!');
    await db.deleteAt(index);
  }

  static Future<bool> isExists({required String siteName}) async {
    final res = db.values.where((e) => e.name.contains(siteName));
    if (res.isNotEmpty) return true;
    return false;
  }

  static List<WorkSite> getLatestDateList() {
    final list = db.values.toList();
    list.sort((a, b) {
      if (a.date.millisecondsSinceEpoch > b.date.millisecondsSinceEpoch) {
        return -1;
      }
      if (a.date.millisecondsSinceEpoch < b.date.millisecondsSinceEpoch) {
        return 1;
      }
      return 0;
    });
    return list;
  }

  static Box<WorkSite> get db => Hive.box<WorkSite>(dbName);

  @override
  String toString() {
    return name;
  }
}
