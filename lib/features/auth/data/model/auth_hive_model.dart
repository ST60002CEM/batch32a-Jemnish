import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:kheti_pati/app/constants/hive_table_constant.dart';
import 'package:kheti_pati/features/auth/domain/entity/auth_entity.dart';

import 'package:uuid/uuid.dart';

part 'auth_hive_model.g.dart';

final authHiveModelProvider = Provider(
  (ref) => AuthHiveModel.empty(),
);

@HiveType(typeId: HiveTableConstant.userTableId)
class AuthHiveModel {
  @HiveField(0)
  final String userId;

  @HiveField(1)
  final String fullname;


  @HiveField(3)
  final String phone;


  @HiveField(6)
  final String username;

  @HiveField(7)
  final String password;

  @HiveField(8)
  final String securityQuestion;

  // Constructor
  AuthHiveModel({
    String? userId,
    required this.fullname,
    required this.phone,
    required this.username,
    required this.password,
    required this.securityQuestion,
  }) : userId = userId ?? const Uuid().v4();

  // empty constructor
  AuthHiveModel.empty()
      : this(
          userId: '',
          fullname: '',
          phone: '',
          username: '',
          password: '',
          securityQuestion: '',
        );

  // Convert Hive Object to Entity
  AuthEntity toEntity() => AuthEntity(
        id: userId,
        fullname: fullname,
        phone: phone,
        username: username,
        password: password,
        securityQuestion: securityQuestion,
      );

  // Convert Entity to Hive Object
  AuthHiveModel toHiveModel(AuthEntity entity) => AuthHiveModel(
        userId: const Uuid().v4(),
        fullname: entity.fullname,
        phone: entity.phone,
        
        username: entity.username,
        password: entity.password,
        securityQuestion: entity.securityQuestion,
      );

  // Convert Entity List to Hive List
  List<AuthHiveModel> toHiveModelList(List<AuthEntity> entities) =>
      entities.map((entity) => toHiveModel(entity)).toList();

  @override
  String toString() {
    return 'userId: $userId, fullname: $fullname, phone : $phone, username: $username, password: $password, securityQuestion: $securityQuestion';
  }
}
