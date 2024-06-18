// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_current_user_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetCurrentUserDto _$GetCurrentUserDtoFromJson(Map<String, dynamic> json) =>
    GetCurrentUserDto(
      id: json['_id'] as String,
      fullname: json['fullname'] as String,
      phone: json['phone'] as String,
      image: json['image'] as String,
      username: json['username'] as String,
      securityQuestion: json['securityQuestion'] as String,
    );

Map<String, dynamic> _$GetCurrentUserDtoToJson(GetCurrentUserDto instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'fullname': instance.fullname,
      'phone': instance.phone,
      'image': instance.image,
      'username': instance.username,
      'securityQuestion': instance.securityQuestion,
    };
