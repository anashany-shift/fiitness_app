import 'package:fitness_app/core/helper/api_result.dart';
import 'package:fitness_app/domain/entities/responses/auth_entity/user_info_entity.dart';
import 'package:fitness_app/domain/repo/auth/auth_repo.dart';
import 'package:injectable/injectable.dart';
@injectable
class GetLoggedUserDataUseCase {
  final AuthRepo _authRepo;

  GetLoggedUserDataUseCase(this._authRepo);

  Future<ApiResult<UserInfoEntity>> call() {
    return _authRepo.getLoggedUserData();
  }
}