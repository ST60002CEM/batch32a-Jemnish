import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kheti_pati/core/failure/failure.dart';
import 'package:kheti_pati/core/networking/local/hive_service.dart';
import 'package:kheti_pati/features/auth/data/model/auth_hive_model.dart';
import 'package:kheti_pati/features/auth/domain/entity/auth_entity.dart';

final authLocalDataSourceProvider = Provider((ref) => AuthLocalDataSource(
    hiveService: ref.read(hiveServiceProvider),
    authHiveModel: ref.read(authHiveModelProvider)));

class AuthLocalDataSource {
  final HiveService hiveService;
  final AuthHiveModel authHiveModel;

  AuthLocalDataSource({required this.hiveService, required this.authHiveModel});

  // Add User
  Future<Either<Failure, bool>> addUser(AuthEntity auth) async {
    try {
      // Check if user already exists
      final existingUserResult = await getUser(auth.username);

      return existingUserResult.fold(
        (failure) async {
          // User does not exist, proceed to add user
          final hiveUser = authHiveModel.toHiveModel(auth);
          await hiveService.addUser(hiveUser);
          return const Right(true);
        },
        (user) {
          // User already exists, return failure
          return Left(Failure(error: 'User already exists'));
        },
      );
    } catch (e) {
      return Left(Failure(error: e.toString()));
    }
  }

  // Get User
  Future<Either<Failure, AuthEntity>> getUser(String username) async {
    try {
      final hiveUser = await hiveService.getUser(username);

      final user = hiveUser.toEntity();

      return Right(user);
    } catch (e) {
      return Left(Failure(error: e.toString()));
    }
  }

  // Login
  Future<Either<Failure, bool>> login(String username, String password) async {
    try {
      final hiveUser = await hiveService.getUser(username);

      if (hiveUser.password == password) {
        return const Right(true);
      } else {
        return Left(Failure(error: 'Invalid Credentials'));
      }
    } catch (e) {
      return Left(Failure(error: e.toString()));
    }
  }
  // Future<Either<Failure, bool>> login(String username, String password) async {
  //   try {
  //     return const Right(true);
  //   } catch (e) {
  //     return Left(Failure(error: e.toString()));
  //   }
  // }
}
