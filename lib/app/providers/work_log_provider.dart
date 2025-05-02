import 'package:dailywage_tracker/app/models/work_log.dart';
import 'package:dailywage_tracker/app/services/isar_services.dart';
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';

class WorkLogProvider with ChangeNotifier {
  Future<int> add(WorkLog workLog) async {
    return IsarServices.isar.writeTxn<int>(() async {
      return await IsarServices.isar.workLogs.put(workLog);
    });
  }

  Future<List<WorkLog>> getList() async {
    return await IsarServices.isar.workLogs.where().findAll();
  }
}
