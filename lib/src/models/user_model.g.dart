// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      id: json['id'] as String,
      name: json['fullname'] as String,
      email: json['email'] as String,
      password: json['password'] as String?,
      phone: json['phone'] as String?,
      cpf: json['cpf'] as String?,
      token: json['token'] as String?,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'fullname': instance.name,
      'id': instance.id,
      'email': instance.email,
      'password': instance.password,
      'phone': instance.phone,
      'cpf': instance.cpf,
      'token': instance.token,
    };
