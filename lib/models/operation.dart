import 'dart:math';

import 'package:bmi_calculator/models/person.dart';

class Calculate {
  Person person;

  Calculate(this.person);

  double calc() {
    var weight = person.weight;
    var height = person.height;

    var bmi = (10000 * (weight / pow(height, 2)).toDouble());

    return bmi;
  }

  String text() {
    if (calc() < 18.5) {
      return 'vazn yetishmasligi';
    } else if (calc() >= 18.5 && calc() <= 24.9) {
      return 'normal vazn';
    } else {
      return 'vazn normadan ortiqcha, harakatni ko\'paytiring';
    }
  }
}
