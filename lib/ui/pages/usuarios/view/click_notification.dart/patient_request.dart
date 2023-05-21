import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class PatientRequestPage extends StatelessWidget {
  const PatientRequestPage({super.key, required this.info});
  final String info;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('You clicked on the patient request notification'),
      ),
      body: Center(
        child: Text(info),
      ),
    );
  }
}
