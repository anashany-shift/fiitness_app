import 'package:fitness_app/api/models/requests/auth/login_request.dart';
import 'package:fitness_app/core/helper/api_result.dart';
import 'package:fitness_app/domain/entities/responses/auth_entity/login_entity.dart';
import 'package:fitness_app/domain/repo/auth/auth_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginUseCase {
  final AuthRepo authRepo;

  LoginUseCase(this.authRepo);
  Future<ApiResult<LoginEntity>> call({
    required LoginRequest loginRequest,
  }) async {
    return await authRepo.login(loginRequest: loginRequest);
  }
}
