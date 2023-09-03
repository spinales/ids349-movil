
import 'dart:math';

class Calculator {
  final weight;
  final height;

  double bmi = 0;

  Calculator(this.weight, this.height);

  double calculateBMI() {
    bmi = weight / pow(height / 100.0, 2.0);
    return bmi;
  }

  String calculateStatus(double bmi) {
    if (bmi < 18.5) {
      return "Peso inferior al normal";
    } else if (bmi >= 18.5 && bmi < 25) {
      return "Normal";
    } else if (bmi >= 25 && bmi < 29.9) {
      return "Sobrepeso";
    }
    return "Obesidad"; // mayor o igual que 30
  }

  String calculateRecommendations(double bmi) {
    if (bmi < 18.5) {
      return "Deberias comer más!";
    } else if (bmi >= 18.5 && bmi < 25) {
      return "Felicidades, sigue asi!!";
    } else if (bmi >= 25 && bmi < 29.9) {
      return "Deberia comenzar a hacer algo de ejercicio y acudir al medico!!";
    }
    return "Deberia acudir al medico urgentemente!!!"; // mayor o igual que 30
  }
}