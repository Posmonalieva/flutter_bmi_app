import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bmi_app/bmi_calc.dart';
import 'package:flutter_bmi_app/result_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xff1D2136),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xff1D2136),
          primary: const Color(0xFF7684D4),
          brightness: Brightness.dark,
        ),
        textTheme: TextTheme(
          displayLarge: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
          // ···
          titleLarge: GoogleFonts.poppins(
            fontSize: 20,
          ),
          bodyMedium: GoogleFonts.poppins(
            fontSize: 18,
          ),
          displaySmall: GoogleFonts.poppins(),
        ),
      ),
      home: const MyHomePage(title: 'BMI Calculator'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Color inActiveColor = const Color(0xFF343442);
  Color activeColor = const Color(0xFF3D4060);

  // double _currentSliderValue = 170;

  // tandaldy = 0 erkek, tandaldy = 1 ayal
  // 0 = male, 1 = female
  int tandaldy = 1;

  Gender gender = Gender.male;

  //Jinis jinis = Jinis.erkek;  // kg variant

  double height = 170;
  int weight = 41;
  int age = 15;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 1,
        title: Text(
          widget.title,
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 18),
          child: Column(
            children: <Widget>[
              Expanded(
                child: Row(
                  children: [
                    _buildGender(
                      context: context,
                      icon: FontAwesomeIcons.mars,
                      text: 'Male'.toUpperCase(),
                      color:
                          gender == Gender.male ? activeColor : inActiveColor,
                      //jinis == Jinis.erkek bolso ushunu: je munu
                      onTap: () {
                        log('erkek tandaldy');
                        setState(() {
                          gender = Gender.male;
                          //jinis = Jinis.erkek;
                        });
                      },
                    ),
                    const SizedBox(width: 22),
                    _buildGender(
                      context: context,
                      icon: FontAwesomeIcons.venus,
                      text: 'Female'.toUpperCase(),
                      color:
                          gender == Gender.female ? activeColor : inActiveColor,
                      onTap: () {
                        log('ayal tandaldy');
                        setState(() {
                          gender = Gender.female;
                        });
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 22,
              ),
              Container(
                height: 200,
                decoration: BoxDecoration(
                  color: activeColor,
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
                              fontSize: 40, fontWeight: FontWeight.bold),
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
                        thumbShape: const RoundSliderThumbShape(
                            enabledThumbRadius: 8.0),
                        overlayColor: Colors.red.withOpacity(0.1),
                        overlayShape:
                            const RoundSliderOverlayShape(overlayRadius: 28.0),
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
              ),
              const SizedBox(height: 22),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 200,
                      decoration: BoxDecoration(
                        color: activeColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Column(
                        children: [
                          Text('Weight'.toUpperCase()),
                          Text(
                            weight.toString(),
                            style: const TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                                // ignore: sort_child_properties_last
                                child: const Padding(
                                  padding: EdgeInsets.all(3),
                                  child: Text(
                                    '+',
                                    style: TextStyle(
                                      fontSize: 36,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: inActiveColor,
                                  shape: const CircleBorder(),
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    weight--;
                                  });
                                },
                                // ignore: sort_child_properties_last
                                child: const Padding(
                                  padding: EdgeInsets.all(3),
                                  child: Text(
                                    '-',
                                    style: TextStyle(
                                      fontSize: 36,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                  shape: const CircleBorder(),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 22),
                  Expanded(
                    child: Container(
                      height: 200,
                      decoration: BoxDecoration(
                        color: activeColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Column(
                        children: [
                          Text('Age'.toUpperCase()),
                          Text(
                            age.toString(),
                            style: const TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    age++;
                                  });
                                },
                                // ignore: sort_child_properties_last
                                child: const Padding(
                                  padding: EdgeInsets.all(3),
                                  child: Text(
                                    '+',
                                    style: TextStyle(
                                      fontSize: 36,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: inActiveColor,
                                  shape: const CircleBorder(),
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    age--;
                                  });
                                },
                                // ignore: sort_child_properties_last
                                child: const Padding(
                                  padding: EdgeInsets.all(3),
                                  child: Text(
                                    '-',
                                    style: TextStyle(
                                      fontSize: 36,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                  shape: const CircleBorder(),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 22),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                  foregroundColor: Colors.white,
                  shadowColor: Colors.greenAccent,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.zero),
                  ),
                  minimumSize: Size(
                    MediaQuery.of(context).size.width,
                    80,
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return ResultPage(
                        data: BmiCalculator().calculate(weight, height),
                        description:
                            BmiCalculator().getInterpretation(weight, height),
                        result: BmiCalculator().getResultText(weight, height),
                      );
                    }),
                  );
                },

                // 2- variant navigation!!!
                // Navigator.of(context).push(MaterialPageRoute(
                //   builder: (context) => const ResultPage(),
                // ));

                child: Text(
                  'Calculate'.toUpperCase(),
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGender({
    required BuildContext context,
    required IconData icon,
    required String text,
    required Color color,
    required Function() onTap,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FaIcon(
                icon,
                size: 60,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 18.0),
                child: Text(text),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

enum Gender { male, female }

// kg varianty
//enum Jinis { erkek, ayal }
