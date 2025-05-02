import 'package:dailywage_tracker/app/models/work_site.dart';
import 'package:dailywage_tracker/app/services/isar_services.dart';
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';

class WorkSiteProvider with ChangeNotifier {
  List<WorkSite> list = [];

  Future<bool> isExistsName(String name) async {
    final res = await IsarServices.isar.workSites
        .filter()
        .nameEqualTo(name)
        .findFirst();
    if (res != null) return true;
    return false;
  }

  Future<int> add(WorkSite site) async {
    return await IsarServices.isar.writeTxn<int>(() async {
      return await IsarServices.isar.workSites.put(site);
    });
    // return -1;
  }
}
