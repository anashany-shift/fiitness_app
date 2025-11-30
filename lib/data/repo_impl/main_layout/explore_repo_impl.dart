import 'package:fitness_app/api/mapper/main_layout/explore_mapper.dart';
import 'package:fitness_app/api/models/responses/explore/muscles_upcoming_response.dart';
import 'package:fitness_app/api/models/responses/explore/random_muscles_response.dart';
import 'package:fitness_app/core/helper/api_result.dart';
import 'package:fitness_app/core/helper/safe_api_call.dart';
import 'package:fitness_app/data/data_source/main_layout/explore_remote_data_source.dart';
import 'package:fitness_app/domain/entities/responses/explore_entities/food_category_entity.dart';
import 'package:fitness_app/domain/entities/responses/explore_entities/muscles_upcoming_entity.dart';
import 'package:fitness_app/domain/entities/responses/explore_entities/muscles_upcoming_group_entity.dart';
import 'package:fitness_app/domain/entities/responses/explore_entities/random_muscle_entity.dart';
import 'package:fitness_app/domain/repo/main_layout/explore_repo.dart';
import 'package:injectable/injectable.dart';
@Injectable(as:ExploreRepo )
class ExploreRepoImpl implements ExploreRepo{
final ExploreRemoteDataSource exploreRemoteDataSource;

  ExploreRepoImpl(this.exploreRemoteDataSource);
@override
  Future<ApiResult<List<RandomMuscleEntity>>> getRandomMuscles() async{
   return safeApiCall<RandomMusclesResponse,List<RandomMuscleEntity>>(() async{
     final response= await exploreRemoteDataSource.getRandomMuscles();
     return response;
    }, (response) =>response.toEntity());
  }

  @override
  Future<ApiResult<List<MusclesUpcomingEntity>>> getMusclesUpcoming()async {
     return safeApiCall<MusclesUpcomingResponse,List<MusclesUpcomingEntity>>(() async{
     final response= await exploreRemoteDataSource.getMusclesUpcoming();
     return response;
    }, (response) =>response.toEntity());
  }
  @override
  Future<ApiResult<List<MusclesUpcomingGroupEntity>>> getMusclesUpcomingGroup({required String groupId})async {
   return safeApiCall(()async {
    final response=await exploreRemoteDataSource.getMusclesUpcomingGroup(groupId: groupId);
    return response;
     
   }, (response) =>response.toEntity() ,);
  }

  @override
  Future<ApiResult<List<FoodCategoryEntity>>> getFoodCategories() {
    return safeApiCall(() async {
      final response = await exploreRemoteDataSource.getFoodCategories();
      return response;
    }, (response) => response.toEntity());
  }

}