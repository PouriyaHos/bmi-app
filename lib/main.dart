import 'dart:async';
import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );

  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _heightController = TextEditingController();
  TextEditingController _weightController = TextEditingController();
  double _bmiResult = 0;
  String _textResult = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0,
        title: Text('BMI Calculator',
        style: TextStyle(color: Colors.yellow, fontSize: 13)),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: [
          SizedBox(height: 15,),
          Padding(
            padding: EdgeInsets.only(left: 25, right: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  color: Colors.black,
                  height: 90,
                  width: 110,
                  child: TextField(
                    controller: _heightController,
                    style: TextStyle(color: Colors.yellow, fontSize: 35),
                    decoration: InputDecoration(
                        border: InputBorder.none,
                      hintText: "Height",
                      hintStyle: TextStyle(
                          fontSize: 35,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold
                      )
                    ),
                  ),
                ),
                Container(
                  color: Colors.black,
                  height: 90,
                  width: 110,
                  child: TextField(
                    controller: _weightController,
                    style: TextStyle(color: Colors.yellow, fontSize: 35),
                    decoration: InputDecoration(
                      border: InputBorder.none,     //khate zire text feild hazf mishavad
                      hintText: "Weight",
                        hintStyle: TextStyle(
                            fontSize: 35,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold
                        )
                  ),
                ),
                )
              ],
            ),
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Colors.black),
              onPressed: (){
                double height= double.parse(_heightController.text);
                double weight= double.parse(_weightController.text);
                setState(() {
                  _bmiResult = weight / (height * height);
                  if (_bmiResult > 25){
                    _textResult = "You are over weight";
                  } else if (_bmiResult >= 18.5 && _bmiResult <= 25){
                    _textResult = "You weight is Normal";
                  } else{
                    _textResult = "You are under weight";
                  }
                });
              },
              child: Text(
                'Calculate',
                style: TextStyle(color: Colors.yellow, fontSize: 20)
              ),
          ),
          SizedBox(height: 50),
          Text(
            _bmiResult.toString(),
          style: TextStyle(color: Colors.yellow,fontSize: 45),
          ),
          SizedBox(height: 50),
          Visibility(                           //zamani result ra midahad ke textResult khali nabashad
            visible: _textResult.isNotEmpty,
            child: Text(
              _textResult,
            style: TextStyle(color: Colors.yellow, fontSize: 23),
            ),
          ),
          SizedBox(height: 90),
          RightBar(barwidth: 30),      //rightbar
          SizedBox(height: 15),
          RightBar(barwidth: 60),
          SizedBox(height: 15),
          RightBar(barwidth: 35),
          SizedBox(height: 15),
          LeftBar(barwidth: 30),       //leftbar
          SizedBox(height: 30),
          SizedBox(height: 15),
          LeftBar(barwidth: 35),
        ]),
      );

  }
}

class RightBar extends StatelessWidget {  //sakhte UI dar samte raste screen
  final double barwidth;
  const RightBar({Key? key, required this.barwidth}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          height: 26,
          width: barwidth,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              bottomLeft: Radius.circular(20),
            ),
            color: Colors.yellow,
          ),
        )
      ],
    );
  }
}

class LeftBar extends StatelessWidget {     //sakhte UI dar samte raste screen
  final double barwidth;
  const LeftBar({Key? key, required this.barwidth}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: 26,
          width: barwidth,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
            color: Colors.yellow,
          ),
        )
      ],
    );
  }
}