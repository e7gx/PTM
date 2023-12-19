import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:first_time/reports/it_reports/it_report_solution_details_page.dart';

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
      appBar: AppBar(
        title: const Center(
          child: Text('تقديم تقرير       '),
        ),
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 26,
          fontWeight: FontWeight.bold,
        ),
        backgroundColor: Colors.cyan,
        iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: true,
        toolbarHeight: 50,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(5000),
            bottomLeft: Radius.circular(0),
          ),
        ),
        automaticallyImplyLeading: true,
      ), //AppBar
      backgroundColor: Colors.white,
      body: Padding(
        padding:
            const EdgeInsets.all(20.0), // Adjusted padding for better spacing
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center, // Center content vertically
          children: [
            Lottie.asset(
              'animation/report_solution.json',
              height: 300,
              width: 400,
            ),
            const SizedBox(
                height: 30), // Adjusted for spacing after the animation
            const Text(
              'يرجى استخدام هذه الخانة لرفع تقرير مفصل عن المشكلة التي تم حلها من ذكر الخطوات التي تم اتباعها وأي معلومات إضافية تعتبرونها مهمة لفهم السياق والحل المقدم',
              textAlign: TextAlign.center, // Center the text horizontally
              style: TextStyle(
                color: Colors.black54,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
                height: 30), // Adjusted for spacing before the button
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const DetailsPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.cyan, // New color for the button
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: const Text(
                'تقديم التقرير',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white, // Adjust the text color if needed
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
