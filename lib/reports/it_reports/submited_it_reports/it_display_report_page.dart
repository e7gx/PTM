import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';

class ReportDetailsITPage extends StatelessWidget {
  final String reportId;

  const ReportDetailsITPage({super.key, required this.reportId});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 105, 142, 255),
              Color(0xFF00CCFF),
            ],
            begin: FractionalOffset(0.0, 0.0),
            end: FractionalOffset(1.0, 0.0),
            stops: [0.0, 1.0],
            tileMode: TileMode.clamp),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            '       تفاصيل التقرير',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24, //  تغيير هذه القيمة لتكون الحجم
              fontWeight: FontWeight.bold,
            ),
          ),
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 105, 142, 255),
                    Color(0xFF00CCFF),
                  ],
                  begin: FractionalOffset(0.0, 0.0),
                  end: FractionalOffset(1.0, 0.0),
                  stops: [0.0, 1.0],
                  tileMode: TileMode.clamp),
            ),
          ),
        ),
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 255, 255, 255),
                Color.fromARGB(255, 169, 223, 255),
              ],
              begin: Alignment.topRight,
              end: Alignment.bottomCenter,
            ),
          ),
          child: FutureBuilder<DocumentSnapshot>(
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
                return const Center(
                    child: Text(
                  'لا يوجد تفاصيل للتقرير',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24, //  تغيير هذه القيمة لتكون الحجم
                    fontWeight: FontWeight.bold,
                  ),
                ));
              }

              var reportData = snapshot.data!.data() as Map<String, dynamic>;

              return SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // الصورة في الأعلى
                    Lottie.asset(
                      'animation/reportsman.json',
                      width: 400,
                      height: 300, //  الارتفاع
                      fit: BoxFit.contain,
                    ),
                    const SizedBox(height: 0),
                    const Text(
                      'رقم البلاغ:',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 15, 146, 239),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      reportData['user_report_num'] ?? 'لا يوجد وصف متاح.',
                      style:
                          const TextStyle(fontSize: 16, color: Colors.black87),
                    ),
                    const SizedBox(height: 10),
                    // النصوص والمحتويات الأخرى تأتي هنا
                    const Text(
                      'تاريخ التقرير:',
                      style: TextStyle(
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
                    const SizedBox(height: 10),
                    const Text(
                      'الموقع:',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 15, 146, 239),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      '${reportData['location']}',
                      style:
                          const TextStyle(fontSize: 16, color: Colors.black87),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'حل المشكلة:',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 15, 146, 239),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      reportData['it_report_solution'] ?? 'لا يوجد وصف متاح.',
                      style:
                          const TextStyle(fontSize: 16, color: Colors.black87),
                    ),
                    const SizedBox(height: 80),
                  ],
                ),
              );
            },
          ),
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
