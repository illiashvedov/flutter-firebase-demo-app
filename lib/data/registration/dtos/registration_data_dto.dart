import 'package:json_annotation/json_annotation.dart';

part 'registration_data_dto.g.dart';

@JsonSerializable()
class RegistrationDataDto {
  final String email;
  final String password;

  const RegistrationDataDto(
    this.email,
    this.password,
  );

  Map<String, dynamic> toJson() => _$RegistrationDataDtoToJson(this);

  factory RegistrationDataDto.fromJson(Map<String, dynamic> json) => _$RegistrationDataDtoFromJson(json);
}
