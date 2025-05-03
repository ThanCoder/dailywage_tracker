import 'package:dailywage_tracker/app/extensions/index.dart';
import 'package:dailywage_tracker/app/models/work_site.dart';
import 'package:flutter/material.dart';

import '../widgets/index.dart';

class WorkSiteListItem extends StatelessWidget {
  WorkSite workSite;
  void Function(WorkSite workSite) onClicked;
  WorkSiteListItem({
    super.key,
    required this.workSite,
    required this.onClicked,
  });

  @override
  Widget build(BuildContext context) {
    return ListTileWithDesc(
      onClick: () => onClicked(workSite),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 5,
        children: [
          Text('အလုပ် အမည်: ${workSite.name}'),
          Text('တစ်နေ့ လုပ်အားခ: ${workSite.dailyWage} ks'),
          workSite.location.isEmpty
              ? SizedBox.shrink()
              : Text('တည်နေရာ: ${workSite.location}'),
          Text('ရက်စွဲ: ${workSite.date.toParseTime()}'),
        ],
      ),
      desc: workSite.desc,
    );
  }
}
