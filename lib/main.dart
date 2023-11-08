import 'dart:developer';

import 'package:flutter/material.dart';
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

  double _currentSliderValue = 170;
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
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Column(
            children: <Widget>[
              Expanded(
                child: Row(
                  children: [
                    _buildGender(
                        context: context,
                        icon: FontAwesomeIcons.mars,
                        text: 'Male'.toUpperCase(),
                        color: activeColor),
                    const SizedBox(width: 22),
                    _buildGender(
                        context: context,
                        icon: FontAwesomeIcons.venus,
                        text: 'Female'.toUpperCase(),
                        color: activeColor),
                  ],
                ),
              ),
              const SizedBox(
                height: 22,
              ),
              Container(
                height: 160,
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
                          _currentSliderValue.round().toString().toUpperCase(),
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
                        value: _currentSliderValue,
                        max: 220,
                        min: 50,
                        onChanged: (double value) {
                          log('value: $value');
                          _currentSliderValue = value;
                          setState(() {});
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 22),
              Container(
                height: 160,
                decoration: BoxDecoration(
                  color: activeColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    const Text('data'),
                    const Text('data'),
                    Row(
                      children: [
                        ElevatedButton(
                          onPressed: () {},
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
                          onPressed: () {},
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
              const SizedBox(height: 22),
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
  }) {
    return Expanded(
      child: GestureDetector(
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
        onTap: () {
          // print('Pressed');
        },
      ),
    );
  }
}
