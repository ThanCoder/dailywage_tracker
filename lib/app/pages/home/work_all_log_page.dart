import 'package:dailywage_tracker/app/components/work_log/work_log_components.dart';
import 'package:dailywage_tracker/app/models/work_log.dart';
import 'package:dailywage_tracker/app/widgets/core/index.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

import '../../modal_menu/work_log_form_modal_menu.dart';

class WorkAllLogPage extends StatefulWidget {
  const WorkAllLogPage({super.key});

  @override
  State<WorkAllLogPage> createState() => _WorkAllLogPageState();
}

class _WorkAllLogPageState extends State<WorkAllLogPage> {
  void _showEditForm(WorkLog workLog) {
    showModalBottomSheet(
      context: context,
      builder: (context) => WorkLogFormModalMenu(
        workLog: workLog,
        isUpdated: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
        contentPadding: 0,
        appBar: AppBar(
          title: Text('အလုပ် မှတ်တမ်း စာရင်းအားလုံး'),
        ),
        body: ListenableBuilder(
          listenable: WorkLog.db.listenable(),
          builder: (context, child) {
            final list = WorkLog.getLatestDateList();
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomScrollView(
                slivers: [
                  WorkLogComponents.getAllMonthsCalculation(list),
                  ...WorkLogComponents.getGroupedMonthList(
                    list,
                    onClicked: _showEditForm,
                  ),
                ],
              ),
            );
          },
        ));
  }
}
