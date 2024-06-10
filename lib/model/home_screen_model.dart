// To parse this JSON data, do
//
//     final carosalModel = carosalModelFromJson(jsonString);

import 'dart:convert';

CarosalModel carosalModelFromJson(String str) =>
    CarosalModel.fromJson(json.decode(str));

String carosalModelToJson(CarosalModel data) => json.encode(data.toJson());

class CarosalModel {
  String? text;
  String? url;
  String? image;

  CarosalModel({
    this.text,
    this.url,
    this.image,
  });

  factory CarosalModel.fromJson(Map<String, dynamic> json) => CarosalModel(
        text: json["text"],
        url: json["url"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "text": text,
        "url": url,
        "image": image,
      };
}
