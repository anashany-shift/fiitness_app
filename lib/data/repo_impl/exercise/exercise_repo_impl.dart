import 'package:fitness_app/api/mapper/exerise_mapper.dart';
import 'package:fitness_app/core/helper/api_result.dart';
import 'package:fitness_app/core/helper/safe_api_call.dart';
import 'package:fitness_app/data/data_source/exercise/exercise_data_source.dart';
import 'package:fitness_app/domain/entities/responses/exercise/difficulty_levels_entity.dart';
import 'package:fitness_app/domain/entities/responses/exercise/exercise_entity.dart';
import 'package:fitness_app/domain/repo/exercise_repo/exercise_repo.dart';
import 'package:injectable/injectable.dart';
@Injectable(as: ExerciseRepo)
class ExerciseRepoImpl implements ExerciseRepo{
final ExerciseDataSource exerciseDataSource;

  ExerciseRepoImpl(this.exerciseDataSource);
   @override
  Future<ApiResult<List<DifficultyLevelsEntity>>> getDifficultyLevel({required String primeMoveId})async {
   return safeApiCall(()async {
     final response= await exerciseDataSource.getDifficulty(primeMoveId: primeMoveId);
     return response;
   }, (response) => response.toEntity(),);
  
  }
   @override
  Future<ApiResult<List<ExerciseEntity>>> getExerciseDetails({required String primeMoveId,required String levelId})async {
   return safeApiCall(()async {
     final response= await exerciseDataSource.getExerciseDetails(primeMoveId: primeMoveId,levelId:  levelId);
     return response;
   }, (response) => response.toEntity(),);
  
  }

}