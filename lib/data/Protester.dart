import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class Protester {
  String phoneNumber;

  Protester({this.phoneNumber});

  Protester.fromJson(Map<String, dynamic> json)
      : phoneNumber = json['phoneNumber'];

  Map<String, dynamic> toJson() => {
    "phoneNumber": phoneNumber,
  };
}
