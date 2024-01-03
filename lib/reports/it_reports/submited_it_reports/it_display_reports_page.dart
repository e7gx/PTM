import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:first_time/reports/it_reports/submited_it_reports/it_display_report_page.dart';

class ReportsPage extends StatelessWidget {
  const ReportsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '      تقرير حل المشكلة  ',
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
        iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: true,
        toolbarHeight: 50,
        automaticallyImplyLeading: true,
      ), //AppBar

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
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('IT_Reports')
              .orderBy('date', descending: true)
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            }
            if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
              return const Center(child: Text('لا يوجد تقارير'));
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
                        'تقرير رقم ${index + 1}', // العنوان
                    date: formattedDate, // التاريخ المنسق
                    location: reportData['location'] ?? 'غير محدد', // الموقع
                    image: reportData['imageUrl'] ??
                        'assets/images/pc.png', // الصورة
                  ),
                  reportId: reportId,
                );
              },
            );
          },
        ),
      ),
    );
  }
}

class ReportCard extends StatelessWidget {
  final Report report;
  final String reportId;

  const ReportCard({super.key, required this.report, required this.reportId});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3.0,
      margin: const EdgeInsets.only(bottom: 2.0, top: 15),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: ListTile(
        leading: Image.asset(
          report.image, // استبدل هذا بصورة التقرير
          width: 50.0, // حجم الصورة
          height: 50.0,
          errorBuilder: (context, error, stackTrace) {
            // في حالة وجود خطأ في تحميل الصورة يظهر placeholder
            return const Icon(Icons.image, size: 100.0);
          },
        ),
        title: Text(
          report.title, // عنوان التقرير
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          'التاريخ: ${report.date}\nالموقع: ${report.location}', // تاريخ وموقع التقرير
        ),
        isThreeLine: true,
        trailing: ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ReportDetailsITPage(reportId: reportId),
              ),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 15, 146, 239),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
          ),
          child: const Text(
            'عرض التقرير',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
