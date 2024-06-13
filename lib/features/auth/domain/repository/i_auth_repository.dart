import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kheti_pati/core/failure/failure.dart';
import 'package:kheti_pati/features/auth/data/repository/auth_local_repository.dart';
import 'package:kheti_pati/features/auth/domain/entity/auth_entity.dart';

final authRepositoryProvider = Provider<IAuthRepository>((ref) {
  return ref.watch(authLocalRepository);
});

abstract class IAuthRepository {
  Future<Either<Failure, bool>> addUser(AuthEntity auth);
  Future<Either<Failure, bool>> login(String username, String password);
  Future<Either<Failure, String>> uploadProfilePicture(File file);
}
