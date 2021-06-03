import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CalculatorButton extends StatelessWidget {
  final String text;
  final int buttonColor;
  final int textColor;
  final double buttonWidth;
  final double textSize;
  final Function callback;
  const CalculatorButton({
    this.text,
    this.buttonColor = 0xFFF0F0F3,
    this.textColor = 0xFF728AB7,
    this.textSize = 36,
    this.buttonWidth = 70,
    this.callback,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: SizedBox(
        width: buttonWidth,
        height: 70,
        child: TextButton(
          style: TextButton.styleFrom(
            elevation: 6,
            primary: Colors.black87,
            backgroundColor: Color(buttonColor),
            minimumSize: Size(70, 70),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(16.0)),
            ),
          ),
          onPressed: () => callback(text),
          child: Text(
            text,
            style: GoogleFonts.oswald(
                textStyle: TextStyle(
                    fontSize: textSize,
                    color: Color(textColor),
                    fontWeight: FontWeight.w600)),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
