import 'package:flutter/material.dart';

class ReportsReceived extends StatefulWidget {
  const ReportsReceived({super.key});

  @override
  State<ReportsReceived> createState() => _ReportsreceivedState();
}

class _ReportsreceivedState extends State<ReportsReceived> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('data'),
      ),
      body: const Column(
        children: [
          Text('data'),
        ],
      ),
    );
  }
}
