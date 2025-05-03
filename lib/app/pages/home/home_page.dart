import 'package:dailywage_tracker/app/components/work_site_list_item.dart';
import 'package:dailywage_tracker/app/models/work_site.dart';
import 'package:dailywage_tracker/app/screens/work_log_screen.dart';
import 'package:dailywage_tracker/app/screens/work_site_form_screen.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import '../../general_server/index.dart';

import '../../constants.dart';
import '../../widgets/index.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void _newWorkSite() async {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => WorkSiteFormScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      appBar: AppBar(
        title: Text(appTitle),
        actions: [
          GeneralServerNotiButton(),
        ],
      ),
      body: ListenableBuilder(
        listenable: WorkSite.db.listenable(),
        builder: (context, child) {
          final list = WorkSite.getLatestDateList();

          return ListView.builder(
            itemCount: list.length,
            itemBuilder: (context, index) {
              final workSite = list[index];
              return WorkSiteListItem(
                workSite: workSite,
                onClicked: (workSite) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => WorkLogScreen(workSite: workSite),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _newWorkSite,
        child: Icon(Icons.add),
      ),
    );
  }
}
