/*
1. WorkSites Table (လုပ်ငန်းအမည်များ)
Column	Type	Description
id	INTEGER	Primary Key
name	TEXT	Site အမည်
location	TEXT	Optional (တည်နေရာ)
*/

import 'package:isar/isar.dart';

import '../services/isar_services.dart';

part 'work_site.g.dart';

@collection
class WorkSite {
  static String dbName = 'work_site';
  Id id = Isar.autoIncrement;
  late String name;
  late double dailyWage;
  late DateTime date;

  String location = '';
  String desc = '';

  static IsarCollection<WorkSite> get coll => IsarServices.isar.workSites;
}
