import 'package:dailywage_tracker/app/dialogs/index.dart';
import 'package:dailywage_tracker/app/extensions/index.dart';
import 'package:dailywage_tracker/app/models/work_log.dart';
import 'package:dailywage_tracker/app/widgets/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../components/core/index.dart';

class WorkLogFormModalMenu extends StatefulWidget {
  WorkLog workLog;
  bool isUpdated;
  WorkLogFormModalMenu({
    super.key,
    required this.workLog,
    this.isUpdated = false,
  });

  @override
  State<WorkLogFormModalMenu> createState() => _WorkLogFormModalMenuState();
}

class _WorkLogFormModalMenuState extends State<WorkLogFormModalMenu> {
  final dailyWageController = TextEditingController();

  late WorkLog workLog;

  @override
  void initState() {
    super.initState();
    workLog = widget.workLog;
    _reCount();
  }

  void _reCount() {
    dailyWageController.text = '${workLog.getTotalWage.toInt()}';
  }

  void _submit() async {
    if (widget.isUpdated) {
      try {
        await workLog.update();
        if (!mounted) return;
        showMessage(context, 'ပြင်ဆင်ပြီးပါပြီ', isOldStyle: true);
      } catch (e) {
        if (!mounted) return;
        showDialogMessage(context, e.toString());
      }
      return;
    }
    //add
    try {
      await workLog.add();
      if (!mounted) return;
      showMessage(context, 'ထည့်သွင်းပြီးပါပြီ', isOldStyle: true);
    } catch (e) {
      if (!mounted) return;
      showDialogMessage(context, e.toString());
    }
  }

  void _deleteConfirm() {
    showDialog(
      context: context,
      builder: (ctx) => ConfirmDialog(
        contentText: 'ဒီ စာရင်းကို ဖျက်ချင်တာ သေချာပြီလား?',
        cancelText: 'မဖျက်ဘူး',
        submitText: 'ဖျက်မယ်',
        onSubmit: () async {
          final isDeleted = await workLog.delete();
          if (!ctx.mounted) return;
          if (isDeleted) {
            showMessage(ctx, 'ဖျက်လိုက်ပါပြီ', isOldStyle: true);
          } else {
            showMessage(ctx, 'ဖျက် မရဖြစ်နေပါတယ်', isOldStyle: true);
          }
        },
      ),
    );
  }

  void _pickDate() async {
    final date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      currentDate: workLog.date,
      firstDate: DateTime(2024),
      lastDate: DateTime.now(),
    );
    if (date == null) return;
    if (!mounted) return;
    final time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (time == null) return;
    final newDate = DateTime(
      date.year,
      date.month,
      date.day,
      time.hour,
      time.minute,
    );
    setState(() {
      workLog.date = newDate;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 6,
          children: [
            Text('အလုပ်လုပ် စာရင်း'),
            TTextField(
              label: Text('တစ်ရက် လုပ်အားခ ks'),
              controller: dailyWageController,
              maxLines: 1,
              textInputType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            ),
            SwitchListTile.adaptive(
              activeColor: Colors.green,
              title: Text(
                'နံနက် အလုပ် ${workLog.morningWorked ? 'ဆင်းပြီး' : 'မဆင်းဘူး'}',
              ),
              value: workLog.morningWorked,
              onChanged: (value) {
                setState(() {
                  workLog.morningWorked = value;
                });
                _reCount();
              },
            ),
            SwitchListTile.adaptive(
              activeColor: Colors.green,
              title: Text(
                'ညနေ အလုပ် ${workLog.eveningWorked ? 'ဆင်းပြီး' : 'မဆင်းဘူး'}',
              ),
              value: workLog.eveningWorked,
              onChanged: (value) {
                setState(() {
                  workLog.eveningWorked = value;
                });
                _reCount();
              },
            ),
            SwitchListTile.adaptive(
              activeColor: Colors.green,
              title: Text(
                'လုပ်အားခ ${workLog.isPaid ? 'ရှင်းပြီး' : 'မရှင်းရသေး'}',
              ),
              value: workLog.isPaid,
              onChanged: (value) {
                setState(() {
                  workLog.isPaid = value;
                });
                _reCount();
              },
            ),
            Row(
              spacing: 5,
              children: [
                Text('ရက်စွဲ'),
                TextButton(
                    onPressed: _pickDate,
                    child: Text(workLog.date.toParseTime())),
              ],
            ),
            const SizedBox(height: 20),
            // action button
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              spacing: 10,
              children: [
                widget.isUpdated
                    ? TextButton(
                        style: TextButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 133, 19, 11)),
                        onPressed: () {
                          Navigator.pop(context);
                          _deleteConfirm();
                        },
                        child: Text('ဖျက်မယ်'),
                      )
                    : SizedBox(),
                TextButton(
                  style: TextButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 18, 82, 20)),
                  onPressed: () {
                    Navigator.pop(context);
                    _submit();
                  },
                  child: Text(widget.isUpdated ? 'ပြင်ဆင်' : 'ထည့်သွင်း'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
