import 'package:dailywage_tracker/app/extensions/datetime_extension.dart';
import 'package:dailywage_tracker/app/models/work_log.dart';
import 'package:flutter/material.dart';

class WorkLogListItem extends StatelessWidget {
  WorkLog workLog;
  void Function(WorkLog workLog) onClicked;
  WorkLogListItem({
    super.key,
    required this.workLog,
    required this.onClicked,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onClicked(workLog),
      child: Card(
        color: workLog.isPaid
            ? const Color.fromARGB(185, 8, 97, 11)
            : const Color.fromARGB(106, 175, 133, 6),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 5,
            children: [
              Text('နံနက်: ${workLog.morningWorked}'),
              Text('ညနေ: ${workLog.eveningWorked}'),
              Text('တစ်ရက် လုပ်အားခ: ${workLog.getTotalWage} ks'),
              Text('တစ်ရက် လုပ်အားခ ရှင်းပြီး: ${workLog.isPaid}'),
              Text('ရက်စွဲ: ${workLog.date.toParseTime()}'),
              Text('ထည့်သွင်းချိန်: ${workLog.date.toTimeAgo()}'),
            ],
          ),
        ),
      ),
    );
  }
}
