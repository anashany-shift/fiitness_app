import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fitness_app/api/models/requests/auth/login_request.dart';
import 'package:fitness_app/core/helper/api_result.dart';
import 'package:fitness_app/domain/entities/responses/auth_entity/login_entity.dart';
import 'package:fitness_app/domain/use_cases/auth/login_use_case.dart';
import 'package:fitness_app/features/auth/login/view_model/cubit/login_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final ValueNotifier<bool> isPasswordVisible = ValueNotifier(false);
  final LoginUseCase loginUseCase;

  LoginCubit(this.loginUseCase) : super(LoginState(isLoading: true));
  Future<void> login() async {
    emit(
      state.copyWith(
        isLoadingArg: true,
        loginEntityArg: null,
        errorMessageArg: null,
      ),
    );

    var result = await loginUseCase.call(
      loginRequest: LoginRequest(
        email: emailController.text,
        password: passwordController.text,
      ),
    );

    if (result is ApiSuccessResult<LoginEntity>) {
      emit(
        state.copyWith(
          isLoadingArg: false,
          loginEntityArg: result.data,
          errorMessageArg: null,
        ),
      );
    } else if (result is ApiErrorResult<LoginEntity>) {
      emit(state.copyWith(
        isLoadingArg: false,
        errorMessageArg: result.errorMessage,
        loginEntityArg: null,
      ));
    }
  }

  loginValidate({required GlobalKey<FormState> formKey}) {
    if (formKey.currentState!.validate()) {
      login();
    }
  }

  void passwordVisabilty() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    isPasswordVisible.dispose();
    return super.close();
  }
}
