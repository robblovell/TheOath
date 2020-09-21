import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class Token {
  String uid;
  String phoneNumber;

  Token({this.uid, this.phoneNumber});

  Token.fromJson(Map<String, dynamic> json)
      : uid = json['uid'],
        phoneNumber = json['phoneNumber'];

  Map<String, dynamic> toJson() => {
        'uid': uid,
        "phoneNumber": phoneNumber,
      };
}
