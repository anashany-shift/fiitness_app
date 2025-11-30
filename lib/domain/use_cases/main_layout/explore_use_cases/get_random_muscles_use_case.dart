import 'package:fitness_app/core/helper/api_result.dart';
import 'package:fitness_app/domain/entities/responses/explore_entities/random_muscle_entity.dart';
import 'package:fitness_app/domain/repo/main_layout/explore_repo.dart';
import 'package:injectable/injectable.dart';
@injectable
class GetRandomMusclesUseCase {

  final ExploreRepo exploreRepo;

  GetRandomMusclesUseCase(this.exploreRepo);
  Future<ApiResult<List<RandomMuscleEntity>>>call()async{

    return await exploreRepo.getRandomMuscles();
  }
}