import 'package:calculator_app/calculator_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GrayButton extends StatelessWidget {
  const new({super.key, required this.text, required this.onTap});

  final String text;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () => onTap(),
        child: Container(
          decoration: BoxDecoration(
            color: context.read<Calculator>().isDarkModeOn
                ? Color.fromRGBO(78, 80, 95, 1)
                : Color.fromRGBO(210, 211, 218, 1),
            borderRadius: BorderRadius.circular(24),
          ),
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Text(
            text,
            style: TextStyle(
              fontSize: 32,
              color: context.read<Calculator>().isDarkModeOn
                  ? Colors.white
                  : Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}

class WhiteButton extends StatelessWidget {
  const new({super.key, required this.text, required this.onTap});

  final String text;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () => onTap(),
        child: Container(
          decoration: BoxDecoration(
            color: context.read<Calculator>().isDarkModeOn
                ? Color.fromRGBO(46, 47, 56, 1)
                : Colors.white,
            borderRadius: BorderRadius.circular(24),
          ),
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Text(
            text,
            style: TextStyle(
              fontSize: 32,
              color: context.read<Calculator>().isDarkModeOn
                  ? Colors.white
                  : Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}

class BlueButton extends StatelessWidget {
  const new({super.key, required this.text, required this.onTap});

  final String text;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () => onTap(),
        child: Container(
          decoration: BoxDecoration(
            color: Color.fromRGBO(75, 94, 252, 100),
            borderRadius: BorderRadius.circular(24),
          ),
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Text(
            text,
            style: TextStyle(fontSize: 32, color: Colors.white),
          ),
        ),
      ),
    );
  }
}

class RemoveButton extends StatelessWidget {
  const new({super.key, required this.onTap});

  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () => onTap(),
        child: Container(
          decoration: BoxDecoration(
            color: context.read<Calculator>().isDarkModeOn
                ? Color.fromRGBO(46, 47, 56, 100)
                : Colors.white,
            borderRadius: BorderRadius.circular(24),
          ),
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Image.asset(
            "assets/icons/remove.png",
            color: context.read<Calculator>().isDarkModeOn
                ? Colors.white
                : Colors.black,
          ),
        ),
      ),
    );
  }
}
