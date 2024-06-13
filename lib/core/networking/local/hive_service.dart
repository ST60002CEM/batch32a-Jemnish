import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:student_management_starter/app/constants/hive_table_constant.dart';
import 'package:student_management_starter/features/auth/data/model/auth_hive_model.dart';

final hiveServiceProvider = Provider((ref) => HiveService());

class HiveService {
  Future<void> init() async {
    var directory = await getApplicationDocumentsDirectory();
    Hive.init(directory.path);

    // Register Adapters
  
    Hive.registerAdapter(AuthHiveModelAdapter());
  }

 

  
  // ============= Student Queries
  Future<void> addStudent(AuthHiveModel auth) async {
    var box = await Hive.openBox<AuthHiveModel>(HiveTableConstant.studentBox);
    await box.put(auth.studentId, auth);
  }

  Future<AuthHiveModel> getStudent(String username) async {
    var box = await Hive.openBox<AuthHiveModel>(HiveTableConstant.studentBox);
    return box.values.firstWhere((element) => element.username == username);
  }

  Future<AuthHiveModel> login(String username, String password) async {
    var box = await Hive.openBox<AuthHiveModel>(HiveTableConstant.studentBox);
    var student = box.values.firstWhere((element) =>
        element.username == username && element.password == password);
    return student;
  }
}
