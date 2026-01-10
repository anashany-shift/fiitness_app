import 'package:json_annotation/json_annotation.dart';
part 'levels_dto.g.dart';
@JsonSerializable()
class LevelDto {
  final String id;
  final String name;

  LevelDto({
    required this.id,
    required this.name,
  });

  factory LevelDto.fromJson(Map<String, dynamic> json) =>
      _$LevelDtoFromJson(json);

  Map<String, dynamic> toJson() => _$LevelDtoToJson(this);
}
