// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'registration_data_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegistrationDataDto _$RegistrationDataDtoFromJson(Map<String, dynamic> json) =>
    RegistrationDataDto(
      json['email'] as String,
      json['password'] as String,
    );

Map<String, dynamic> _$RegistrationDataDtoToJson(
        RegistrationDataDto instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
    };
