import 'package:calculator_app/calculator_model.dart';
import 'package:calculator_app/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Calculator>(
      builder: (context, calculator, child) {
        double fontSize = 94;
        if (calculator.number.length > 6) {
          fontSize = 65;
        }
        return Scaffold(
          backgroundColor: calculator.isDarkModeOn
              ? Color.fromRGBO(23, 23, 28, 100)
              : Color.fromRGBO(241, 242, 243, 1),
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Transform.scale(
                        scale: 1.2,
                        child: Switch(
                          value: !calculator.isDarkModeOn,
                          onChanged: (_) {
                            context.read<Calculator>().changeIsDarkMode();
                          },
                          activeColor: Color.fromRGBO(210, 211, 218, 100),
                          activeTrackColor: Colors.white,
                          inactiveThumbColor: Color.fromRGBO(78, 80, 85, 100),
                          inactiveTrackColor: Color.fromRGBO(46, 47, 56, 100),
                          trackOutlineColor: WidgetStateProperty.resolveWith((
                            _,
                          ) {
                            return Colors.white.withOpacity(0);
                          }),
                        ),
                      ),
                      calculator.isDarkModeOn
                          ? Positioned(
                              right: 3,
                              child: Image.asset("assets/icons/moon.png"),
                            )
                          : Positioned(
                              left: 3,
                              child: Image.asset("assets/icons/sun.png"),
                            ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          calculator.number,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 70,
                            color: calculator.isDarkModeOn
                                ? Colors.white
                                : Colors.black,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                      SizedBox(height: 16),
                      Row(
                        children: [
                          GrayButton(
                            text: "C",
                            onTap: () => context.read<Calculator>().clear(),
                          ),
                          SizedBox(width: 16),
                          GrayButton(
                            text: "+/-",
                            onTap: () =>
                                context.read<Calculator>().onSignChange(),
                          ),
                          SizedBox(width: 16),
                          GrayButton(
                            text: "%",
                            onTap: () =>
                                context.read<Calculator>().onTapPercent(),
                          ),
                          SizedBox(width: 16),
                          BlueButton(
                            text: "/",
                            onTap: () => context
                                .read<Calculator>()
                                .onTapOperation(Operation.division),
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                      Row(
                        children: [
                          WhiteButton(
                            text: "7",
                            onTap: () =>
                                context.read<Calculator>().onTapNumber(7),
                          ),
                          SizedBox(width: 16),
                          WhiteButton(
                            text: "8",
                            onTap: () =>
                                context.read<Calculator>().onTapNumber(8),
                          ),
                          SizedBox(width: 16),
                          WhiteButton(
                            text: "9",
                            onTap: () =>
                                context.read<Calculator>().onTapNumber(9),
                          ),
                          SizedBox(width: 16),
                          BlueButton(
                            text: "x",
                            onTap: () => context
                                .read<Calculator>()
                                .onTapOperation(Operation.multiplication),
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                      Row(
                        children: [
                          WhiteButton(
                            text: "4",
                            onTap: () =>
                                context.read<Calculator>().onTapNumber(4),
                          ),
                          SizedBox(width: 16),
                          WhiteButton(
                            text: "5",
                            onTap: () =>
                                context.read<Calculator>().onTapNumber(5),
                          ),
                          SizedBox(width: 16),
                          WhiteButton(
                            text: "6",
                            onTap: () =>
                                context.read<Calculator>().onTapNumber(6),
                          ),
                          SizedBox(width: 16),
                          BlueButton(
                            text: "-",
                            onTap: () => context
                                .read<Calculator>()
                                .onTapOperation(Operation.substraction),
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                      Row(
                        children: [
                          WhiteButton(
                            text: "1",
                            onTap: () =>
                                context.read<Calculator>().onTapNumber(1),
                          ),
                          SizedBox(width: 16),
                          WhiteButton(
                            text: "2",
                            onTap: () =>
                                context.read<Calculator>().onTapNumber(2),
                          ),
                          SizedBox(width: 16),
                          WhiteButton(
                            text: "3",
                            onTap: () =>
                                context.read<Calculator>().onTapNumber(3),
                          ),
                          SizedBox(width: 16),
                          BlueButton(
                            text: "+",
                            onTap: () => context
                                .read<Calculator>()
                                .onTapOperation(Operation.addition),
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                      Row(
                        children: [
                          WhiteButton(
                            text: ".",
                            onTap: () => context.read<Calculator>().onTapDot(),
                          ),
                          SizedBox(width: 16),
                          WhiteButton(
                            text: "0",
                            onTap: () =>
                                context.read<Calculator>().onTapNumber(0),
                          ),
                          SizedBox(width: 16),
                          RemoveButton(
                            onTap: () =>
                                context.read<Calculator>().onTapRemove(),
                          ),
                          SizedBox(width: 16),
                          BlueButton(
                            text: "=",
                            onTap: () =>
                                context.read<Calculator>().onTapEqual(),
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
