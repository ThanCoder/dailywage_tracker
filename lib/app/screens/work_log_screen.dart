import 'package:dailywage_tracker/app/components/work_log_list_item.dart';
import 'package:dailywage_tracker/app/extensions/datetime_extenstion.dart';
import 'package:dailywage_tracker/app/modal_menu/work_log_form_modal_menu.dart';
import 'package:dailywage_tracker/app/models/work_log.dart';
import 'package:dailywage_tracker/app/models/work_site.dart';
import 'package:dailywage_tracker/app/widgets/core/index.dart';
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';

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
    final workLog = WorkLog()
      ..workSiteId = widget.workSite.id
      ..dailyWage = widget.workSite.dailyWage
      ..date = DateTime.now();

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

  Widget _listWidget(List<WorkLog> list) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CustomScrollView(
        slivers: [
          // this month
          SliverToBoxAdapter(
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 5,
              children: [
                Text('ယခုလ'),
                Text(
                    'ရက်စွဲ: ${DateTime.now().toParseTime(pattern: 'dd/MM/yyyy')}'),
              ],
            ),
          ),
          // all list
          SliverList.builder(
            itemCount: list.length,
            itemBuilder: (context, index) => WorkLogListItem(
              workLog: list[index],
              onClicked: _showEditForm,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      contentPadding: 0,
      appBar: AppBar(
        title: Text('`${widget.workSite.name}` အလုပ် မှတ်တမ်း'),
      ),
      body: StreamBuilder(
          stream: WorkLog.coll.watchLazy(),
          builder: (context, snapshot) {
            return FutureBuilder(
              future: WorkLog.coll
                  .filter()
                  .workSiteIdEqualTo(widget.workSite.id)
                  .sortByDateDesc()
                  .findAll(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) return TLoader();
                final list = snapshot.data ?? [];
                return _listWidget(list);
              },
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: _add,
        child: Icon(Icons.add),
      ),
    );
  }
}
