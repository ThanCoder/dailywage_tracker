import 'package:dailywage_tracker/app/components/index.dart';
import 'package:dailywage_tracker/app/models/work_site.dart';
import 'package:dailywage_tracker/app/providers/work_site_provider.dart';
import 'package:dailywage_tracker/app/widgets/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class WorkSiteFormScreen extends StatefulWidget {
  WorkSite? workSite;
  WorkSiteFormScreen({super.key});

  @override
  State<WorkSiteFormScreen> createState() => _WorkSiteFormScreenState();
}

class _WorkSiteFormScreenState extends State<WorkSiteFormScreen> {
  final nameController = TextEditingController();
  final descController = TextEditingController();
  final locationController = TextEditingController();
  final dailyWageController = TextEditingController();

  @override
  void initState() {
    super.initState();
    nameController.text = 'Untitled';
    dailyWageController.text = '10000';
    init();
  }

  String? nameError;
  String? dailyWageError;

  void init() {
    _checkName();
  }

  void _checkName() async {
    final isExists = await context
        .read<WorkSiteProvider>()
        .isExistsName(nameController.text);
    nameError = isExists ? 'ရှိနေပါတယ်?။အမည် ပြောင်းလဲပေးပါ' : null;
    setState(() {});
  }

  void _submit() async {
    if (widget.workSite == null) {
      try {
        final dailyWage = double.parse(dailyWageController.text);
        // new site
        final site = WorkSite()
          ..name = nameController.text
          ..location = locationController.text
          ..desc = descController.text
          ..dailyWage = dailyWage
          ..date = DateTime.now();

        await context.read<WorkSiteProvider>().add(site);
        if (!mounted) return;
        Navigator.pop(context);
        return;
      } catch (e) {
        if (!mounted) return;
        showDialogMessage(context, e.toString());
      }
    }
    //update site
  }

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      contentPadding: 0,
      appBar: AppBar(
        title: Text('Work Site Form'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            spacing: 8,
            children: [
              TTextField(
                label: Text('အလုပ်ဆိုက် အမည်'),
                controller: nameController,
                errorText: nameError,
                maxLines: 1,
                onChanged: (value) {
                  _checkName();
                },
              ),
              TTextField(
                label: Text('တစ်နေ့ လုပ်အားခ ks'),
                controller: dailyWageController,
                maxLines: 1,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                textInputType: TextInputType.number,
                errorText: dailyWageError,
                onChanged: (value) {
                  if (value.isEmpty) {
                    setState(() {
                      dailyWageError = 'စျေးနှုန်းထည့်ထားပါမယ်';
                    });
                    return;
                  }
                  setState(() {
                    dailyWageError = null;
                  });
                },
              ),
              TTextField(
                label: Text('အလုပ်ဆိုက် တည်နေရာ'),
                controller: locationController,
                maxLines: null,
              ),
              TTextField(
                label: Text('ဖော်ပြချက်'),
                controller: descController,
                maxLines: null,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: (nameError != null || dailyWageError != null)
          ? null
          : FloatingActionButton(
              onPressed: _submit,
              child: Icon(
                  widget.workSite == null ? Icons.add : Icons.save_as_rounded),
            ),
    );
  }
}
