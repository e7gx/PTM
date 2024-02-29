import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:first_time/reports/it_reports/write_it_reports/it_report_solution_details_page.dart';

class ReportSolutionPage extends StatefulWidget {
  const ReportSolutionPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ReportSolutionPageState createState() => _ReportSolutionPageState();
}

class _ReportSolutionPageState extends State<ReportSolutionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Center(
      //     child: Text('تقديم تقرير       '),
      //   ),
      //   titleTextStyle: const TextStyle(
      //     color: Colors.white,
      //     fontFamily: 'Cario',
      //     fontSize: 26,
      //     fontWeight: FontWeight.bold,
      //   ),
      //   flexibleSpace: Container(
      //     decoration: const BoxDecoration(
      //       gradient: LinearGradient(
      //           colors: [
      //             Color.fromARGB(255, 105, 142, 255),
      //             Color(0xFF00CCFF),
      //           ],
      //           begin: FractionalOffset(0.0, 0.0),
      //           end: FractionalOffset(1.0, 0.0),
      //           stops: [0.0, 1.0],
      //           tileMode: TileMode.clamp),
      //     ),
      //   ),
      //   backgroundColor: Colors.cyan,
      //   iconTheme: const IconThemeData(color: Colors.white),
      //   centerTitle: true,
      //   toolbarHeight: 50,
      //   automaticallyImplyLeading: true,
      // ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 25, bottom: 0, left: 6, right: 6),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Lottie.asset('assets/animation/reportsman.json',
                height: 300, fit: BoxFit.fitWidth),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.0),
              child: Text(
                'يرجى استخدام هذه الخانة لرفع تقرير  عن المشكلة التي تم حلها من ذكر الخطوات التي تم اتباعها وأي معلومات إضافية تعتبر مهمة لفهم السياق والحل المقدم',
                textAlign: TextAlign.center, // Center the text horizontally
                style: TextStyle(
                  fontFamily: 'Cario',
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const DetailsPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(
                    255, 15, 146, 239), // New color for the button
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: const Text(
                'تقديم التقرير',
                style: TextStyle(
                  fontSize: 16, fontFamily: 'Cario',

                  fontWeight: FontWeight.bold,
                  color: Colors.white, // Adjust the text color if needed
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
