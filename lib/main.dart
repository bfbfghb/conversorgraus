import 'dart:ui';

import 'package:flutter/material.dart';

main(){
  runApp(Conversor());
}

class Conversor extends StatefulWidget {
  const Conversor({ Key key }) : super(key: key);

  @override
  _ConversorState createState() => _ConversorState();
}

class _ConversorState extends State<Conversor> {
  TextEditingController _controller;
    int toCelsius = 0;
    double toCelsiusResult = 0;
    int toFareh = 0;
    double toFarehResult = 0;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  celsiusToFahrenheit(){
    setState(() {
      toFarehResult = ((toFareh * 9/5) + 32);   
    });
  }

  fahrenheitToCelsius(){
    setState(() {
      toCelsiusResult = ((toCelsius - 32) * 5/9);   
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 150,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Grau Fahrenheit",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                  Container(
                  width: 100,
                  child: 
                  TextField(
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20),
                    onSubmitted: (String value){toCelsius = int.parse(value);fahrenheitToCelsius()();},
                  ),
                  ),
                  Text("°F", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                ],
              ),
                  SizedBox(height: 15,),
                  Text(" To ", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
                  SizedBox(height: 15,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Grau Celsius: ", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                      Text(toCelsiusResult.toStringAsPrecision(5),style: TextStyle(fontSize: 20),),
                      Text(" °C", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                    ],
                  ),
                  SizedBox(height: 50,child: Text("-".padRight(80, "-"),),),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Grau Celsius",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                  Container(
                  width: 100,
                  child: 
                  TextField(
                    textAlign: TextAlign.center,
                    controller: _controller,
                    style: TextStyle(fontSize: 20),
                    onSubmitted: (String value){toFareh = int.parse(value);celsiusToFahrenheit()()();},
                  ),
                  ),
                  Text("°C", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                ],
              ),
                  SizedBox(height: 15,),
                  Text(" To ", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
                  SizedBox(height: 15,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Grau Fahrenheit: ", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                      Text(toFarehResult.toStringAsPrecision(5), style: TextStyle(fontSize: 20),),
                      Text(" °F", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                    ],
                  ),
            ],
          ),
        ),
      ),
    );
  }
}