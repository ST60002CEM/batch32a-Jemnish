import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kheti_pati/core/failure/failure.dart';
import 'package:kheti_pati/features/auth/data/data_source/auth_remote_data_source.dart';
import 'package:kheti_pati/features/auth/domain/entity/auth_entity.dart';
import 'package:kheti_pati/features/auth/domain/repository/i_auth_repository.dart';

final authRemoteRepositoryProvider = Provider<IAuthRepository>((ref) {
  return AuthRemoteRepository(
    ref.read(authRemoteDataSourceProvider),
  );
});

class AuthRemoteRepository implements IAuthRepository {
  final AuthRemoteDataSource _authRemoteDataSource;
  AuthRemoteRepository(this._authRemoteDataSource);

  @override
  Future<Either<Failure, bool>> login(String username, String password) {
    return _authRemoteDataSource.login(username, password);
  }

  @override
  Future<Either<Failure, bool>> addUser(AuthEntity auth) {
    return _authRemoteDataSource.addUser(auth);
  }
}
