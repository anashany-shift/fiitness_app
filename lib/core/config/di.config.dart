// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../api/client/auth_api_client/auth_api_client.dart' as _i705;
import '../../api/client/main_layout_client/explore_api_client.dart' as _i984;
import '../../api/data_source/auth/auth_remote_data_source_impl.dart' as _i153;
import '../../api/data_source/main_layout/explore_remote_data_source_impl.dart'
    as _i656;
import '../../data/data_source/auth/auth_remote_data_source.dart' as _i573;
import '../../data/data_source/main_layout/explore_remote_data_source.dart'
    as _i171;
import '../../data/repo_impl/auth/auth_repo_impl.dart' as _i947;
import '../../data/repo_impl/main_layout/explore_repo_impl.dart' as _i178;
import '../../domain/repo/auth/auth_repo.dart' as _i894;
import '../../domain/repo/main_layout/explore_repo.dart' as _i625;
import '../../domain/use_cases/auth/login_use_case.dart' as _i40;
import '../../domain/use_cases/auth/signup_use_case.dart' as _i86;
import '../../domain/use_cases/main_layout/explore_use_cases/get_food_category_use_case.dart'
    as _i864;
import '../../domain/use_cases/main_layout/explore_use_cases/get_muscles_upcoming_by_group_id.dart'
    as _i953;
import '../../domain/use_cases/main_layout/explore_use_cases/get_muscles_upcoming_use_case.dart'
    as _i637;
import '../../domain/use_cases/main_layout/explore_use_cases/get_random_muscles_use_case.dart'
    as _i1071;
import '../../features/auth/login/view_model/cubit/login_cubit.dart' as _i474;
import '../../features/auth/sign_up/view_model/cubit/signup_cubit.dart'
    as _i593;
import '../../features/main_layout/explore/view_model/cubit/explore_cubit.dart'
    as _i77;
import '../module/dio_module.dart' as _i545;
import '../service/network_service.dart' as _i724;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final dioModule = _$DioModule();
    gh.factory<_i724.NetworkService>(() => _i724.NetworkService());
    gh.singleton<_i361.Dio>(
      () => dioModule.provideThemealdb(),
      instanceName: 'secondaryApi',
    );
    gh.singleton<_i361.Dio>(
      () => dioModule.provideMainDio(),
      instanceName: 'mainApi',
    );
    gh.factory<_i984.FoodApiCLient>(
      () =>
          _i984.FoodApiCLient.new(gh<_i361.Dio>(instanceName: 'secondaryApi')),
    );
    gh.factory<_i705.AuthApiClient>(
      () => _i705.AuthApiClient.new(gh<_i361.Dio>(instanceName: 'mainApi')),
    );
    gh.factory<_i984.ExploreApiClient>(
      () => _i984.ExploreApiClient.new(gh<_i361.Dio>(instanceName: 'mainApi')),
    );
    gh.factory<_i573.AuthRemoteDataSource>(
      () => _i153.AuthRemoteDataSourceImpl(gh<_i705.AuthApiClient>()),
    );
    gh.factory<_i894.AuthRepo>(
      () => _i947.AuthRepoImpl(gh<_i573.AuthRemoteDataSource>()),
    );
    gh.factory<_i171.ExploreRemoteDataSource>(
      () => _i656.ExploreRemoteDataSourceImpl(
        gh<_i984.ExploreApiClient>(),
        gh<_i984.FoodApiCLient>(),
      ),
    );
    gh.factory<_i625.ExploreRepo>(
      () => _i178.ExploreRepoImpl(gh<_i171.ExploreRemoteDataSource>()),
    );
    gh.factory<_i40.LoginUseCase>(
      () => _i40.LoginUseCase(gh<_i894.AuthRepo>()),
    );
    gh.factory<_i86.SignupUseCase>(
      () => _i86.SignupUseCase(gh<_i894.AuthRepo>()),
    );
    gh.factory<_i593.SignupCubit>(
      () => _i593.SignupCubit(gh<_i86.SignupUseCase>()),
    );
    gh.factory<_i953.GetMusclesUpcomingByGroupId>(
      () => _i953.GetMusclesUpcomingByGroupId(gh<_i625.ExploreRepo>()),
    );
    gh.factory<_i637.GetMusclesUpcomingUseCase>(
      () => _i637.GetMusclesUpcomingUseCase(gh<_i625.ExploreRepo>()),
    );
    gh.factory<_i1071.GetRandomMusclesUseCase>(
      () => _i1071.GetRandomMusclesUseCase(gh<_i625.ExploreRepo>()),
    );
    gh.factory<_i864.GetFoodCategoryUseCase>(
      () => _i864.GetFoodCategoryUseCase(gh<_i625.ExploreRepo>()),
    );
    gh.factory<_i474.LoginCubit>(
      () => _i474.LoginCubit(gh<_i40.LoginUseCase>()),
    );
    gh.singleton<_i77.ExploreCubit>(
      () => _i77.ExploreCubit(
        gh<_i1071.GetRandomMusclesUseCase>(),
        gh<_i637.GetMusclesUpcomingUseCase>(),
        gh<_i953.GetMusclesUpcomingByGroupId>(),
        gh<_i864.GetFoodCategoryUseCase>(),
      ),
    );
    return this;
  }
}

class _$DioModule extends _i545.DioModule {}
