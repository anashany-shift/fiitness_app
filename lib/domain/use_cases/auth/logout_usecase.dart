import 'package:fitness_app/api/models/requests/auth/login_request.dart';
import 'package:fitness_app/api/models/responses/auth/logout_response.dart';
import 'package:fitness_app/core/helper/api_result.dart';
import 'package:fitness_app/domain/repo/auth/auth_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class LogoutUsecase {
  final AuthRepo authRepo;

  LogoutUsecase(this.authRepo);
  Future<ApiResult<LogoutResponse>> call() async {
    return await authRepo.logout();
  }
}
