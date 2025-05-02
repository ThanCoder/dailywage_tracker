import 'package:dailywage_tracker/app/components/work_log_list_item.dart';
import 'package:dailywage_tracker/app/extensions/datetime_extenstion.dart';
import 'package:dailywage_tracker/app/models/work_log.dart';
import 'package:dailywage_tracker/app/widgets/core/index.dart';
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';

class WorkAllLogPage extends StatefulWidget {
  const WorkAllLogPage({super.key});

  @override
  State<WorkAllLogPage> createState() => _WorkAllLogPageState();
}

class _WorkAllLogPageState extends State<WorkAllLogPage> {
  @override
  void initState() {
    super.initState();
    init();
  }

  bool isLoading = false;
  List<WorkLog> allList = [];
  List<WorkLog> currentMonthList = [];
  Map<String, List<WorkLog>> groupedByMonthList = {};

  void init() async {
    try {
      setState(() {
        isLoading = true;
      });
      allList = await WorkLog.coll.where().sortByDateDesc().findAll();
      currentMonthList =
          allList.where((e) => e.date.month == DateTime.now().month).toList();
      final otherMonthList =
          allList.where((e) => e.date.month != DateTime.now().month).toList();
      for (var log in otherMonthList) {
        final key =
            '${log.date.year}-${log.date.month.toString().padLeft(2, '0')}';
        groupedByMonthList.putIfAbsent(key, () => []).add(log);
      }
      if (!mounted) return;
      setState(() {
        isLoading = false;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        isLoading = false;
      });
    }
  }

  void _showEditForm(WorkLog workLog) {
    // showModalBottomSheet(
    //   context: context,
    //   builder: (context) => WorkLogFormModalMenu(
    //     workLog: workLog,
    //     isUpdated: true,
    //   ),
    // );
  }
  double _getAllWageSum(List<WorkLog> list) {
    double allSum = 0;
    for (var workLog in list) {
      allSum += workLog.getTotalWage;
    }
    return allSum;
  }

  List<Widget> _getGroupedList() {
    List<Widget> slivers = [];
    groupedByMonthList.forEach((month, list) {
      slivers.add(
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Month: $month', // eg. 2025-05
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
              onClicked: _showEditForm,
            ),
            childCount: list.length,
          ),
        ),
      );
    });
    return slivers;
  }

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      contentPadding: 0,
      appBar: AppBar(
        title: Text('အလုပ် မှတ်တမ်း စာရင်းအားလုံး'),
      ),
      body: isLoading
          ? TLoader()
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomScrollView(
                slivers: [
                  // current month
                  SliverToBoxAdapter(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 5,
                      children: [
                        Text(
                          'လုပ်အားခ: ${_getAllWageSum(currentMonthList)} ks',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'ကြိုတင် ရယူ ငွေပမာဏ: 0 ks',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'ရရှိမယ့် ငွေပမာဏ: ${_getAllWageSum(currentMonthList)} ks',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'အလုပ်လုပ်ခဲ့တဲ့ ရက်ပေါင်း: ${currentMonthList.length} ရက်',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'ရက်စွဲ: ${DateTime.now().toParseTime(pattern: 'dd/MM/yyyy')}',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SliverToBoxAdapter(child: Divider()),
                  SliverToBoxAdapter(
                    child: Text(
                      'Current Months',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SliverList.builder(
                    itemCount: currentMonthList.length,
                    itemBuilder: (context, index) => WorkLogListItem(
                      workLog: currentMonthList[index],
                      onClicked: _showEditForm,
                    ),
                  ),
                  SliverToBoxAdapter(child: Divider()),
                  SliverToBoxAdapter(
                    child: Text(
                      'Other Months',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  // other month
                  ..._getGroupedList(),
                ],
              ),
            ),
    );
  }
}
