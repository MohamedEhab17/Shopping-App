

import 'package:shopping_app/core/network/network.dart';
import 'package:shopping_app/feature/auth/data/model/request/login_request_dto.dart';
import 'package:shopping_app/feature/auth/data/model/request/register_request_dto.dart';
import 'package:shopping_app/feature/auth/data/model/response/login_response_dto.dart';
import 'package:shopping_app/feature/auth/data/model/response/register_response_dto.dart';
import 'package:shopping_app/feature/auth/data/repo/data_source/auth_data_source_contract.dart';
import 'package:shopping_app/feature/auth/data/repo/data_source/auth_data_source_impl.dart';
import 'package:shopping_app/feature/auth/data/repo/repository/auth_repository_contract.dart';

class AuthRepositoryImpl implements AuthRepositoryContract {
  const AuthRepositoryImpl(this._dataSourceRemote);
  final AuthRemoteDataSourceContract _dataSourceRemote;

  @override
  Future<NetworkResult<LoginResponseDto>> login(LoginRequestDto request) =>
      _dataSourceRemote.login(request);

  @override
  Future<NetworkResult<RegisterResponseDto>> register(
    RegisterRequestDto request,
  ) => _dataSourceRemote.register(request);
}

AuthRepositoryContract injectableAuthRepository() => AuthRepositoryImpl(
  injectableAuthRemoteDataSource(),
);