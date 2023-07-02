import 'package:equatable/equatable.dart';

class UserDataModel extends Equatable{
  final String? nameid;
  final String? mobilePhone;
  final String? lastName;
  final String? firstName;
  final String? userName;
  final String? photo;
  final String? roles;
  final int? exp;
  final String? iss;
  final String? aud;

  const UserDataModel({
    this.nameid,
    this.mobilePhone,
    this.lastName,
    this.firstName,
    this.userName,
    this.photo,
    this.roles,
    this.exp,
    this.iss,
    this.aud,
  });

  factory UserDataModel.fromJson(Map<String, dynamic> json) {
    return UserDataModel(
        nameid : json['nameid'],
        mobilePhone : json['MobilePhone'],
        lastName : json['LastName'],
    firstName : json['FirstName'],
    userName : json['UserName'],
    photo : json['Photo'],
    roles : json['roles'],
    exp : json['exp'],
    iss : json['iss'],
    aud : json['aud'],
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
    nameid,
    mobilePhone,
    lastName,
    firstName,
    userName,
    photo,
    roles,
    exp,
    iss,
    aud,
  ];
}
