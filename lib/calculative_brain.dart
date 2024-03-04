import 'dart:math';

class Calculator{
  final int height;
  final int weight;
  double bmi = 0.0;
  Calculator({required this.height,required this.weight,this.bmi=0.0});



  String calculateBMI()
  {
    bmi = weight / pow(height/100, 2);
    return bmi.toStringAsFixed(1);
  }

  String? getResult()
  {
    if (bmi>=25)
      {
        return 'OVERWEIGHT';
      }
    else if (bmi >=18)
      {
        return 'NORMAL';
      }
    else if (bmi < 18.5 )
      {
        return 'UNDERWEIGHT';
      }
  }

  String? getInterpretation()
  {
    if (bmi>=25)
    {
      return 'You are Overweight, eat less you Fat bitch';
    }
    else if (bmi >=18)
    {
      return 'You are Normal, Keep on Athlete';
    }
    else if (bmi < 18.5 )
    {
      return'You are Underweight, You should eat more.....Skinny bitch !!';
    }
  }
}