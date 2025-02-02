import 'package:flutter/material.dart';
import 'package:flutter_calculator/widget/calculator_button.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _display = '0';
  String _operand = '';
  double? _firstValue;
  bool _shouldResetDisplay = false;

  void _onButtonTap(String value) {
    setState(() {
      if (value == 'C') {
        _display = '0';
        _operand = '';
        _firstValue = null;
      } else if (value == 'Backspace') {
        _display = _display.length > 1 ? _display.substring(0, _display.length - 1) : '0';
      } else if (value == '+' || value == '-' || value == 'x' || value == '/') {
        _firstValue = double.tryParse(_display);
        _operand = value;
        _shouldResetDisplay = true;
      } else if (value == '=') {
        if (_firstValue != null && _operand.isNotEmpty) {
          double secondValue = double.tryParse(_display) ?? 0;
          switch (_operand) {
            case '+':
              _display = (_firstValue! + secondValue).toString();
              break;
            case '-':
              _display = (_firstValue! - secondValue).toString();
              break;
            case 'x':
              _display = (_firstValue! * secondValue).toString();
              break;
            case '/':
              _display = secondValue != 0 ? (_firstValue! / secondValue).toString() : 'Error';
              break;
          }
          _operand = '';
          _firstValue = null;
        }
      } else {
        if (_shouldResetDisplay) {
          _display = value;
          _shouldResetDisplay = false;
        } else {
          _display = _display == '0' ? value : _display + value;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: Theme.of(context).primaryColorDark,
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  _display,
                  style: Theme.of(context)
                      .textTheme
                      .displaySmall!
                      .copyWith(color: Colors.white),
                ),
              ),
            ),
          ),
          GridView.count(
            padding: const EdgeInsets.all(0),
            shrinkWrap: true,
            crossAxisCount: 4,
            children: <Widget>[
              CalculatorButton(
                backgroundColor: Theme.of(context).primaryColorLight,
                foregroundColor: Theme.of(context).primaryColorDark,
                text: 'C',
                onTap: () => _onButtonTap('C'),
              ),
              CalculatorButton(
                backgroundColor: Theme.of(context).primaryColorLight,
                foregroundColor: Theme.of(context).primaryColorDark,
                text: '+/-',
                onTap: () {},
              ),
              CalculatorButton(
                backgroundColor: Theme.of(context).primaryColorLight,
                foregroundColor: Theme.of(context).primaryColorDark,
                text: '%',
                onTap: () {},
              ),
              CalculatorButton.icon(
                backgroundColor: Theme.of(context).primaryColorDark,
                foregroundColor: Colors.white,
                text: 'Backspace',
                icon: Icons.backspace,
                onTap: () => _onButtonTap('Backspace'),
              ),
              ...['7', '8', '9', 'x'].map((text) => CalculatorButton(
                    backgroundColor: text == 'x'
                        ? Theme.of(context).primaryColorDark
                        : Colors.white,
                    foregroundColor: text == 'x'
                        ? Colors.white
                        : Theme.of(context).primaryColorDark,
                    text: text,
                    onTap: () => _onButtonTap(text),
                  )),
              ...['4', '5', '6', '/'].map((text) => CalculatorButton(
                    backgroundColor: text == '/'
                        ? Theme.of(context).primaryColorDark
                        : Colors.white,
                    foregroundColor: text == '/'
                        ? Colors.white
                        : Theme.of(context).primaryColorDark,
                    text: text,
                    onTap: () => _onButtonTap(text),
                  )),
              ...['1', '2', '3', '-'].map((text) => CalculatorButton(
                    backgroundColor: text == '-'
                        ? Theme.of(context).primaryColorDark
                        : Colors.white,
                    foregroundColor: text == '-'
                        ? Colors.white
                        : Theme.of(context).primaryColorDark,
                    text: text,
                    onTap: () => _onButtonTap(text),
                  )),
              CalculatorButton(
                backgroundColor: Colors.white,
                foregroundColor: Theme.of(context).primaryColorDark,
                text: '0',
                onTap: () => _onButtonTap('0'),
              ),
              CalculatorButton(
                backgroundColor: Colors.white,
                foregroundColor: Theme.of(context).primaryColorDark,
                text: '.',
                onTap: () => _onButtonTap('.'),
              ),
              CalculatorButton(
                backgroundColor: Theme.of(context).primaryColorLight,
                foregroundColor: Theme.of(context).primaryColorDark,
                text: '=',
                onTap: () => _onButtonTap('='),
              ),
              CalculatorButton(
                backgroundColor: Theme.of(context).primaryColorDark,
                foregroundColor: Colors.white,
                text: '+',
                onTap: () => _onButtonTap('+'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
