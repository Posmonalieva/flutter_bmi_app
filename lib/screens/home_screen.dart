import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bmi_app/app_constants/app_colors.dart';
import 'package:flutter_bmi_app/helpers/app_enums.dart';
import 'package:flutter_bmi_app/screens/result_screen.dart';
import 'package:flutter_bmi_app/services/bmi_services.dart';
import 'package:flutter_bmi_app/widgets/custom_age_weight.dart';
import 'package:flutter_bmi_app/widgets/custom_app_bar.dart';
import 'package:flutter_bmi_app/widgets/custom_button.dart';
import 'package:flutter_bmi_app/widgets/gender_widget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required String title}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Gender _gender = Gender.male;

  double height = 170;
  int weight = 41;
  int age = 15;
  final _bmiServices = BmiServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(height: 60, title: 'BMI Calculator'),
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 18.0, vertical: 18),
                child: Column(
                  children: <Widget>[
                    Expanded(
                      child: Row(
                        children: [
                          GenderWidget(
                            icon: FontAwesomeIcons.mars,
                            text: 'Male'.toUpperCase(),
                            color: _gender == Gender.male
                                ? AppColors.activeColor
                                : AppColors.inActiveColor,
                            onTap: () {
                              log("erkek tandaldi");
                              setState(() {
                                _gender = Gender.male;
                              });
                            },
                          ),
                          const SizedBox(width: 22),
                          GenderWidget(
                            icon: FontAwesomeIcons.venus,
                            text: 'Female'.toUpperCase(),
                            color: _gender == Gender.female
                                ? AppColors.activeColor
                                : AppColors.inActiveColor,
                            onTap: () {
                              setState(() {
                                _gender = Gender.female;
                              });
                              log("ayal tandaldi");
                            },
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 22),
                    _buildSlider(context),
                    const SizedBox(height: 22),
                    Row(
                      children: [
                        CustomAgeWeight(
                          text: 'WEIGTH',
                          number: weight.toString(),
                          increment: () {
                            setState(() {
                              weight++;
                            });
                          },
                          decrement: () {
                            setState(() {
                              weight--;
                            });
                          },
                        ),
                        const SizedBox(width: 22),
                        CustomAgeWeight(
                          text: 'AGE',
                          number: age.toString(),
                          increment: () {
                            setState(() {
                              age++;
                            });
                          },
                          decrement: () {
                            setState(() {
                              age--;
                            });
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 22),
                  ],
                ),
              ),
            ),
            CustomButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return ResultScreen(
                        data: _bmiServices.calculate(weight, height),
                        description:
                            _bmiServices.getInterpretation(weight, height),
                        result: _bmiServices.getResultText(weight, height),
                      );
                    },
                  ),
                );
              },
              text: 'CALCULATE',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSlider(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        color: AppColors.activeColor,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          Text('Height'.toUpperCase()),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.ideographic,
            children: [
              Text(
                height.round().toString().toUpperCase(),
                style: const TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 5),
              const Text('cm'),
            ],
          ),
          SliderTheme(
            data: SliderTheme.of(context).copyWith(
              activeTrackColor: Colors.red,
              trackShape: const RectangularSliderTrackShape(),
              trackHeight: 3.0,
              thumbColor: Colors.red,
              thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 8.0),
              overlayColor: Colors.red.withOpacity(0.1),
              overlayShape: const RoundSliderOverlayShape(overlayRadius: 28.0),
            ),
            child: Slider(
              value: height,
              max: 220,
              min: 50,
              onChanged: (double value) {
                log('value: $value');
                height = value;
                setState(() {});
              },
            ),
          ),
        ],
      ),
    );
  }
}
