import 'package:first_time/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';

class ITReportDetailsAdminPage extends StatelessWidget {
  final String reportId;

  const ITReportDetailsAdminPage({super.key, required this.reportId});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            colors: [
              Color(0xFF698EFF),
              Color(0xFF00CCFF),
            ],
            begin: FractionalOffset(0.0, 0.0),
            end: FractionalOffset(1.0, 0.0),
            stops: [0.0, 1.0],
            tileMode: TileMode.clamp),
      ),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new_rounded),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(
            S.of(context).it_report_ReportDetails,
            style: const TextStyle(
              fontFamily: 'Cario',
              color: Colors.white,
              fontSize: 24, //  تغيير هذه القيمة لتكون الحجم
              fontWeight: FontWeight.bold,
            ),
          ),
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    Colors.teal,
                    Colors.tealAccent,
                  ],
                  begin: FractionalOffset(0.0, 0.0),
                  end: FractionalOffset(1.0, 0.0),
                  stops: [0.0, 1.0],
                  tileMode: TileMode.clamp),
            ),
          ),
          centerTitle: true,
        ),
        body: FutureBuilder<DocumentSnapshot>(
          future: FirebaseFirestore.instance
              .collection('IT_Reports')
              .doc(reportId)
              .get(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            }
            if (!snapshot.hasData || snapshot.data!.data() == null) {
              return Center(
                  child: Text(
                S.of(context).it_report_NoReportDetails,
                style: const TextStyle(
                  fontFamily: 'Cario',
                  color: Colors.white,
                  fontSize: 35, //  تغيير هذه القيمة لتكون الحجم
                  fontWeight: FontWeight.bold,
                ),
              ));
            }
            var reportData = snapshot.data!.data() as Map<String, dynamic>;
            return Container(
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.white,
                    Colors.tealAccent,
                  ],
                  begin: Alignment.topRight,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // الصورة في الأعلى
                    Lottie.asset(
                      'assets/animation/userLog2.json',
                      width: 400,
                      height: 300, //  الارتفاع
                      fit: BoxFit.contain,
                    ),
                    const SizedBox(height: 0),
                    Text(
                      S.of(context).user_reports_ReportNumber,
                      style: const TextStyle(
                        fontFamily: 'Cario',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 15, 146, 239),
                      ),
                    ),

                    const SizedBox(height: 10),
                    Text(
                      reportData['reportNumber'].toString(),
                      style:
                          const TextStyle(fontSize: 16, color: Colors.black87),
                    ),
                    const SizedBox(height: 10),

                    Text(
                      S.of(context).it_report_NumOfDevice,
                      style: const TextStyle(
                        fontFamily: 'Cario',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 15, 146, 239),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      reportData['device'] ??
                          S.of(context).it_report_NoDescriptionAvailable,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black87,
                        fontFamily: 'Cario',
                      ),
                    ),

                    const SizedBox(height: 10),
                    Text(
                      S.of(context).it_report_StartDateOfRrport,
                      style: const TextStyle(
                        fontFamily: 'Cario',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 15, 146, 239),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      DateFormat('dd/MM/yyyy')
                          .format((reportData['date'] as Timestamp).toDate()),
                      style:
                          const TextStyle(fontSize: 16, color: Colors.black87),
                    ),
                    const SizedBox(height: 16),
                    const SizedBox(height: 10),
                    // النصوص والمحتويات الأخرى تأتي هنا
                    Text(
                      S.of(context).it_report_EndDateOfReport,
                      style: const TextStyle(
                        fontFamily: 'Cario',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF0F92EF),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      DateFormat('dd/MM/yyyy').format(
                          (reportData['endReportDate'] as Timestamp).toDate()),
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      S.of(context).it_report_Location,
                      style: const TextStyle(
                        fontSize: 20,
                        fontFamily: 'Cario',
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 15, 146, 239),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      '${reportData['location']}',
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black87,
                        fontFamily: 'Cario',
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      S.of(context).it_report_Building,
                      style: const TextStyle(
                        fontSize: 20,
                        fontFamily: 'Cario',
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 15, 146, 239),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      '${reportData['selected_option']}',
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black87,
                        fontFamily: 'Cario',
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      S.of(context).it_report_DescribeTheProblem,
                      style: const TextStyle(
                        fontFamily: 'Cario',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF0F92EF),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      reportData['problem'] ??
                          S.of(context).it_report_NoDescriptionAvailable,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black87,
                        fontFamily: 'Cario',
                      ),
                    ),
                    const SizedBox(height: 10),

                    Text(
                      S.of(context).it_report_ProblemSolution,
                      style: const TextStyle(
                        fontFamily: 'Cario',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF0F92EF),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      reportData['solution'] ??
                          S.of(context).it_report_NoDescriptionAvailable,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black87,
                        fontFamily: 'Cario',
                      ),
                    ),
                    const SizedBox(height: 10),

                    Text(
                      S.of(context).it_report_ContactInformation,
                      style: const TextStyle(
                        fontSize: 20,
                        fontFamily: 'Cario',
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 15, 146, 239),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      '${reportData['userInfo']}',
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black87,
                        fontFamily: 'Cario',
                      ),
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class Report {
  final String title;
  final String date;
  final String location;
  final String image;

  Report({
    required this.title,
    required this.date,
    required this.location,
    required this.image,
  });
}
