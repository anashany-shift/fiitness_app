import 'package:dio/dio.dart';
import 'package:fitness_app/api/models/responses/exercise/difficulty_level_response.dart';
import 'package:fitness_app/api/models/responses/exercise/exercise_response.dart';
import 'package:fitness_app/core/constants/api_constant.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

part 'execise_api_client.g.dart';
@injectable
@RestApi()
abstract class ExeciseApiClient {
  @factoryMethod
  factory ExeciseApiClient(@Named("mainApi") Dio dio) = _ExeciseApiClient;

  @GET(ApiConstant.getDifficultyLivelByPrimeMover)
  Future<DifficultyLevelsResponse> getDifficultyLivelByPrimeMover(
    @Query("primeMoverMuscleId")String primeMoverMuscleId,
  );

  @GET(ApiConstant.getExerciseDetails)
  Future<ExerciseResponse> getExerciseDetails(
    @Query("primeMoverMuscleId")String primeMoverMuscleId,
    @Query("difficultyLevelId")String difficultyLevelId,

  );


}
