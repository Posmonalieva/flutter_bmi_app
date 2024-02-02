import 'package:flutter_bmi_app/helpers/app_enums.dart';

class ClientHomeModel {
  Gender gender;
  double height;
  int weight;
  int age;

  ClientHomeModel({
    required this.gender,
    required this.height,
    required this.weight,
    required this.age,
  });
}
