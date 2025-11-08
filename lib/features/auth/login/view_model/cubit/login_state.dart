// ignore_for_file: public_member_api_docs, sort_constructors_first
// part of 'login_cubit.dart';

// sealed class LoginState extends Equatable {
//   const LoginState();

//   @override
//   List<Object> get props => [];
// }

// final class LoginInitial extends LoginState {}

// final class LoginSuccess extends LoginState {
//   final LoginEntity loginEntity;

//   const LoginSuccess({required this.loginEntity});
// }

// final class LoginError extends LoginState {
//   final String errorMassage;

//   const LoginError(this.errorMassage);
// }

// final class LoginLoading extends LoginState {}
import 'package:fitness_app/domain/entities/responses/auth_entity/login_entity.dart';

class LoginState {
  bool isLoading;
  LoginEntity? loginEntity;
  String? errorMessage;
  LoginState({this.isLoading = false, this.loginEntity, this.errorMessage});

  LoginState copyWith({
    bool? isLoadingArg,
    LoginEntity? loginEntityArg, 
    String? errorMessageArg,
  }) {
    return LoginState(
      isLoading: isLoadingArg ?? isLoading,
      loginEntity: loginEntityArg ?? loginEntity,
      errorMessage: errorMessageArg ?? errorMessage,
    );
  }
}
