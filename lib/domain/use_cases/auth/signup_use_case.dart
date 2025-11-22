import 'package:fitness_app/api/models/requests/auth/signup_request.dart';
import 'package:fitness_app/core/helper/api_result.dart';
import 'package:fitness_app/domain/entities/responses/auth_entity/signup_entity_response.dart';
import 'package:fitness_app/domain/repo/auth/auth_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class SignupUseCase {
  final AuthRepo authRepo;

  SignupUseCase(this.authRepo);
  Future<ApiResult<SignupEntityResponse>> call({
    required SignUpRequest signupRequest,
  }) async {
    return await authRepo.signUp(signupRequest:signupRequest );
  }
}
