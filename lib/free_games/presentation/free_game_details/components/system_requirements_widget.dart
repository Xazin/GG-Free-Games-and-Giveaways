import 'package:flutter/material.dart';

class SystemRequirementsWidget extends StatelessWidget {
  final String text1;
  final String text2;

  const SystemRequirementsWidget({
    Key? key,
    required this.text1,
    required this.text2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$text1:',
          style: TextStyle(color: Colors.white),
        ),
        SizedBox(width: 16),
        Text(
          text2,
          style: TextStyle(color: Colors.grey),
        ),
        SizedBox(height: 4),
      ],
    );
  }
}
