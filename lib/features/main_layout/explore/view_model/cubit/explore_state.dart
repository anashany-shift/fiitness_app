import 'package:equatable/equatable.dart';
import 'package:fitness_app/core/helper/base_state.dart';
import 'package:fitness_app/domain/entities/responses/auth_entity/user_info_entity.dart';
import 'package:fitness_app/domain/entities/responses/explore_entities/food_category_entity.dart';
import 'package:fitness_app/domain/entities/responses/explore_entities/muscles_upcoming_entity.dart';
import 'package:fitness_app/domain/entities/responses/explore_entities/muscles_upcoming_group_entity.dart';
import 'package:fitness_app/domain/entities/responses/explore_entities/random_muscle_entity.dart';

class ExploreState extends Equatable {
  final bool isAllDataLoading;

  final BaseState<List<RandomMuscleEntity>>? randomMuscleEntity;
  final BaseState<List<MusclesUpcomingEntity>>? musclesUpcomingEntity;
  final BaseState<List<MusclesUpcomingGroupEntity>>? musclesUpcomingGroupEntity;
  final BaseState<List<FoodCategoryEntity>>? foodCategoryEntity;
  final BaseState<UserInfoEntity>? loggedUserDataEntity;

  const ExploreState({
    this.foodCategoryEntity,
    this.musclesUpcomingEntity,
    this.randomMuscleEntity,
    this.musclesUpcomingGroupEntity,
    this.loggedUserDataEntity,
    this.isAllDataLoading = false,
  });
  
  ExploreState copyWith({
    bool? isAllDataLoading,
    final BaseState<List<RandomMuscleEntity>>? randomMuscleEntity,
    final BaseState<List<MusclesUpcomingEntity>>? musclesUpcomingEntity,
    final BaseState<List<MusclesUpcomingGroupEntity>>?
    musclesUpcomingGroupEntity,
    final BaseState<List<FoodCategoryEntity>>? foodCategoryEntity,
    final BaseState<UserInfoEntity>? loggedUserDataEntity,
  }) {
    return ExploreState(
      isAllDataLoading: isAllDataLoading ?? this.isAllDataLoading,
      randomMuscleEntity: randomMuscleEntity ?? this.randomMuscleEntity,
      musclesUpcomingEntity:
          musclesUpcomingEntity ?? this.musclesUpcomingEntity,
      musclesUpcomingGroupEntity:
          musclesUpcomingGroupEntity ?? this.musclesUpcomingGroupEntity,
      foodCategoryEntity: foodCategoryEntity ?? this.foodCategoryEntity,
      loggedUserDataEntity: loggedUserDataEntity ?? this.loggedUserDataEntity,
    );
  }

  @override
  List<Object?> get props => [
    randomMuscleEntity,
    musclesUpcomingEntity,
    musclesUpcomingGroupEntity,
    foodCategoryEntity,
    loggedUserDataEntity,
    isAllDataLoading,
  ];
}
