sealed class ExploreCubitEvent {}

class ExploreGetAllData extends ExploreCubitEvent {}
class ExploreGetRandomMuscle extends ExploreCubitEvent {}
class ExploreGetMuscleUpcoming extends ExploreCubitEvent {}
class ExploreMuscleGroupEvent extends ExploreCubitEvent{
  final String? groupId;

  ExploreMuscleGroupEvent(this.groupId);
}
class ExploreGetFoodCategories extends ExploreCubitEvent {}
class GetLoggedUserData extends ExploreCubitEvent {}