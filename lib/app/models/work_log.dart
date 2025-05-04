// ignore_for_file: public_member_api_docs, sort_constructors_first
/*
2. WorkLogs Table (နေ့စဉ်အလုပ်မှတ်တမ်း)
Column	Type	Description
id	INTEGER	Primary Key
date	TEXT	နေ့စွဲ (e.g. YYYY-MM-DD)
workSiteId	INTEGER	Foreign key to WorkSites.id
hoursWorked	REAL	အလုပ်လုပ်ချိန် (နာရီဖြင့်)
dailyWage	REAL	တစ်နေ့ လုပ်အားခ (manual/auto calc)
*/

import 'package:dailywage_tracker/app/extensions/work_log_extension.dart';
import 'package:hive_flutter/adapters.dart';

part 'work_log.g.dart';

@HiveType(typeId: 1)
class WorkLog {
  static String dbName = 'work_log';

  static Box<WorkLog> get db => Hive.box<WorkLog>(dbName);

  @HiveField(0)
  String id;
  @HiveField(1)
  String workSiteId;
  @HiveField(2)
  bool morningWorked;
  @HiveField(3)
  bool eveningWorked;
  @HiveField(4)
  double dailyWage;
  @HiveField(5)
  DateTime date;
  @HiveField(6)
  bool isPaid;
  @HiveField(7)
  DateTime? paidDate;

  WorkLog({
    required this.id,
    required this.workSiteId,
    required this.dailyWage,
    required this.date,
    this.morningWorked = false,
    this.eveningWorked = false,
    this.isPaid = false,
    this.paidDate,
  });

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

  static List<WorkLog> getLatestDateList() {
    final list = db.values.toList();
    list.sortDateDesc();
    return list;
  }

  static List<WorkLog> getCurrentMonthList(String siteId) {
    final currentDate = DateTime.now();
    var list = db.values
        .where((e) =>
            e.date.year == currentDate.year &&
            e.date.month == currentDate.month &&
            e.workSiteId == siteId)
        .toList();
    return list;
  }

  static double allWageSum(List<WorkLog> list) {
    double res = 0;
    for (var e in list) {
      res += e.getTotalWage;
    }
    return res;
  }

  static double allPaidWageSum(List<WorkLog> list, bool isPaid) {
    double res = 0;
    for (var e in list) {
      if (e.isPaid == isPaid) {
        res += e.getTotalWage;
      }
    }
    return res;
  }
}
