import 'dart:math';

class BmiServices {
  double calculate(int weight, double height) {
    return weight / pow(height / 100, 2);
  }

  String getResultText(int weight, double height) {
    final result = calculate(weight, height);

    if (result < 16) {
      return 'Severe Thinness';
    }
    if (16 < result && result < 17) {
      return 'Moderate Thinness';
    }
    if (17 < result && result < 18.5) {
      return 'Mild Thinness';
    }
    if (18.5 < result && result < 25) {
      return 'Normal';
    }
    if (25 < result && result < 30) {
      return 'Overweight';
    }
    if (30 < result && result < 35) {
      return 'Obese Class I';
    }
    if (result > 40) {
      return 'Obese Class II';
    }

    return 'Calculate again';
  }

  String getInterpretation(int weight, double height) {
    final result = calculate(weight, height);
    if (result >= 25) {
      return 'You have a higher than normal body weight. Try to exercise more.';
    } else if (result >= 18.5) {
      return 'You have a normal body weight. Good job!';
    } else {
      return 'You have a lower than normal body weight. You can eat a bit more.';
    }
  }
}


// Classification	BMI	BMI Prime
// Severe Thinness	< 16	< 0.64
// Moderate Thinness	16 - 17	0.64 - 0.68
// Mild Thinness	17 - 18.5	0.68 - 0.74
// Normal	18.5 - 25	0.74 - 1
// Overweight	25 - 30	1 - 1.2
// Obese Class I	30 - 35	1.2- 1.4
// Obese Class II	35 - 40	1.4 - 1.6
// Obese Class III	> 40	> 1.6