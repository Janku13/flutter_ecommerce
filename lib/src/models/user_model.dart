// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  @JsonKey(name: 'fullname')
  String? name;
  String? id;
  String? email;
  String? password;
  String? phone;
  String? cpf;
  String? token;

  UserModel({
    this.id,
    this.name,
    this.email,
    this.password,
    this.phone,
    this.cpf,
    this.token,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  @override
  String toString() {
    return 'UserModel(name: $name, id: $id, email: $email, password: $password, phone: $phone, cpf: $cpf, token: $token)';
  }
}
