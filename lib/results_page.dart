import 'package:flutter/material.dart';
import 'constant.dart';
import 'reusable_card.dart';
import 'calculator_brain.dart';

class Resultspage extends StatelessWidget {
  Resultspage({required this.bmires, required this.res_tag, required this.interpret});

  final String bmires;
  final String res_tag;
  final String interpret;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(res_tag),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsetsDirectional.all(15.0),
              child: Text(bmires, style: TextStyle(fontSize: 50.0, fontWeight: FontWeight.bold,),),
            ),
          ),
          Expanded(
              flex: 5,
              child:  ReusableCard(
                colour: tiles_colour,
                cardChild:  Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                      Text(
                        res_tag,
                        style: TextStyle(
                            color: Color(0xFF24D876),
                            fontSize: 22.0,
                            fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      //SizedBox(height: 10.0,),
                      Text(
                          bmires,
                        style: TextStyle(
                          fontSize: 100.0,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      //SizedBox(height: 10.0,),
                      Text(
                          interpret,
                        style: TextStyle(
                          fontSize: 22.0,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      ],
                ),
              ),
          ),
          GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Container(
              color: bottom_colour,
              margin: EdgeInsets.only(top: 10.0),
              width: double.infinity,
              height: bottomcontainerheight,
              padding: EdgeInsets.only(bottom: 20.0),
              child: Center(
                child: Text('RE-CALCULATE' , style: klarge_pink_button,),
              ),
            ),
          ),
        ],
      )
    );
  }
}
//
// GestureDetector(
// onTap: (){
// Navigator.pop(context);
// },
// child: Container(
// color: bottom_colour,
// margin: EdgeInsets.only(top: 10.0),
// width: double.infinity,
// height: bottomcontainerheight,
// padding: EdgeInsets.only(bottom: 20.0),
// child: Center(
// child: Text('RE-CALCULATE' , style: klarge_pink_button,),
// ),
// ),
// ),