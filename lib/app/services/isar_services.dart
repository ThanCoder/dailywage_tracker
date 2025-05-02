import 'package:isar/isar.dart';

import '../models/work_log.dart';
import '../models/work_site.dart';

class IsarServices {
  static Isar? _isar;

  static Future<void> init(String dirPath) async {
    if (_isar != null) return;
    _isar = await Isar.open(
      [
        WorkSiteSchema,
        WorkLogSchema,
      ],
      directory: dirPath,
    );
  }

  static Isar get isar {
    if (_isar == null) {
      throw Exception('Isar has not been initialized! -> ``');
    }
    return _isar!;
  }
}
