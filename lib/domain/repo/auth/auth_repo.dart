import 'package:fitness_app/api/models/requests/auth/login_request.dart';
import 'package:fitness_app/core/helper/api_result.dart';
import 'package:fitness_app/domain/entities/responses/auth_entity/login_entity.dart';

abstract class AuthRepo {
  Future<ApiResult<LoginEntity>> login({required LoginRequest loginRequest});
}