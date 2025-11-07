import 'package:dio/dio.dart';
import 'package:fitness_app/api/mapper/login_response_mapper.dart';
import 'package:fitness_app/api/models/requests/auth/login_request.dart';
import 'package:fitness_app/api/models/responses/auth/login_response.dart';
import 'package:fitness_app/core/helper/api_result.dart';
import 'package:fitness_app/core/helper/safe_api_call.dart';
import 'package:fitness_app/core/helper/token_storage.dart';
import 'package:fitness_app/data/data_source/auth/auth_remote_data_source.dart';
import 'package:fitness_app/domain/entities/responses/auth_entity/login_entity.dart';
import 'package:fitness_app/domain/repo/auth/auth_repo.dart';
import 'package:injectable/injectable.dart';

import '../../../core/error/failuer.dart';

@Injectable(as: AuthRepo)
class AuthRepoImpl implements AuthRepo {
  final AuthRemoteDataSource _authRemoteDataSource;

  AuthRepoImpl(this._authRemoteDataSource);

  @override
  Future<ApiResult<LoginEntity>> login({
    required LoginRequest loginRequest,
  }) async {
    try {
      final response = await _authRemoteDataSource.login(
        loginRequest: loginRequest,
      );
      final entity = response.toEntity();
      return ApiSuccessResult(entity);
    } on Exception catch (e) {
      if (e is DioException) {
        return ApiErrorResult(ServerFailure.fromDioError(e).errorMassage);
      } else {
        return ApiErrorResult(ServerFailure(e.toString()).errorMassage);
      }
    }
  }
}
// @Injectable(as: AuthRepo)
// class AuthRepoImpl implements AuthRepo {
//   final AuthRemoteDataSource _authRemoteDataSource;

//   AuthRepoImpl(this._authRemoteDataSource);

//   @override
//   Future<ApiResult<LoginEntity>> login({
//     required LoginRequest loginRequest,
//   }) async {
//     return safeApiCall<LoginResponse, LoginEntity>(() async {
//       final response = await _authRemoteDataSource.login(
//         loginRequest: loginRequest,
//       );
//       TokenStorage.saveToken(response.token);
//       return response;
//     }, (response) => response.toEntity());
//   }
// }
