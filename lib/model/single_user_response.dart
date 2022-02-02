import 'package:flutter_dio/model/user.dart';
import 'package:json_annotation/json_annotation.dart';
part 'single_user_response.g.dart';

//29:00
@JsonSerializable()
class SingleUserResponse{

  SingleUserResponse();

  @JsonKey(name : "data")
  late User user;

  factory SingleUserResponse.fromJson(Map<String, dynamic> json) => _$SingleUserResponseFromJson(json);
  Map<String, dynamic> toJson() => _$SingleUserResponseToJson(this);
}