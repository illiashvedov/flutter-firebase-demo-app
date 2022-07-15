import 'package:json_annotation/json_annotation.dart';

part 'auth_info_dto.g.dart';

@JsonSerializable()
class AuthInfoDto {
  final String userId;

  const AuthInfoDto(this.userId);

  Map<String, dynamic> toJson() => _$AuthInfoDtoToJson(this);

  factory AuthInfoDto.fromJson(Map<String, dynamic> json) => _$AuthInfoDtoFromJson(json);
}
