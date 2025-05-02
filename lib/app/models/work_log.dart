/*
2. WorkLogs Table (နေ့စဉ်အလုပ်မှတ်တမ်း)
Column	Type	Description
id	INTEGER	Primary Key
date	TEXT	နေ့စွဲ (e.g. YYYY-MM-DD)
workSiteId	INTEGER	Foreign key to WorkSites.id
hoursWorked	REAL	အလုပ်လုပ်ချိန် (နာရီဖြင့်)
dailyWage	REAL	တစ်နေ့ လုပ်အားခ (manual/auto calc)
*/

import 'package:isar/isar.dart';

import '../services/isar_services.dart';

part 'work_log.g.dart';

@collection
class WorkLog {
  Id id = Isar.autoIncrement;

  late int workSiteId;

  bool morningWorked = false;

  bool eveningWorked = false;

  late double dailyWage;

  late DateTime date;

  bool isPaid = false;
  DateTime? paidDate;

  double get getTotalWage {
    if (!morningWorked && !eveningWorked) {
      return 0;
    }
    if (!morningWorked || !eveningWorked) {
      return dailyWage / 2;
    }
    return dailyWage;
  }

  Future<int> add() async {
    return IsarServices.isar.writeTxn<int>(() async {
      return await coll.put(this);
    });
  }

  Future<int> update() async {
    return IsarServices.isar.writeTxn<int>(() async {
      return await coll.put(this);
    });
  }

  Future<bool> delete() async {
    return IsarServices.isar.writeTxn<bool>(() async {
      return await coll.delete(id);
    });
  }

  static IsarCollection<WorkLog> get coll => IsarServices.isar.workLogs;
}
