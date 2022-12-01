import 'package:flutter/material.dart';


class content extends StatelessWidget {
  content({required this.icon_,required this.name});

  final String name;
  final IconData icon_;


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,

      children: [
        Icon(icon_, size: 70.0,),
        SizedBox(height: 10.0,),
        Text(
          '$name',
          style: TextStyle(
            fontSize: 18.0,
            color: Color(0xFF8D8E98),
          ),
        ),
      ],
    );
  }
}
