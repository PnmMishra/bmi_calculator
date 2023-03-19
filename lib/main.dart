import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmicalculator/icon_content.dart';
import 'package:bmicalculator/reusable_card.dart';
import 'package:bmicalculator/constant.dart';

enum Gender {
  male,
  female,
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI CALCULATOR',
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF111328),
        scaffoldBackgroundColor: Color(0xFF2D2D3F),
      ),
      home: Inputpage(),
    );
  }
}

class Inputpage extends StatefulWidget {
  const Inputpage({super.key});

  @override
  State<Inputpage> createState() => _InputpageState();
}

class _InputpageState extends State<Inputpage> {
  Gender? selectedgender;
  int height = 180;
  int weight = 60; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xFF323244),
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedgender = Gender.male;
                      });
                    },
                    child: reusablecard(
                      colour: selectedgender == Gender.male
                          ? activecardcolour
                          : inactivecardcolour,
                      cardchild: IconContent(
                        icon: FontAwesomeIcons.mars,
                        label: "MALE",
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedgender = Gender.female;
                      });
                    },
                    child: reusablecard(
                      colour: selectedgender == Gender.female
                          ? activecardcolour
                          : inactivecardcolour,
                      cardchild: IconContent(
                        icon: FontAwesomeIcons.venus,
                        label: "FEMALE",
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: reusablecard(
              colour: activecardcolour,
              cardchild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'HEIGHT',
                    style: klabelstyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: knumberstyle,
                      ),
                      Text(
                        'cm',
                        style: klabelstyle,
                      )
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.white,
                      thumbColor: Color(0xFFEB1555),
                      overlayColor: Color(0x29EB1555),
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 30.0),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      onChanged: (double newvalue) {
                        setState(() {
                          height = newvalue.round();
                        });
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: reusablecard(
                    colour: activecardcolour,
                    cardchild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('WEIGHT',
                         style:klabelstyle,
                        ),
                        Text(
                          weight.toString(),
                          style:knumberstyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Roundiconbutton(
                              icon: FontAwesomeIcons.minus,
                              onpressing:(){
                                // setState(() {
                                //   weight--;
                                // });
                              },
    
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            Roundiconbutton(
                              icon: FontAwesomeIcons.plus,
                              onpressing:(){
                                // setState(() {
                                //   weight++;
                                // });
                              },
                            ),

                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: reusablecard(
                    colour: activecardcolour,
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: bottomcontainercolour,
            margin: EdgeInsets.only(top: 10.0),
            width: double.infinity,
            height: bottomcontainerheight,
          ),
        ],
      ),
    );
  }
}

class Roundiconbutton extends StatelessWidget {
   Roundiconbutton({required this.icon , required this.onpressing});
   final IconData icon;
   final Function onpressing;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed:onpressing(),
        constraints: BoxConstraints.tightFor(
          height: 36.0,
          width: 36.0,
        ),
        
        shape: CircleBorder(),
        fillColor: Color(0xff0686776),
    );
  }
}
