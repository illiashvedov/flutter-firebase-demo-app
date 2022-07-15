import 'package:json_annotation/json_annotation.dart';

part 'registration_response_dto.g.dart';

@JsonSerializable()
class RegistrationResponseDto {
  final String userId;

  const RegistrationResponseDto(
    this.userId,
  );

  Map<String, dynamic> toJson() => _$RegistrationResponseDtoToJson(this);

  factory RegistrationResponseDto.fromJson(Map<String, dynamic> json) => _$RegistrationResponseDtoFromJson(json);
}
