import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'reusable_card.dart';
import 'constant.dart';
import 'results_page.dart';
import 'calculator_brain.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {



  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  Gender selected = Gender.female;
  int height=180;
  int weight = 60;
  int age=19;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
       children: [
         Expanded(
           child: Row(
             children: [
               Expanded(
                 child: GestureDetector(
                   onTap: (){
                     //print('male is pressed');
                      setState(() {
                         selected = Gender.male;
                      });
                   },
                   child: ReusableCard(
                     colour: selected == Gender.male ? tiles_colour : on_gest_color,
                     cardChild: content(
                       icon_: FontAwesomeIcons.mars,
                       name: 'MALE',
                     ),
                   ),
                 ),
               ),

               Expanded(child:
               GestureDetector(
                 onTap: (){
                   setState(() {
                     selected = Gender.female;
                   });
                 },

                child:  ReusableCard(

                  colour: selected == Gender.female ? tiles_colour : on_gest_color,
                   cardChild: content(
                     icon_: FontAwesomeIcons.venus,
                     name: 'FEMALE',
                   ),
                 ),
                ),
               ),

             ],
           ),
         ),
         Expanded(
             child: ReusableCard(
               colour: tiles_colour,
               cardChild: Column(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   Text('HEIGHT',style: labeltext_style),
                   Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                     crossAxisAlignment: CrossAxisAlignment.baseline,
                     textBaseline: TextBaseline.alphabetic,
                     children: [
                       Text(height.toString(), style: knuber_style,),
                       Text('CM', style: labeltext_style,),
                     ],
                   ),
                  SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        inactiveTrackColor: Color(0XFF8D8E98),
                        activeTrackColor: Colors.white,
                        thumbColor: Color(0xFFEB1555),
                        thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                        overlayShape: RoundSliderOverlayShape(overlayRadius: 25.0),
                        overlayColor: Color(0x39EB1555)
                      ),
                      child:  Slider(
                        value: height.toDouble(),
                        min: 120,
                        max: 220,
                        onChanged: (double newval){
                          setState(() {
                            height = newval.round();
                          });
                        },
                      ),
                  ),
                 ],
               ),
             ),
         ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    colour: tiles_colour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('WEIGHT', style: labeltext_style,),
                        Text(weight.toString(),style: knuber_style,)
                        ,Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Roundiconbutton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: (){
                                setState(() {
                                  if(weight>0) weight--;
                                });
                              },
                            ),
                            SizedBox(width: 10.0,),
                            Roundiconbutton(
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
                  colour: tiles_colour,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('AGE', style: labeltext_style,),
                      Text(age.toString(), style: knuber_style,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Roundiconbutton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: (){
                                setState(() {
                                  age--;
                                });
                              },
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Roundiconbutton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: (){
                                setState(() {
                                  age++;
                                });
                              },
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
           onTap: (){

           },
           child: Container(
             color: bottom_colour,
             margin: EdgeInsets.only(top: 10.0),
             width: double.infinity,
             height: bottomcontainerheight,
             padding: EdgeInsets.only(bottom: 20.0),
             child: GestureDetector(
               onTap: (){
                 Calculator_brain calc= Calculator_brain(height: height, weight: weight);
                 Navigator.push(
                   context,
                   MaterialPageRoute(builder: (context) =>  Resultspage(
                     bmires: calc.calBMI(),
                     res_tag: calc.get_result(),
                     interpret: calc.get_inter(),
                   ),
                   ),
                 );
               },
               child: Center(
                 child: Text('CALCULATE',style: klarge_pink_button,),
               ),
             )
           ),
         ),
       ],
      )
    );
  }
}

class Roundiconbutton extends StatelessWidget {
  Roundiconbutton({required this.icon , required this.onPressed} );
  IconData icon = Icons.ice_skating;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {

    return RawMaterialButton(
        child: Icon(icon),
        onPressed: onPressed,
        elevation: 6.0,
        shape: CircleBorder(),
        fillColor: Color(0xFF4C4F5E),
        constraints: BoxConstraints.tightFor(
          width: 50.0,
          height: 50.0,
        ),
    );
  }
}
