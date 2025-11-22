part of 'signup_cubit.dart';

class SignupState {
  final int pageIndex;
  final bool isLoading;
  final SignupEntityResponse? signupEntityResponse;
  final String? errorMessage;

  SignupState({
    required this.pageIndex,
    required this.isLoading,
    this.signupEntityResponse,
    this.errorMessage,
  });

  SignupState copyWith({
    int? pageIndex,
    bool? isLoading,
    SignupEntityResponse? signupEntityResponse,
    String? errorMessage,
  }) {
    return SignupState(
      pageIndex: pageIndex ?? this.pageIndex,
      isLoading: isLoading ?? this.isLoading,
      signupEntityResponse: signupEntityResponse ?? this.signupEntityResponse,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
