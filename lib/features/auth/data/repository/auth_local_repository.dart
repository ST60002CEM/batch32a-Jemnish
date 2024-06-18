import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kheti_pati/core/failure/failure.dart';
import 'package:kheti_pati/features/auth/data/data_source/auth_local_data_source.dart';
import 'package:kheti_pati/features/auth/domain/entity/auth_entity.dart';
import 'package:kheti_pati/features/auth/domain/repository/i_auth_repository.dart';

final authLocalRepositoryProvider = Provider<IAuthRepository>((ref) {
  return AuthLocalRepository(
      authLocalDataSource: ref.read(authLocalDataSourceProvider));
});

class AuthLocalRepository implements IAuthRepository {
  final AuthLocalDataSource authLocalDataSource;

  AuthLocalRepository({required this.authLocalDataSource});

  @override
  Future<Either<Failure, bool>> addUser(AuthEntity auth) {
    return authLocalDataSource.addUser(auth);
  }

  @override
  Future<Either<Failure, bool>> login(String username, String password) {
    return authLocalDataSource.login(username, password);
  }

  @override
  Future<Either<Failure, String>> uploadProfilePicture(File file) {
    throw UnimplementedError();
  }
}
