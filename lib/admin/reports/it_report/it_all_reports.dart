// import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_time/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'it_report.dart';

class ITReportsPage extends StatelessWidget {
  const ITReportsPage({super.key});

  @override
  Widget build(BuildContext context) {
    // User? userId = FirebaseAuth.instance.currentUser;

    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('IT_Reports').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Lottie.asset('assets/animation/like1.json',
                      fit: BoxFit.contain, width: 200, height: 200),
                  Text(
                    S.of(context).it_all_reports_NoReports,
                    style: const TextStyle(
                        fontFamily: 'Cario',
                        color: Color(0xFF0099FF),
                        fontSize: 23,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            );
          }

          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              var reportData =
                  snapshot.data!.docs[index].data() as Map<String, dynamic>;
              var reportId = snapshot.data!.docs[index].id;

              String formattedDate = DateFormat('dd/MM/yyyy')
                  .format((reportData['date'] as Timestamp).toDate());
              return ReportCard(
                report: Report(
                  title: reportData['title'] ??
                      '${S.of(context).user_reports_ReportNumber}${index + 1}', // العنوان
                  date: formattedDate, // التاريخ المنسق
                  location: reportData['location'] ??
                      S.of(context).it_all_reports_Undefined, // الموقع
                  image: reportData['imageUrl'] ??
                      'assets/images/pc.png', // الصورة
                ),
                reportId: reportId,
              );
            },
          );
        },
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

class ReportCard extends StatelessWidget {
  final Report report;
  final String reportId;

  const ReportCard({super.key, required this.report, required this.reportId});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10.0,
      shadowColor: Colors.tealAccent,
      margin: const EdgeInsets.only(bottom: 10.0, top: 10, left: 4),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: ListTile(
        leading: Image.asset(
          report.image,
          width: 50.0, // حجم الصورة
          height: 50.0,
          errorBuilder: (context, error, stackTrace) {
            // في حالة وجود خطأ في تحميل الصورة يظهر placeholder
            return const Icon(Icons.image, size: 100.0);
          },
        ),
        title: Center(
          child: Text(
            report.title, // عنوان التقرير
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'Cario',
                fontSize: 16,
                color: Color.fromARGB(255, 0, 0, 0)),
          ),
        ),
        subtitle: Center(
          child: SafeArea(
            child: Padding(
              padding:
                  const EdgeInsets.only(left: 4, right: 4, bottom: 10, top: 4),
              child: Text(
                '${S.of(context).it_all_reports_Date}: ${report.date}\n ${S.of(context).it_all_reports_Location}: ${report.location}',
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Cario',
                    fontSize: 12,
                    color: Colors.black54),
              ),
            ),
          ),
        ),
        isThreeLine: true,
        trailing: ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) =>
                    ITReportDetailsAdminPage(reportId: reportId),
              ),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.teal,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14.0),
            ),
          ),
          child: Text(
            S.of(context).it_all_reports_ShowReports,
            style: const TextStyle(
              color: Colors.white, fontFamily: 'Cario',
              fontSize: 14, //  تغيير هذه القيمة لتكون الحجم
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        hoverColor: Colors.tealAccent,
      ),
    );
  }
}
