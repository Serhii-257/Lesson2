import 'dart:io';
import 'dart:math';

void main() {
  taskOne();
  taskTwo();
  taskThree();
  taskFour();
  taskFive();
}

void taskOne() {
  double? number;
  while (number == null || number < 0) {
    print(
        'Привіт! Для того, щоб дізнатися свою оцінку, будь ласка, введіть ваш бал:');
    String? input = stdin.readLineSync();
    number = double.tryParse(input ?? '');
    if (number == null || number < 0) {
      print('haha nice try. Неправильне введення, спробуйте ще раз ');
    }
  }

  if (number >= 90) {
    print('оцінка A');
  } else if (number >= 80 && number <= 89) {
    print('оцінка B');
  } else if (number >= 70 && number <= 79) {
    print('оцінка C');
  } else if (number >= 60 && number <= 69) {
    print('оцінка D');
  } else if (number < 60) {
    print('оцінка F');
  }
}

void taskTwo() {
  var random = Random();
  int randomNumber = random.nextInt(100) + 1;

  print('Я згенерував число від 1 до 100. Спробуй вгадати його!');
  while (true) {
    stdout.write('Введи своє число:');
    int? userGuess = int.tryParse(stdin.readLineSync()!);
    if (userGuess == null) {
      print('Будь ласка, введи правильне число.');
      continue;
    }
    if (userGuess < randomNumber) {
      print('Загадане число більше.');
    } else if (userGuess > randomNumber) {
      print('Загадане число менше.');
    } else {
      print('Вітаю! Ти вгадав число $randomNumber');
      break;
    }
  }
}

void taskThree() {
  while (true) {
    stdout.write('Введіть число більше нуля: ');
    int? number = int.tryParse(stdin.readLineSync()!);
    if (number == null || number <= 0) {
      print('Будь ласка, введи правильне число, більше нуля: ');
      continue;
    } else {
      int factorial = 1;
      int i = 1;
      while (i <= number) {
        factorial *= i;
        i++;
      }
      print('Факторіал числа $number: $factorial');
      break;
    }
  }
}

void taskFour() {
  double celsiusToFahrenheit(double celsius) {
    return (celsius * 9 / 5) + 32;
  }

  double fahrenheitToCelsius(double fahrenheit) {
    return (fahrenheit - 32) * 5 / 9;
  }

  while (true) {
    print('Введіть температуру або "exit" для виходу:');
    String? input = stdin.readLineSync();

    if (input != null && input.toLowerCase() == 'exit') {
      print('Програма завершена.');
      break;
    }
    double? temperature;
    try {
      temperature = double.parse(input!);
    } catch (e) {
      print('Невірний ввід. Будь ласка, введіть число або "exit".');
      continue;
    }

    print('Введіть систему конвертації (C для Цельсія, F для Фаренгейта):');
    String? conversionType = stdin.readLineSync()?.toUpperCase();

    if (conversionType == 'C') {
      double fahrenheit = celsiusToFahrenheit(temperature);
      print('$temperature C = $fahrenheit F');
    } else if (conversionType == 'F') {
      double celsius = fahrenheitToCelsius(temperature);
      print('$temperature F = $celsius C');
    } else {
      print('Невірний тип конвертації. Введіть C або F.');
    }
  }
}

void taskFive() {
  double add(double num1, double num2) {
    return num1 + num2;
  }

  double subtract(double num1, double num2) {
    return num1 - num2;
  }

  double multiply(double num1, double num2) {
    return num1 * num2;
  }

  double divide(double num1, double num2) {
    if (num2 == 0) {
      print('Помилка! Ділення на нуль.');
      return 0;
    }
    return num1 / num2;
  }

  while (true) {
    print('Введіть перше число (або "exit" для виходу):');
    String? input1 = stdin.readLineSync();

    if (input1 == 'exit') {
      print('Програма завершена.');
      break;
    }

    double? num1 = double.tryParse(input1!);
    if (num1 == null) {
      print('Неправильний ввід. Спробуйте ще раз.');
      continue;
    }

    print('Введіть друге число:');
    String? input2 = stdin.readLineSync();
    double? num2 = double.tryParse(input2!);

    if (num2 == null) {
      print('Неправильний ввід. Спробуйте ще раз.');
      continue;
    }

    print('Виберіть операцію (+, -, *, /):');
    String? operation = stdin.readLineSync();

    if (operation == null || !['+', '-', '*', '/'].contains(operation)) {
      print('Невідома операція. Спробуйте ще раз.');
      continue;
    }

    double result;

    switch (operation) {
      case '+':
        result = add(num1, num2);
        print('Результат: $result');
        break;
      case '-':
        result = subtract(num1, num2);
        print('Результат: $result');
        break;
      case '*':
        result = multiply(num1, num2);
        print('Результат: $result');
        break;
      case '/':
        result = divide(num1, num2);
        print('Результат: $result');
        break;
      default:
        print('Невідома операція.');
    }
  }
}
