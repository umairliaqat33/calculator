import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'textfile.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: ProfileScreen(),
    );
  }
}

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String equation = ' ';
  String result = " ";
  String expression = "";

  void btnClicked(String value) {
    setState(() {
      if (value == 'AC') {
        equation = ' ';
        result = ' ';
      } else if (value == '→') {
        equation = equation.substring(0, equation.length - 1);
        if (equation == '') {
          equation = ' ';
        }
      } else if (value == '=') {
        expression = equation;
        expression = expression.replaceAll('X', '*');
        try {
          Parser p = new Parser();
          Expression exp = p.parse(expression);
          ContextModel cm = ContextModel();
          result = '${exp.evaluate(EvaluationType.REAL, cm)}';
        } catch (e) {
          result = 'ERROR';
        }
      } else {
        if (equation == '0') {
          equation = value;
        } else {
          equation = equation + value;
        }
      }
    });
  }

  Widget customOutLineButton(String value, int color, double h) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(h / 100),
        height: h / 10,
        width: 80,
        child: TextButton(
            onPressed: () {
              btnClicked(value);
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Color(color)),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              )),
            ),
            child: Text(
              value,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            )),
      ),
    );
  }

  TextChange1 textChange1 = TextChange1();

  @override
  Widget build(BuildContext context) {
    var wid = MediaQuery.of(context).size.width;
    var hgt = MediaQuery.of(context).size.height;
    return SafeArea(
        child: Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Color(0xff587080),
      //   title: Text(
      //     'Calculator',
      //     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50),
      //   ),
      // ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
                // border: Border.all(color: Colors.black, width: 10),
                // borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
            margin: EdgeInsets.only(top: 10, right: 15, left: 10),
            height: hgt / 3.5,
            width: wid,
            // color: Colors.blue,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Text(
                      result,
                      style: TextStyle(
                        fontSize: hgt / 15,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Text(
                      equation,
                      style: TextStyle(
                        fontSize: hgt / 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: [
              Row(
                children: [
                  customOutLineButton('AC', 0xfff7d36f, hgt),
                  customOutLineButton('→', 0xfff7d36f, hgt),
                  customOutLineButton('=', 0xfff7d36f, hgt),
                ],
              ),
              Row(
                children: [
                  customOutLineButton('7', 0xff95cad6, hgt),
                  customOutLineButton('8', 0xff95cad6, hgt),
                  customOutLineButton('9', 0xff95cad6, hgt),
                  customOutLineButton('X', 0xfff7d36f, hgt),
                ],
              ),
              Row(
                children: [
                  customOutLineButton('4', 0xff95cad6, hgt),
                  customOutLineButton('5', 0xff95cad6, hgt),
                  customOutLineButton('6', 0xff95cad6, hgt),
                  customOutLineButton('-', 0xfff7d36f, hgt),
                ],
              ),
              Row(
                children: [
                  customOutLineButton('1', 0xff95cad6, hgt),
                  customOutLineButton('2', 0xff95cad6, hgt),
                  customOutLineButton('3', 0xff95cad6, hgt),
                  customOutLineButton('+', 0xfff7d36f, hgt),
                ],
              ),
              Row(
                children: [
                  customOutLineButton('.', 0xff95cad6, hgt),
                  customOutLineButton('0', 0xff95cad6, hgt),
                  customOutLineButton('%', 0xfff7d36f, hgt),
                  customOutLineButton('/', 0xfff7d36f, hgt),
                ],
              ),
            ],
          ),
        ],
      ),
    ));
  }
}
