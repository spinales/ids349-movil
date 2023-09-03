import 'package:bmi_calculator/calculator.dart';
import 'package:bmi_calculator/design.dart';
import 'package:bmi_calculator/icon_content.dart';
import 'package:bmi_calculator/result_page.dart';
import 'package:flutter/material.dart';
import 'card_widget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum Gender { male, female }

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Gender? pressedGender = Gender.male;
  int height = 120;
  int weight = 60;
  int age = 18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator'),
      ),
      body: Column(
        children: [
          Expanded(
              child: Row(
                children: [
                  Expanded(
                      child: CardWidget(
                        action: () {
                          setState(() {
                            pressedGender = Gender.male;
                          });
                        },
                        color: pressedGender == Gender.male
                          ? kActiveCardColor : kInactiveCardColor,
                        cardContent: IconContent(
                          text: 'MALE',
                          icon: FontAwesomeIcons.mars,
                        ),
                      ),
                  ),
                  Expanded(
                      child: CardWidget(
                        action: (){
                          setState(() {
                            pressedGender = Gender.female;
                          });
                        },
                        color: pressedGender == Gender.female
                            ? kActiveCardColor : kInactiveCardColor,
                        cardContent: CardWidget(
                          color: pressedGender == Gender.female
                              ? kActiveCardColor
                              : kInactiveCardColor,
                          cardContent:
                          IconContent(text: 'FEMALE', icon: FontAwesomeIcons.venus),
                          action: () {
                            setState(() {
                              pressedGender = Gender.female;
                            });
                          },
                        ),
                      ),
                  ),
                ],
              )
          ),
          Expanded(

              child: CardWidget(
                color: kInactiveCardColor,
                action: (){},
                cardContent: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Height',
                      style: kmainTextStyle,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      mainAxisAlignment: MainAxisAlignment.center,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(height.toString(),
                          style: const TextStyle(
                            fontSize: 50.0,
                          ),
                        ),
                        const Text(' cm',
                          style: kmainTextStyle,
                        ),
                      ],
                    ),
                    Slider(
                        value: height.toDouble(),
                        min: 120.0,
                        max: 220.0,
                        onChanged: (Newvalue) {
                          setState(() {
                            height = Newvalue.toInt();
                          });
                        }
                    ),
                  ],
                ),
              ),
          ),
          Expanded(
              child: Row(
                children: [
                  Expanded(
                      child: CardWidget(
                        action: (){},
                        color: kInactiveCardColor,
                        cardContent: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('Weight',
                              style: kmainTextStyle,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              textBaseline: TextBaseline.alphabetic,
                              children: [
                                Text(weight.toString(),
                                  style: const TextStyle(
                                    fontSize: 50.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const Text(' KG',
                                  style: kmainTextStyle,
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      FloatingActionButton(
                                          backgroundColor: Colors.white,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(10.0),
                                          ),
                                          child: const Icon(FontAwesomeIcons.plus),
                                          onPressed: () {
                                            setState(() {
                                              weight++;
                                            });
                                          }
                                      ),
                                      const SizedBox(
                                        width: 10.0,
                                      ),
                                      FloatingActionButton(
                                          backgroundColor: Colors.white,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(10.0),
                                          ),
                                          child: const Icon(FontAwesomeIcons.minus),
                                          onPressed: () {
                                            setState(() {
                                              weight > 0 ? weight-- : weight;
                                            });
                                          }
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                  ),
                  Expanded(
                      child: CardWidget(
                        action: (){},
                        color: kInactiveCardColor,
                        cardContent: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('Age',
                              style: kmainTextStyle,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              textBaseline: TextBaseline.alphabetic,
                              children: [
                                Text(age.toString(),
                                  style: const TextStyle(
                                    fontSize: 50.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const Text(' yr',
                                  style: kmainTextStyle,
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FloatingActionButton(
                                  backgroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  child: const Icon(FontAwesomeIcons.plus),
                                  onPressed: () {
                                    setState(() {
                                      age < 106 ? age++ : age;
                                    });
                                  }
                                ),
                                const SizedBox(
                                  width: 10.0,
                                ),
                                FloatingActionButton(
                                  backgroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  child: const Icon(FontAwesomeIcons.minus),
                                  onPressed: () {
                                    setState(() {
                                      age > 0 ? age-- : age;
                                    });
                                  }
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                  ),
                ],
              ),
          ),

          GestureDetector(
            onTap: () {
              Calculator calc = Calculator(height, weight);
              double result = calc.calculateBMI();
              Navigator.push(context,
                MaterialPageRoute(builder: (context) {
                  // todo: crear una nueva pagina para los resultados
                  // todo: que tome como parametro el resultdado del calculo
                  // todo: En la pantalla mostrar mensaje de recomendacion en base a imc de la persona
                  // todo: que la recomendaciones se generan en la misma clase de calculator
                  return ResultPage(
                    message: calc.calculateStatus(result),
                    recommendation: calc.calculateRecommendations(result),
                    bmi: result,
                  );
                })
              );
            },
            child: Container(
              width: double.infinity,
              height: 60.0,
              color: const Color(0xFFEB1555),
              child: const Center(
                child: Text('Calculate',
                  style: kMainButtonTextStyle,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
