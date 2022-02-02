//import 'package:json_annotation/json_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';
@JsonSerializable() //27:25

//18:23
class User{
  //21:52
  @JsonKey(name : "id")
  late int id;

  @JsonKey(name : "email")
  late String email;

  @JsonKey(name : "first_name")
  late String firstName;

  @JsonKey(name : "last_name")
  late String lastName;

  @JsonKey(name : "avatar")
  late String avatar;

  User();

  //23:18 fix error watch 25:22
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
