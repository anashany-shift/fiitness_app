// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

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
import '../../api/client/execise_api_client.dart' as _i1009;
import '../../api/client/food_api_client.dart' as _i238;
import '../../api/client/main_layout_client/explore_api_client.dart' as _i984;
import '../../api/client/main_layout_client/workout_api_client.dart' as _i108;
import '../../api/data_source/auth/auth_remote_data_source_impl.dart' as _i153;
import '../../api/data_source/exercise/exercise_data_source_impl.dart' as _i670;
import '../../api/data_source/food_recommendation/food_recommendation_data_source_impl.dart'
    as _i594;
import '../../api/data_source/main_layout/explore_remote_data_source_impl.dart'
    as _i656;
import '../../api/data_source/main_layout/workout_remote_data_source_impl.dart'
    as _i1013;
import '../../data/data_source/auth/auth_remote_data_source.dart' as _i573;
import '../../data/data_source/exercise/exercise_data_source.dart' as _i717;
import '../../data/data_source/food_recommendation/food_recommendation_data_source.dart'
    as _i291;
import '../../data/data_source/main_layout/explore_remote_data_source.dart'
    as _i171;
import '../../data/data_source/main_layout/workout_remote_data_source.dart'
    as _i222;
import '../../data/repo_impl/auth/auth_repo_impl.dart' as _i947;
import '../../data/repo_impl/exercise/exercise_repo_impl.dart' as _i252;
import '../../data/repo_impl/food_recommendation_repo_impl/food_recommendation_repo_impl.dart'
    as _i553;
import '../../data/repo_impl/main_layout/explore_repo_impl.dart' as _i178;
import '../../data/repo_impl/main_layout/workout_repo_impl.dart' as _i640;
import '../../domain/repo/auth/auth_repo.dart' as _i894;
import '../../domain/repo/exercise_repo/exercise_repo.dart' as _i936;
import '../../domain/repo/food_recommendation/food_recommendation_repo.dart'
    as _i350;
import '../../domain/repo/main_layout/explore_repo.dart' as _i625;
import '../../domain/repo/main_layout/workout_repo.dart' as _i42;
import '../../domain/use_cases/auth/get_logged_user_data_use_case.dart'
    as _i804;
import '../../domain/use_cases/auth/login_use_case.dart' as _i40;
import '../../domain/use_cases/auth/signup_use_case.dart' as _i86;
import '../../domain/use_cases/exercise/get_difficulty_level_use_case.dart'
    as _i183;
import '../../domain/use_cases/exercise/get_exercise_datails_use_case.dart'
    as _i799;
import '../../domain/use_cases/food_recomendation/get_meal_datails_use_case.dart'
    as _i622;
import '../../domain/use_cases/food_recomendation/get_meals_by_category_use_case.dart'
    as _i519;
import '../../domain/use_cases/food_recomendation/get_meals_categories_use_case.dart'
    as _i819;
import '../../domain/use_cases/main_layout/explore_use_cases/get_food_category_use_case.dart'
    as _i864;
import '../../domain/use_cases/main_layout/explore_use_cases/get_muscles_upcoming_by_group_id.dart'
    as _i953;
import '../../domain/use_cases/main_layout/explore_use_cases/get_muscles_upcoming_use_case.dart'
    as _i637;
import '../../domain/use_cases/main_layout/explore_use_cases/get_random_muscles_use_case.dart'
    as _i1071;
import '../../domain/use_cases/main_layout/workout_use_cases/workout_get_muscle_upcoming_category.dart'
    as _i454;
import '../../domain/use_cases/main_layout/workout_use_cases/workout_get_muscle_upcoming_group.dart'
    as _i464;
import '../../features/auth/login/view_model/cubit/login_cubit.dart' as _i474;
import '../../features/auth/sign_up/view_model/cubit/signup_cubit.dart'
    as _i593;
import '../../features/exercise/view_model/cubit/exercise_cubit.dart' as _i777;
import '../../features/food_details/view_model/cubit/food_details_cubit.dart'
    as _i687;
import '../../features/food_recomndation_category/view_model/cubit/food_recommendation_cubit.dart'
    as _i475;
import '../../features/main_layout/explore/view_model/cubit/explore_cubit.dart'
    as _i77;
