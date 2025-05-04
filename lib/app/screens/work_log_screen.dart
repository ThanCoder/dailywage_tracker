import 'package:dailywage_tracker/app/extensions/work_log_extension.dart';
import 'package:dailywage_tracker/app/components/work_log/work_log_components.dart';
import 'package:dailywage_tracker/app/modal_menu/work_log_form_modal_menu.dart';
import 'package:dailywage_tracker/app/models/work_log.dart';
import 'package:dailywage_tracker/app/models/work_site.dart';
import 'package:dailywage_tracker/app/widgets/core/index.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:uuid/uuid.dart';

class WorkLogScreen extends StatefulWidget {
  WorkSite workSite;
  WorkLogScreen({
    super.key,
    required this.workSite,
  });

  @override
  State<WorkLogScreen> createState() => _WorkLogScreenState();
}

class _WorkLogScreenState extends State<WorkLogScreen> {
  void _add() async {
    final workLog = WorkLog(
      id: Uuid().v4(),
      workSiteId: widget.workSite.id,
      dailyWage: widget.workSite.dailyWage,
      date: DateTime.now(),
    );

    showModalBottomSheet(
      context: context,
      builder: (context) => WorkLogFormModalMenu(workLog: workLog),
    );
  }

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
        title: Text('`${widget.workSite.name}` အလုပ်ဆင်း မှတ်တမ်း'),
      ),
      body: ListenableBuilder(
        listenable: WorkLog.db.listenable(),
        builder: (context, child) {
          final list = WorkLog.db.values
              .where((e) => e.workSiteId == widget.workSite.id)
              .toList();
          list.sortDateDesc();
          return CustomScrollView(
            slivers: [
              WorkLogComponents.getAllMonthsCalculation(
                  WorkLog.getCurrentMonthList(widget.workSite.id)),
              ...WorkLogComponents.getGroupedMonthList(list,
                  onClicked: _showEditForm),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _add,
        child: Icon(Icons.add),
      ),
    );
  }
}
