import 'package:calculator/widgets/calculator_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({
    Key key,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int firstNum;
  int secondNum;
  String history = '';
  String textToDisplay = '';
  String res;
  String operation;

  void btnOnClick(String btnVal) {
    if (btnVal == 'C') {
      firstNum = 0;
      secondNum = 0;
      textToDisplay = '';
      res = '';
      // res = textToDisplay.substring(0, textToDisplay.length - 1);
    } else if (btnVal == '+' ||
        btnVal == '-' ||
        btnVal == '*' ||
        btnVal == '/') {
      firstNum = int.parse(textToDisplay);
      res = '';
      operation = btnVal;
    } else if (btnVal == '+/-') {
      if (textToDisplay[0] != '-') {
        res = '-' + textToDisplay;
      } else {
        res = textToDisplay.substring(1);
      }
    } else if (btnVal == '=') {
      secondNum = int.parse(textToDisplay);
      if (operation == '+') {
        res = (firstNum + secondNum).toString();
        history =
            firstNum.toString() + operation.toString() + secondNum.toString();
      }
      if (operation == '-') {
        res = (firstNum - secondNum).toString();
        history =
            firstNum.toString() + operation.toString() + secondNum.toString();
      }
      if (operation == '*') {
        res = (firstNum * secondNum).toString();
        history =
            firstNum.toString() + operation.toString() + secondNum.toString();
      }
      if (operation == '/') {
        res = (firstNum / secondNum).toString();
        history =
            firstNum.toString() + operation.toString() + secondNum.toString();
      }
    } else {
      res = int.parse(textToDisplay + btnVal).toString();
    }

    setState(() {
      textToDisplay = res;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            child: Padding(
              padding: EdgeInsets.only(right: 12),
              child: Text(
                history,
                style: GoogleFonts.oswald(
                    textStyle:
                        TextStyle(fontSize: 36, color: Color(0x77728AB7))),
              ),
            ),
            alignment: Alignment(1, 1),
          ),
          Container(
            child: Padding(
              padding: EdgeInsets.only(right: 12, top: 8, bottom: 8),
              child: Text(
                textToDisplay,
                style: GoogleFonts.oswald(
                    textStyle: TextStyle(fontSize: 64, color: Colors.white)),
              ),
            ),
            alignment: Alignment(1, 1),
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12))),
            padding: EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CalculatorButton(
                      text: 'C',
                      textColor: 0xFF898989,
                      callback: btnOnClick,
                    ),
                    CalculatorButton(
                      text: '+/-',
                      textColor: 0xFF898989,
                      callback: btnOnClick,
                    ),
                    CalculatorButton(
                      text: '%',
                      textColor: 0xFF898989,
                      callback: btnOnClick,
                    ),
                    CalculatorButton(
                      text: '/',
                      textColor: 0xFF745FF2,
                      callback: btnOnClick,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CalculatorButton(
                      text: '7',
                      callback: btnOnClick,
                    ),
                    CalculatorButton(
                      text: '8',
                      callback: btnOnClick,
                    ),
                    CalculatorButton(
                      text: '9',
                      callback: btnOnClick,
                    ),
                    CalculatorButton(
                      text: '*',
                      textColor: 0xFF745FF2,
                      callback: btnOnClick,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CalculatorButton(
                      text: '4',
                      callback: btnOnClick,
                    ),
                    CalculatorButton(
                      text: '5',
                      callback: btnOnClick,
                    ),
                    CalculatorButton(
                      text: '6',
                      callback: btnOnClick,
                    ),
                    CalculatorButton(
                      text: '-',
                      textColor: 0xFF745FF2,
                      callback: btnOnClick,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CalculatorButton(
                      text: '1',
                      callback: btnOnClick,
                    ),
                    CalculatorButton(
                      text: '2',
                      callback: btnOnClick,
                    ),
                    CalculatorButton(
                      text: '3',
                      callback: btnOnClick,
                    ),
                    CalculatorButton(
                      text: '+',
                      textColor: 0xFF745FF2,
                      callback: btnOnClick,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CalculatorButton(
                      text: '0',
                      buttonWidth: 170,
                      callback: btnOnClick,
                    ),
                    CalculatorButton(
                      text: '.',
                      callback: btnOnClick,
                    ),
                    CalculatorButton(
                      text: '=',
                      buttonColor: 0xFF2DD3C5,
                      textColor: 0xFFF0F0F3,
                      callback: btnOnClick,
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
