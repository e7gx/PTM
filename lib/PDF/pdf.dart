import 'package:flutter/material.dart';
import 'package:first_time/PDF/pdf_creators.dart';

class MyView extends StatefulWidget {
  const MyView({super.key});

  // This widget is the root of your application.
  @override
  State<MyView> createState() => _MyViewState();
}

class _MyViewState extends State<MyView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: MaterialButton(
          color: Colors.indigoAccent,
          onPressed: () {
            PdfGenerator.createPdf();
          },
          child: const Text(
            "open pdf",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