import '../../features/main_layout/workout/view_model/cubit/workout_cubit.dart'
    as _i351;
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
    gh.factory<_i238.FoodApiCLient>(
      () => _i238.FoodApiCLient(gh<_i361.Dio>(instanceName: 'secondaryApi')),
    );
    gh.factory<_i291.FoodRecommendationDataSource>(
      () => _i594.FoodRecommendationDataSourceImpl(gh<_i238.FoodApiCLient>()),
    );
    gh.factory<_i705.AuthApiClient>(
      () => _i705.AuthApiClient(gh<_i361.Dio>(instanceName: 'mainApi')),
    );
    gh.factory<_i1009.ExeciseApiClient>(
      () => _i1009.ExeciseApiClient(gh<_i361.Dio>(instanceName: 'mainApi')),
    );
    gh.factory<_i984.ExploreApiClient>(
      () => _i984.ExploreApiClient(gh<_i361.Dio>(instanceName: 'mainApi')),
    );
    gh.factory<_i108.WorkoutApiClient>(
      () => _i108.WorkoutApiClient(gh<_i361.Dio>(instanceName: 'mainApi')),
    );
    gh.factory<_i350.FoodRecommendationRepo>(
      () => _i553.FoodRecommendationRepoImpl(
        gh<_i291.FoodRecommendationDataSource>(),
      ),
    );
    gh.factory<_i717.ExerciseDataSource>(
      () => _i670.ExerciseDataSourceImpl(gh<_i1009.ExeciseApiClient>()),
    );
    gh.factory<_i573.AuthRemoteDataSource>(
      () => _i153.AuthRemoteDataSourceImpl(gh<_i705.AuthApiClient>()),
    );
    gh.factory<_i622.GetMealDatailsUseCase>(
      () => _i622.GetMealDatailsUseCase(gh<_i350.FoodRecommendationRepo>()),
    );
    gh.factory<_i519.GetMealsByCategoryUseCase>(
      () => _i519.GetMealsByCategoryUseCase(gh<_i350.FoodRecommendationRepo>()),
    );
    gh.factory<_i819.GetMealsCategoriesUseCase>(
      () => _i819.GetMealsCategoriesUseCase(gh<_i350.FoodRecommendationRepo>()),
    );
    gh.factory<_i171.ExploreRemoteDataSource>(
      () => _i656.ExploreRemoteDataSourceImpl(
        gh<_i984.ExploreApiClient>(),
        gh<_i238.FoodApiCLient>(),
      ),
    );
    gh.factory<_i894.AuthRepo>(
      () => _i947.AuthRepoImpl(gh<_i573.AuthRemoteDataSource>()),
    );
    gh.factory<_i687.FoodDetailsCubit>(
      () => _i687.FoodDetailsCubit(gh<_i622.GetMealDatailsUseCase>()),
    );
    gh.factory<_i625.ExploreRepo>(
      () => _i178.ExploreRepoImpl(gh<_i171.ExploreRemoteDataSource>()),
    );
    gh.factory<_i475.FoodRecommendationCubit>(
      () => _i475.FoodRecommendationCubit(
        gh<_i519.GetMealsByCategoryUseCase>(),
        gh<_i819.GetMealsCategoriesUseCase>(),
      ),
    );
    gh.factory<_i222.WorkoutRemoteDataSource>(
      () => _i1013.WorkoutRemoteDataSourceImpl(gh<_i108.WorkoutApiClient>()),
    );
    gh.factory<_i936.ExerciseRepo>(
      () => _i252.ExerciseRepoImpl(gh<_i717.ExerciseDataSource>()),
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
    gh.factory<_i864.GetFoodCategoryUseCase>(
      () => _i864.GetFoodCategoryUseCase(gh<_i625.ExploreRepo>()),
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
    gh.factory<_i804.GetLoggedUserDataUseCase>(
      () => _i804.GetLoggedUserDataUseCase(gh<_i894.AuthRepo>()),
    );
    gh.factory<_i42.WorkoutRepo>(
      () => _i640.WorkoutRepoImpl(gh<_i222.WorkoutRemoteDataSource>()),
    );
    gh.factory<_i183.GetDifficultyLevelUseCase>(
      () => _i183.GetDifficultyLevelUseCase(gh<_i936.ExerciseRepo>()),
    );
    gh.factory<_i799.GetExerciseDatailsUseCase>(
      () => _i799.GetExerciseDatailsUseCase(gh<_i936.ExerciseRepo>()),
    );
    gh.factory<_i474.LoginCubit>(
      () => _i474.LoginCubit(gh<_i40.LoginUseCase>()),
    );
    gh.factory<_i77.ExploreCubit>(
      () => _i77.ExploreCubit(
        gh<_i1071.GetRandomMusclesUseCase>(),
        gh<_i637.GetMusclesUpcomingUseCase>(),
        gh<_i953.GetMusclesUpcomingByGroupId>(),
        gh<_i864.GetFoodCategoryUseCase>(),
        gh<_i804.GetLoggedUserDataUseCase>(),
      ),
    );
    gh.factory<_i777.ExerciseCubit>(
      () => _i777.ExerciseCubit(
        gh<_i183.GetDifficultyLevelUseCase>(),
        gh<_i799.GetExerciseDatailsUseCase>(),
      ),
    );
    gh.factory<_i454.WorkoutGetMuscleUpcomingCategoryUseCase>(
      () =>
          _i454.WorkoutGetMuscleUpcomingCategoryUseCase(gh<_i42.WorkoutRepo>()),
    );
    gh.factory<_i464.WorkoutGetMuscleUpcomingGroupUseCase>(
      () => _i464.WorkoutGetMuscleUpcomingGroupUseCase(gh<_i42.WorkoutRepo>()),
    );
    gh.factory<_i351.WorkoutCubit>(
      () => _i351.WorkoutCubit(
        gh<_i454.WorkoutGetMuscleUpcomingCategoryUseCase>(),
        gh<_i464.WorkoutGetMuscleUpcomingGroupUseCase>(),
      ),
    );
    return this;
  }
}

class _$DioModule extends _i545.DioModule {}
