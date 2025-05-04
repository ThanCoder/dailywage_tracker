import 'package:flutter/material.dart';

import '../work_log_list_item.dart';
import '../../models/work_log.dart';

class WorkLogComponents {
  // အားလုံးပေါင်း
  static Widget getAllMonthsCalculation(
    List<WorkLog> list, {
    String title = 'စုစုပေါင်း',
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
              Text('အလုပ်ဆင်းခဲ့တဲ့ ရက်စုစုပေါင်း: ${list.length} ရက်'),
              // const Divider(),
            ],
          ),
        ),
      ),
    );
  }

  // month အလိုက်
  static List<Widget> getGroupedMonthList(
    List<WorkLog> list, {
    void Function(WorkLog)? onClicked,
  }) {
    Map<int, List<WorkLog>> groupedByMonthList = {};
    final currentDate = DateTime.now();

    for (var log in list) {
      // ဒီနှစ် လ

      if (currentDate.year != log.date.year) continue;
      // var key = 'Month: ${log.date.year}-${log.date.month.toString().padLeft(2, '0')}';

      groupedByMonthList.putIfAbsent(log.date.month, () => []).add(log);
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
                month == currentDate.month
                    ? 'ယခုလ'
                    : 'Month: ${month.toString().padLeft(2, '0')}', // eg. 2025-05
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

  // year အလိုက်
  static List<Widget> getGroupedYearMonthList(
    List<WorkLog> list, {
    void Function(WorkLog)? onClicked,
  }) {
    Map<int, Map<int, List<WorkLog>>> groupedByYearMonthList = {};
    final currentDate = DateTime.now();

    for (var log in list) {
      var year = log.date.year;
      var month = log.date.month;

      groupedByYearMonthList.putIfAbsent(year, () => {});
      groupedByYearMonthList[year]!.putIfAbsent(month, () => []);
      //add
      groupedByYearMonthList[year]![month]!.add(log);
    }

    List<Widget> slivers = [];
    groupedByYearMonthList.forEach(
      (year, map) {
        //year
        slivers.add(
          SliverToBoxAdapter(
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  year == currentDate.year ? 'ယခု နှစ်' : 'Year: $year',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        );

        map.forEach((month, monthList) {
          // month
          slivers.add(
            SliverToBoxAdapter(
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    year == currentDate.year && month == currentDate.month
                        ? 'ဒီလ'
                        : 'Month: ${month.toString().padLeft(2, '0')}',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          );
          slivers.add(
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => WorkLogListItem(
                  workLog: monthList[index],
                  onClicked: (workLog) {
                    if (onClicked != null) {
                      onClicked(workLog);
                    }
                  },
                ),
                childCount: monthList.length,
              ),
            ),
          );
          //အားလုံးပေါင်း
          slivers.add(getAllMonthsCalculation(monthList));
        });
      },
    );
    return slivers;
  }
}
