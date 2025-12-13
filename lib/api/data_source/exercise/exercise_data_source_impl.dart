import 'package:fitness_app/api/client/execise_api_client.dart';
import 'package:fitness_app/api/models/responses/exercise/difficulty_level_response.dart';
import 'package:fitness_app/api/models/responses/exercise/exercise_response.dart';
import 'package:fitness_app/data/data_source/exercise/exercise_data_source.dart';
import 'package:injectable/injectable.dart';

@Injectable(as:ExerciseDataSource )
 class ExerciseDataSourceImpl implements ExerciseDataSource{

  final ExeciseApiClient execiseApiClient;

  ExerciseDataSourceImpl(this.execiseApiClient);
  @override
  Future<DifficultyLevelsResponse> getDifficulty({required String primeMoveId})async {
    return execiseApiClient.getDifficultyLivelByPrimeMover(primeMoveId);
  }
  @override
  Future<ExerciseResponse> getExerciseDetails({required String primeMoveId, required String levelId})async {
   return execiseApiClient.getExerciseDetails(primeMoveId, levelId);
  }
}