import 'package:calculator_responsive/config/size_config.dart';
import 'package:calculator_responsive/widgets/button_row_widget.dart';
import 'package:calculator_responsive/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'textfile.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
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
  String _equation = '0';
  String _result = "";
  String _expression = "";

  void btnClicked(String value) {
    setState(() {
      if (value == '=') {
        _expression = _equation;
        _expression = _expression.replaceAll('X', '*');
        try {
          Parser p = new Parser();
          Expression exp = p.parse(_expression);
          print(exp.simplify());
          ContextModel cm = ContextModel();
          _result = '${exp.evaluate(EvaluationType.REAL, cm)}';
        } catch (e) {
          _result = 'ERROR';
        }
      } else {
        if (_equation == '0') {
          _equation = value;
        } else {
          _equation = _equation + value;
        }
      }
    });
  }

  TextChange1 textChange1 = TextChange1();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              flex: 1,
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.only(
                  left: SizeConfig.width15(context) + 1,
                  right: SizeConfig.width15(context) + 1,
                  bottom: SizeConfig.width15(context) + 1,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Text(
                          _equation,
                          textAlign: TextAlign.end,
                          style: TextStyle(
                            fontSize: SizeConfig.height20(context) * 3,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Text(
                          _result,
                          style: TextStyle(
                            fontSize: SizeConfig.height20(context) * 2,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Flexible(
              flex: 0,
              child: Padding(
                padding: EdgeInsets.only(
                  left: SizeConfig.width15(context) + 1,
                  right: SizeConfig.width15(context) + 1,
                  bottom: SizeConfig.width15(context) + 1,
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomButton(
                          buttonColor: Color(0xfff7d36f),
                          title: "AC",
                          onPressed: () => _clearFunction(),
                        ),
                        SizedBox(
                          width: SizeConfig.width5(context),
                        ),
                        Expanded(
                          child: CustomButton(
                            buttonColor: Color(0xfff7d36f),
                            title: "=",
                            onPressed: () => btnClicked("="),
                          ),
                        ),
                        SizedBox(
                          width: SizeConfig.width5(context),
                        ),
                        CustomButton(
                          buttonColor: Color(0xfff7d36f),
                          title: "⌫",
                          onPressed: () => _deleteFuction(),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: SizeConfig.height8(context),
                    ),
                    ButtonRowWidget(
                      button1Clicked: () => btnClicked("7"),
                      button2Clicked: () => btnClicked("8"),
                      button3Clicked: () => btnClicked("9"),
                      button4Clicked: () => btnClicked("X"),
                      button1Value: "7",
                      button2Value: "8",
                      button3Value: "9",
                      button4Value: "X",
                      button1Color: Color(0xff95cad6),
                      button2Color: Color(0xff95cad6),
                      button3Color: Color(0xff95cad6),
                      button4Color: Color(0xfff7d36f),
                    ),
                    SizedBox(
                      height: SizeConfig.height8(context),
                    ),
                    ButtonRowWidget(
                      button1Clicked: () => btnClicked("4"),
                      button2Clicked: () => btnClicked("5"),
                      button3Clicked: () => btnClicked("6"),
                      button4Clicked: () => btnClicked("-"),
                      button1Value: "4",
                      button2Value: "5",
                      button3Value: "6",
                      button4Value: "-",
                      button1Color: Color(0xff95cad6),
                      button2Color: Color(0xff95cad6),
                      button3Color: Color(0xff95cad6),
                      button4Color: Color(0xfff7d36f),
                    ),
                    SizedBox(
                      height: SizeConfig.height8(context),
                    ),
                    ButtonRowWidget(
                      button1Clicked: () => btnClicked("1"),
                      button2Clicked: () => btnClicked("2"),
                      button3Clicked: () => btnClicked("3"),
                      button4Clicked: () => btnClicked("+"),
                      button1Value: "1",
                      button2Value: "2",
                      button3Value: "3",
                      button4Value: "+",
                      button1Color: Color(0xff95cad6),
                      button2Color: Color(0xff95cad6),
                      button3Color: Color(0xff95cad6),
                      button4Color: Color(0xfff7d36f),
                    ),
                    SizedBox(
                      height: SizeConfig.height8(context),
                    ),
                    ButtonRowWidget(
                      button1Clicked: () => btnClicked("."),
                      button2Clicked: () => btnClicked("0"),
                      button3Clicked: () => btnClicked("%"),
                      button4Clicked: () => btnClicked("/"),
                      button1Value: ".",
                      button2Value: "0",
                      button3Value: "%",
                      button4Value: "/",
                      button1Color: Color(0xfff7d36f),
                      button2Color: Color(0xff95cad6),
                      button3Color: Color(0xfff7d36f),
                      button4Color: Color(0xfff7d36f),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _clearFunction() {
    setState(() {
      _expression = '';
      _equation = '0';
      _result = '';
    });
  }

  void _deleteFuction() {
    setState(() {
      _equation = _equation.substring(0, _equation.length - 1);
      if (_equation == '') {
        _expression = '';
        _equation = '0';
        _result = '';
      }
    });
  }
}
