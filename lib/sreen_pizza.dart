import 'package:flutter/material.dart';
import 'package:themes/resources/resources.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:syncfusion_flutter_core/theme.dart';

class SreenPizzCalc extends StatefulWidget {
  const SreenPizzCalc({Key? key}) : super(key: key);

  @override
  _SreenPizzCalcState createState() => _SreenPizzCalcState();
}

enum Souce { hot, sweet, cheese }

class _SreenPizzCalcState extends State<SreenPizzCalc> {
  final _pizaSizess = [25, 30, 40];

  Souce? _souce = Souce.hot;
  bool _addCheese = false;
  double _stepSliderValue = 0;

  int _typeTesto = 0;

  final int _costDefalut = 100;
  int _testoCost = 50;
  int _souceCost = 10;
  int _sizeCost = 0;
  int _dobCheez = 0;
  late int _cost;

  void getCost() {
    _cost = _costDefalut + _testoCost + _sizeCost + _souceCost + _dobCheez;
  }

  @override
  void initState() {
    getCost();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return MaterialApp(
      home: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              const Align(
                alignment: Alignment.topRight,
                child: Image(
                  image: AssetImage(Disign.pizza),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Калькулятор пиццы',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline1,
              ),
              const SizedBox(
                height: 9,
              ),
              Text(
                'Выберите параметры:',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline2,
              ),
              const SizedBox(
                height: 33,
              ),
              ToggleSwitch(
                minWidth: 150.0,
                cornerRadius: 83.0,
                activeBgColors: [
                  [Theme.of(context).colorScheme.primary],
                  [Theme.of(context).colorScheme.primary]
                ],
                activeFgColor: Colors.white,
                inactiveBgColor: Theme.of(context).colorScheme.secondary,
                inactiveFgColor: Theme.of(context).colorScheme.onSecondary,
                initialLabelIndex: _typeTesto,
                totalSwitches: 2,
                labels: const ['Обычное тесто', 'Тонкое тесто'],
                radiusStyle: true,
                onToggle: (index) {
                  setState(() {
                    _typeTesto = index;
                    switch (index) {
                      case 0:
                        _testoCost = 50;
                        break;
                      case 1:
                        _testoCost = 0;
                        break;
                    }
                    getCost();
                  });
                },
              ),
              const SizedBox(
                height: 19,
              ),
              SizedBox(
                width: 300,
                child: Text(
                  'Размер:',
                  textAlign: TextAlign.left,
                  style: Theme.of(context).textTheme.headline3,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              SizedBox(
                width: 330,
                child: SfSliderTheme(
                  data: SfSliderThemeData(
                    activeLabelStyle: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 16,
                    ),
                    inactiveLabelStyle: TextStyle(
                      color: Theme.of(context).colorScheme.secondary,
                      fontSize: 16,
                    ),
                  ),
                  child: SfSlider(
                      activeColor: Theme.of(context).colorScheme.primary,
                      inactiveColor: Theme.of(context).colorScheme.secondary,
                      showLabels: true,
                      interval: 1,
                      min: 0.0,
                      max: 2.0,
                      stepSize: 1,
                      showTicks: true,
                      value: _stepSliderValue,
                      onChanged: (dynamic values) {
                        switch (values) {
                          case 0:
                            _sizeCost = 0;
                            break;
                          case 1:
                            _sizeCost = 35;
                            break;
                          case 2:
                            _sizeCost = 75;
                            break;
                        }
                        setState(() {
                          _stepSliderValue = values as double;

                          getCost();
                        });
                      },
                      labelFormatterCallback:
                          (dynamic actualValue, String formattedText) {
                        return _pizaSizess[actualValue.toInt()].toString() +
                            'см';
                      },
                      tooltipTextFormatterCallback:
                          (dynamic actualLabel, String formattedText) {
                        return _pizaSizess[_stepSliderValue.toInt()]
                                .toString() +
                            'см';
                      },
                      enableTooltip: true),
                ),
              ),
              const SizedBox(
                height: 19,
              ),
              SizedBox(
                width: 300,
                child: Text(
                  'Соус:',
                  textAlign: TextAlign.left,
                  style: Theme.of(context).textTheme.headline3,
                ),
              ),
              SizedBox(
                width: 322,
                child: Column(
                  children: <Widget>[
                    RadioListTile<Souce>(
                      title: Text('Острый',
                          style: Theme.of(context).textTheme.bodyText1),
                      controlAffinity: ListTileControlAffinity.trailing,
                      contentPadding: const EdgeInsets.only(left: 22, right: 0),
                      activeColor: Theme.of(context).colorScheme.primary,
                      visualDensity: const VisualDensity(
                          horizontal: VisualDensity.minimumDensity,
                          vertical: VisualDensity.minimumDensity),
                      value: Souce.hot,
                      groupValue: _souce,
                      onChanged: (Souce? value) {
                        setState(() {
                          _souce = value;
                          _souceCost = 10;
                          getCost();
                        });
                      },
                    ),
                    Divider(
                      color: Theme.of(context).colorScheme.primary,
                      indent: 22,
                      endIndent: 11,
                    ),
                    RadioListTile<Souce>(
                      title: Text('Кисло-сладкий',
                          style: Theme.of(context).textTheme.bodyText1),
                      controlAffinity: ListTileControlAffinity.trailing,
                      contentPadding: const EdgeInsets.only(left: 22, right: 0),
                      activeColor: Theme.of(context).colorScheme.primary,
                      value: Souce.sweet,
                      visualDensity: const VisualDensity(
                          horizontal: VisualDensity.minimumDensity,
                          vertical: VisualDensity.minimumDensity),
                      groupValue: _souce,
                      onChanged: (Souce? value) {
                        setState(() {
                          _souce = value;
                          _souceCost = 33;
                          getCost();
                        });
                      },
                    ),
                    Divider(
                      color: Theme.of(context).colorScheme.primary,
                      indent: 22,
                      endIndent: 11,
                    ),
                    RadioListTile<Souce>(
                      title: Text('Сырный',
                          style: Theme.of(context).textTheme.bodyText1),
                      activeColor: Theme.of(context).colorScheme.primary,
                      controlAffinity: ListTileControlAffinity.trailing,
                      contentPadding: const EdgeInsets.only(left: 22, right: 0),
                      value: Souce.cheese,
                      visualDensity: const VisualDensity(
                          horizontal: VisualDensity.minimumDensity,
                          vertical: VisualDensity.minimumDensity),
                      groupValue: _souce,
                      onChanged: (Souce? value) {
                        setState(() {
                          _souce = value;
                          _souceCost = 27;
                          getCost();
                        });
                      },
                    ),
                    Divider(
                      color: Theme.of(context).colorScheme.primary,
                      indent: 22,
                      endIndent: 11,
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    SizedBox(
                      width: mediaQuery.size.width,
                      height: 56,
                      child: SwitchListTile(
                        tileColor: Theme.of(context).colorScheme.secondary,
                        activeColor:
                            Theme.of(context).colorScheme.primaryVariant,
                        contentPadding:
                            const EdgeInsets.only(left: 3, right: 3),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        title: Text('Дополнительный сыр',
                            style: Theme.of(context).textTheme.headline3),
                        value: _addCheese,
                        onChanged: (bool value) {
                          setState(() {
                            _addCheese = value;
                            if (_addCheese) {
                              _dobCheez = 100;
                            } else {
                              _dobCheez = 0;
                            }
                            getCost();
                          });
                        },
                        secondary: const Image(image: AssetImage(Ico.cheese)),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: 300,
                      child: Text(
                        'Стоимость:',
                        textAlign: TextAlign.left,
                        style: Theme.of(context).textTheme.headline3,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 34,
                      width: 360,
                      decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.secondary,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10))),
                      alignment: Alignment.center,
                      child: Text(
                        '$_cost ₽',
                      ),
                    ),
                    const SizedBox(
                      height: 33,
                    ),
                    SizedBox(
                      height: 42,
                      width: 154,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Theme.of(context).colorScheme.primary,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(22.0),
                            )),
                        onPressed: () {},
                        child: Text(
                          'Заказать',
                          style: Theme.of(context).textTheme.headline3,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
