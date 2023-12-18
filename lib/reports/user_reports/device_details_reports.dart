import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class ReportDetailsPage extends StatelessWidget {
  final String reportId;
  final int reportNumber;

  const ReportDetailsPage(
      {Key? key, required this.reportId, this.reportNumber = 1})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '   تفاصيل البلاغ رقم $reportNumber',
          style: const TextStyle(
              color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: FutureBuilder<DocumentSnapshot>(
        future: FirebaseFirestore.instance
            .collection('User_Reports')
            .doc(reportId)
            .get(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData || snapshot.data!.data() == null) {
            return const Center(child: Text('لا يوجد تفاصيل للبلاغ'));
          }
          var reportData = snapshot.data!.data() as Map<String, dynamic>;

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  reportData['imageUrl'] ?? 'images/user.png',
                  fit: BoxFit.cover,
                  height: 350,
                ),
                const SizedBox(height: 16),
                Text(
                  'بلاغ رقم: $reportNumber',
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text(
                  'التاريخ: ${DateFormat('dd/MM/yyyy').format(DateTime.parse(reportData['date'].toDate().toString()))}',
                  style: const TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 8),
                Text(
                  'رقم الجهاز: ${reportData['device'] ?? 'No Device Number'}',
                  style: const TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 8),
                Text(
                  'الموقع: ${reportData['location'] ?? 'No Location'}',
                  style: const TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 16),
                const Text(
                  'وصف المشكلة:',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  reportData['problem'] ?? 'No Description',
                  style: const TextStyle(fontSize: 18),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
