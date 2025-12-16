import 'package:fitness_app/api/models/responses/explore/food_category_response.dart';
import 'package:fitness_app/api/models/responses/explore/muscles_upcoming_group_response.dart';
import 'package:fitness_app/api/models/responses/explore/muscles_upcoming_response.dart';
import 'package:fitness_app/api/models/responses/explore/random_muscles_response.dart';
import 'package:fitness_app/domain/entities/responses/explore_entities/food_category_entity.dart';
import 'package:fitness_app/domain/entities/responses/explore_entities/muscles_upcoming_entity.dart';
import 'package:fitness_app/domain/entities/responses/explore_entities/muscles_upcoming_group_entity.dart';
import 'package:fitness_app/domain/entities/responses/explore_entities/random_muscle_entity.dart';

extension RandomMusclesResponseMapper on RandomMusclesResponse {
  List<RandomMuscleEntity> toEntity() {
    return muscles.map((muscles) {
      return RandomMuscleEntity(
        id: muscles.id,
        name: muscles.name,
        image: muscles.image ?? "",
      );
    }).toList();
  }
}

extension MusclesUpcomingResponseMapper on MusclesUpcomingResponse {
  List<MusclesUpcomingEntity> toEntity() {
    return musclesGroup.map((muscles) {
      return MusclesUpcomingEntity(id: muscles.id, name: muscles.name);
    }).toList();
  }
}
extension MusclesUpcomingFroupResponseMapper on MusclesUpcomingGroupResponse {
  List<MusclesUpcomingGroupEntity> toEntity() {
    return muscles.map((muscles) {
      return MusclesUpcomingGroupEntity(id: muscles.id, name: muscles.name,image: muscles.image??'');
    }).toList();
  }
}
