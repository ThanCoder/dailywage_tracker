import 'package:flutter/material.dart';

import '../work_log_list_item.dart';
import '../../models/work_log.dart';

class WorkLogComponents {
  // အားလုံးပေါင်း
  static Widget getAllMonthsCalculation(
    List<WorkLog> list, {
    String title = 'အားလုံးပေါင်း',
  }) {
    return SliverToBoxAdapter(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 5,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text('လုပ်အားခ: ${WorkLog.allWageSum(list)} ks'),
              Text(
                  'ရရှိပြီး ငွေပမာဏ: ${WorkLog.allPaidWageSum(list, true)} ks'),
              Text(
                  'ရရှိမယ့် ကျန်ငွေပမာဏ: ${WorkLog.allPaidWageSum(list, false)} ks'),
              Text('အလုပ်လုပ်ခဲ့တဲ့ ရက်စုစုပေါင်း: ${list.length} ရက်'),
              // const Divider(),
            ],
          ),
        ),
      ),
    );
  }

  // လ တစ်ခုချင်းစီ
  static List<Widget> getGroupedMonthList(
    List<WorkLog> list, {
    void Function(WorkLog)? onClicked,
  }) {
    Map<String, List<WorkLog>> groupedByMonthList = {};

    for (var log in list) {
      var key =
          'Month: ${log.date.year}-${log.date.month.toString().padLeft(2, '0')}';
      if (log.date.month == DateTime.now().month) {
        key = 'ယခုလ';
      }
      groupedByMonthList.putIfAbsent(key, () => []).add(log);
    }

    List<Widget> slivers = [];
    groupedByMonthList.forEach(
      (month, list) {
        //
        slivers.add(
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                month, // eg. 2025-05
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        );

        slivers.add(
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => WorkLogListItem(
                workLog: list[index],
                onClicked: (workLog) {
                  if (onClicked != null) {
                    onClicked(workLog);
                  }
                },
              ),
              childCount: list.length,
            ),
          ),
        );
        //အားလုံးပေါင်း
        slivers.add(getAllMonthsCalculation(list));
      },
    );
    return slivers;
  }
}
