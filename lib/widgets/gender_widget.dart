import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class GenderWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color color;
  final Function() onTap;

  const GenderWidget({
    required this.icon,
    required this.text,
    required this.color,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
