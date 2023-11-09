import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  final String result;
  final String description;
  final double data;

  const ResultPage({
    required this.data,
    required this.description,
    required this.result,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(result),
                  const SizedBox(height: 50),
                  Text(data.toStringAsFixed(2)),
                  const SizedBox(height: 50),
                  Text(
                    description,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
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
                // Navigator.of(context).push(
                //   MaterialPageRoute
                //   (builder: context) => const ResultPage(),
                // ),
              },
              child: Text(
                'Re-Calculate'.toUpperCase(),
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
