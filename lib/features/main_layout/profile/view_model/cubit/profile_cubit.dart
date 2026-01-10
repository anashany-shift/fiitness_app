import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fitness_app/api/models/responses/auth/logout_response.dart';
import 'package:fitness_app/core/helper/base_state.dart';
import 'package:fitness_app/core/helper/token_storage.dart';
import 'package:fitness_app/domain/entities/responses/auth_entity/user_info_entity.dart';
import 'package:fitness_app/domain/use_cases/auth/get_logged_user_data_use_case.dart';
import 'package:fitness_app/domain/use_cases/auth/logout_usecase.dart';
import 'package:fitness_app/core/helper/api_result.dart';
import 'package:injectable/injectable.dart';

part 'profile_state.dart';
@injectable
class ProfileCubit extends Cubit<ProfileState> {
  final GetLoggedUserDataUseCase getLoggedUserDataUseCase;
  final LogoutUsecase logoutUsecase;

  ProfileCubit({required this.getLoggedUserDataUseCase, required this.logoutUsecase}) : super(const ProfileState());

  Future<void> getLoggedUserInfo() async {
    emit(state.copyWith(userInfoEntity:  BaseState.loading()));
    final result = await getLoggedUserDataUseCase();
    if (result is ApiSuccessResult<UserInfoEntity>) {
      emit(state.copyWith(userInfoEntity: BaseState.success(result.data)));
    } else if (result is ApiErrorResult<UserInfoEntity>) {
      emit(state.copyWith(userInfoEntity: BaseState.error(result.errorMessage)));
    }
  }

  Future<void> logout() async {
    emit(state.copyWith(logoutResponse:  BaseState.loading()));
    final result = await logoutUsecase();
    if (result is ApiSuccessResult<LogoutResponse>) {
      emit(state.copyWith(logoutResponse: BaseState.success(result.data)));
      TokenStorage.deleteToken();
    } else if (result is ApiErrorResult<LogoutResponse>) {
      emit(state.copyWith(logoutResponse: BaseState.error(result.errorMessage)));
    }
  }
}
