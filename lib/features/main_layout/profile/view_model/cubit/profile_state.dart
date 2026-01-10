part of 'profile_cubit.dart';

class ProfileState extends Equatable {
  final BaseState<LogoutResponse>? logoutResponse;
  final BaseState<UserInfoEntity>? userInfoEntity;

  const ProfileState({
     this.logoutResponse,
     this.userInfoEntity,
  });

  ProfileState copyWith({
    BaseState<LogoutResponse>? logoutResponse,
    BaseState<UserInfoEntity>? userInfoEntity,
  }) {
    return ProfileState(
      logoutResponse: logoutResponse ?? this.logoutResponse,
      userInfoEntity: userInfoEntity ?? this.userInfoEntity,
    );
  }

  @override
  List<Object?> get props => [logoutResponse, userInfoEntity];
}
