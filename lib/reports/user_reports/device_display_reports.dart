import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:first_time/reports/user_reports/device_details_reports.dart';

class DeviceReports extends StatelessWidget {
  const DeviceReports({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
        '        البلاغات المقدمة',
        style: TextStyle(
            color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
      )),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('User_Reports')
            .orderBy('date', descending: true) // أضف هذا السطر
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(
                child: Text(
              'لا توجد بلاغات',
              style: TextStyle(
                  color: Colors.black45,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ));
          }
          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              var report = snapshot.data!.docs[index];
              var reportData = report.data() as Map<String, dynamic>;

              return GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ReportDetailsPage(
                          reportId: report.id, reportNumber: index + 1),
                    ),
                  );
                },
                child: Card(
                  elevation: 6.0,
                  margin: const EdgeInsets.only(
                      bottom: 16.0, left: 8.0, right: 8.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.asset(
                          reportData['imageUrl'] ?? 'images/user.png',
                          width: double.infinity,
                          height: 400.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        left: 0,
                        child: Container(
                          color: const Color.fromARGB(255, 19, 98, 99)
                              .withOpacity(0.6),
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'بلاغ رقم ${index + 1}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                'تاريخ البلاغ:   ${DateFormat('dd/MM/yyyy').format(DateTime.parse(reportData['date'].toDate().toString()))}',
                                style: const TextStyle(
                                    fontSize: 16.0, color: Colors.white),
                              ),
                              Text(
                                'الموقع:   ${reportData['location'] ?? 'No Location'}',
                                style: const TextStyle(
                                    fontSize: 16.0, color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
