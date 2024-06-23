import 'package:json_annotation/json_annotation.dart';
import 'package:kheti_pati/features/auth/domain/entity/auth_entity.dart';

part 'get_current_user_dto.g.dart';

@JsonSerializable()
class GetCurrentUserDto {
  @JsonKey(name: "_id")
  final String id;
  final String fullname;
  final String phone;
  final String username;
  final String password;
  final String securityQuestion;
  GetCurrentUserDto({
    required this.id,
    required this.fullname,
    required this.phone,
    required this.username,
    required this.password,
    required this.securityQuestion,
  });

  AuthEntity toEntity() {
    return AuthEntity(
        id: id,
        fullname: fullname,
        phone: phone,
        securityQuestion: securityQuestion,
        username: username,
        password: password);
  }

  factory GetCurrentUserDto.fromJson(Map<String, dynamic> json) =>
      _$GetCurrentUserDtoFromJson(json);

  Map<String, dynamic> toJson() => _$GetCurrentUserDtoToJson(this);
}
