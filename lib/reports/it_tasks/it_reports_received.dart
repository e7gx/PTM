import 'package:first_time/reports/it_tasks/it_display_report_received.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';

class ReportsReceived extends StatelessWidget {
  const ReportsReceived({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.white,
              Colors.blue,
              Colors.white,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('IT_Reports_Received')
              .orderBy('date', descending: false) // أضف هذا السطر
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
              return Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Lottie.asset('assets/animation/like1.json',
                      fit: BoxFit.contain, width: 100, height: 100),
                  const Text(
                    'لا يوجد بلاغات',
                    style: TextStyle(
                        fontFamily: 'Cario',
                        color: Colors.black54,
                        fontSize: 23,
                        fontWeight: FontWeight.bold),
                  ),
                ],
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
                        builder: (context) => DetailsOfTheReceivedReport(
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
                            reportData['imageUrl'] ?? 'assets/images/uqu.png',
                            width: double.infinity,
                            height: 350.0,
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          left: 0,
                          child: Container(
                            color: const Color(0xFF003496).withOpacity(0.6),
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
                                  'Report Date : ${DateFormat('dd/MM/yyyy').format(DateTime.parse(reportData['date'].toDate().toString()))}',
                                  style: const TextStyle(
                                      fontSize: 16.0, color: Colors.white),
                                ),
                                Text(
                                  'Report Location:   ${reportData['location'] ?? 'No Location'}',
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
      ),
    );
  }
}
