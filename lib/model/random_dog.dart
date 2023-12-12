// To parse this JSON data, do
//
//     final randomDog = randomDogFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'random_dog.freezed.dart';
part 'random_dog.g.dart';

RandomDog randomDogFromJson(String str) => RandomDog.fromJson(json.decode(str));

String randomDogToJson(RandomDog data) => json.encode(data.toJson());

@freezed
class RandomDog with _$RandomDog {
  const factory RandomDog({
    @JsonKey(name: "message") String? message,
    @JsonKey(name: "status") String? status,
  }) = _RandomDog;

  factory RandomDog.fromJson(Map<String, dynamic> json) =>
      _$RandomDogFromJson(json);
}
