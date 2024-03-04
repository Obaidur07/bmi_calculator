import 'package:bmi_calculator/results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'reusable_Card.dart';
import 'constants.dart';
import 'calculative_brain.dart';

enum Gender {
  male,female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  Gender? selectedGender;
  int height =180;
  int weight = 50;
  int age = 15;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('BMI CALCULATOR')),
        backgroundColor: Color(0xFF0A0E21),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(child: Row(
            children: [
              Expanded(child: GestureDetector(
                onTap: ()
                {
                  setState(() {
                    selectedGender = Gender.male;
                  });
                },
                child: ReusableCard(
                  colour: selectedGender == Gender.male ? activeCardColour : inactiveCardColour,
                  cardChild: IconContent(
                    icon: FontAwesomeIcons.person,
                    label: 'MALE',
                  ),
                ),
              ),
              ),
              Expanded(child: GestureDetector(
                onTap: ()
                {
                  setState(() {
                    selectedGender = Gender.female;
                  });
                },
                child: ReusableCard(
                  colour: selectedGender == Gender.female ? activeCardColour : inactiveCardColour,
                  cardChild:  IconContent(
                    icon: FontAwesomeIcons.personDress,
                    label: 'FEMALE',
                  ),
                ),
              ),
              ),
            ],
          ),
          ),
          Expanded(child: ReusableCard(colour: activeCardColour,
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('HEIGHT',
                  style: labelTextStyle,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(height.toString(),
                    style: numTextStyle,
                    ),
                    Text('cm',
                      style: labelTextStyle,
                    ),
                  ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                    overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
                    thumbColor: Color(0xFFEB1555),
                    overlayColor: Color(0x29EB1555),
                    activeTrackColor: Colors.white,
                  ),
                  child: Slider(value: height.toDouble(),
                    min: 0.0,
                    max: 300.0,
                    inactiveColor: Color(0xFF8D8E98),
                    onChanged: (double newValue){
                    setState(() {
                      height=newValue.round();
                    });
                    },
                  ),
                )
              ],
            ),
          ),
          ),
          Expanded(child: Row(
            children: [
              Expanded(child: ReusableCard(colour: activeCardColour,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('WEIGHT',style: labelTextStyle,),
                    Text(weight.toString(),style: numTextStyle,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RoundIconButton(
                          icon: FontAwesomeIcons.minus,
                          onPressed: (){
                            setState(() {
                              weight--;
                            });
                          },
                        ),
                        SizedBox(width: 20.0),
                        RoundIconButton(
                            icon: FontAwesomeIcons.plus,
                          onPressed: (){
                              setState(() {
                                weight++;
                              });
                          },
                        ),
                      ],
                    )
                  ],
                ),
              ),
              ),
              Expanded(child: ReusableCard(
                  colour: activeCardColour,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('AGE',style: labelTextStyle),
                    Text(age.toString(),style: numTextStyle,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RoundIconButton(icon: FontAwesomeIcons.minus,
                            onPressed:(){
                          setState(() {
                            age--;
                          });
                            }
                            ),
                        SizedBox(width: 20.0),
                        RoundIconButton(icon: FontAwesomeIcons.plus,
                            onPressed:(){
                              setState(() {
                                age++;
                              });
                            }
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              ),
            ],
          ),
          ),
          BottomButton(onTap: (){
            Calculator calc = Calculator(height: height,weight: weight, bmi: 0.0);
            calc.calculateBMI();
            Navigator.push(context,MaterialPageRoute(builder:(context) => ResultsPage(
              bmiResult: calc.calculateBMI(),
              resultText: calc.getResult()!,
              interpretation: calc.getInterpretation()!,
            )));
          },
            title: 'CALCULATE',
          ),
        ],
      )
    );
  }
}

class BottomButton extends StatelessWidget {

  final Function onTap;
  final String title;

  BottomButton({required this.onTap,required this.title});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){},
      child: Container(
        child: Center(
          child: Text(title,
            style: TextStyle(
              wordSpacing: 5.0,
              letterSpacing: 1.0,
              fontWeight: FontWeight.bold,
              fontSize: 25.0,
              color: Colors.white,
            ),
          ),
        ),
        margin: EdgeInsets.all(10.0),
        width: double.infinity,
        height: bottomContainerHeight,
        decoration: BoxDecoration(
          color: bottomContainerColour,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}


class RoundIconButton extends StatelessWidget {

  RoundIconButton({required this.icon,required this.onPressed});
  final IconData icon;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: (){},
      elevation: 6.0,
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}

/*
Navigator.push(context,MaterialPageRoute(builder:(context) => ResultsPage()));*/
