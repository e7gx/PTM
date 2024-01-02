import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';

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

      body: StreamBuilder<QuerySnapshot>(
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
                  image: reportData['imageUrl'] ?? 'images/pc.png', // الصورة
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

class ReportDetailsITPage extends StatelessWidget {
  final String reportId;

  const ReportDetailsITPage({Key? key, required this.reportId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '       تفاصيل التقرير',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24, //  تغيير هذه القيمة لتكون الحجم
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.cyan,
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
                    color: Colors.cyan,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  reportData['user_report_num'] ?? 'لا يوجد وصف متاح.',
                  style: const TextStyle(fontSize: 16, color: Colors.black87),
                ),
                const SizedBox(height: 10),
                // النصوص والمحتويات الأخرى تأتي هنا
                const Text(
                  'تاريخ التقرير:',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.cyan,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  DateFormat('dd/MM/yyyy')
                      .format((reportData['date'] as Timestamp).toDate()),
                  style: const TextStyle(fontSize: 16, color: Colors.black87),
                ),
                const SizedBox(height: 10),
                const Text(
                  'الموقع:',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.cyan,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  '${reportData['location']}',
                  style: const TextStyle(fontSize: 16, color: Colors.black87),
                ),
                const SizedBox(height: 10),
                const Text(
                  'حل المشكلة:',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.cyan,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  reportData['it_report_solution'] ?? 'لا يوجد وصف متاح.',
                  style: const TextStyle(fontSize: 16, color: Colors.black87),
                ),
              ],
            ),
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
