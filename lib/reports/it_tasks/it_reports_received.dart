import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class ReportsReceived extends StatefulWidget {
  const ReportsReceived({super.key});

  @override
  State<ReportsReceived> createState() => _ReportsreceivedState();
}

FirebaseDatabase database = FirebaseDatabase.instance;

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
