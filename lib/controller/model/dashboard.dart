import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_time/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'dart:ui';

class TechnicalSupportStatisticsPage extends StatefulWidget {
  const TechnicalSupportStatisticsPage({super.key});

  @override
  State<TechnicalSupportStatisticsPage> createState() =>
      _TechnicalSupportStatisticsPageState();
}

class _TechnicalSupportStatisticsPageState
    extends State<TechnicalSupportStatisticsPage> {
  int totalReports = 0;
  int resolvedReports = 0;
  double resolutionRate = 0.0;
  double averageResolutionTime = 0.0;
  User? userId = FirebaseAuth.instance.currentUser;

  @override
  void initState() {
    super.initState();
    // Fetch data from Firestore
    fetchReports();
  }

  Future<void> fetchReports() async {
    try {
      // Fetch reports received by the employee
      final QuerySnapshot receivedSnapshot = await FirebaseFirestore.instance
          .collection('IT_Reports_Received')
          .where('receiver_uid', isEqualTo: userId?.uid)
          .get();

      // Fetch reports resolved by the employee
      final QuerySnapshot resolvedSnapshot = await FirebaseFirestore.instance
          .collection('IT_Reports')
          .where('receiver_uid', isEqualTo: userId?.uid)
          .get();

      // Calculate metrics based on fetched data
      final List<DocumentSnapshot> receivedDocs = receivedSnapshot.docs;
      final List<DocumentSnapshot> resolvedDocs = resolvedSnapshot.docs;

      // Calculate total received and resolved reports
      totalReports = receivedDocs.length;
      resolvedReports = resolvedDocs.length;

      // Calculate resolution rate
      if (totalReports > 0) {
        resolutionRate = resolvedReports / totalReports;
      }

      // Calculate average resolution time
      int totalResolutionTime = 0;
      for (final resolvedDoc in resolvedDocs) {
        final Timestamp resolvedTime = resolvedDoc['date'];
        final Timestamp receivedTime = receivedDocs.firstWhere(
          (receivedDoc) =>
              receivedDoc['reportNumber'] == resolvedDoc['reportNumber'],
        )['date'];

        // Calculate time difference in milliseconds
        final int difference = resolvedTime.millisecondsSinceEpoch -
            receivedTime.millisecondsSinceEpoch;

        // Convert milliseconds to days
        final int days = (difference / (1000 * 60 * 60 * 24)).ceil();
        totalResolutionTime += days;
      }

      if (resolvedReports > 0) {
        // Calculate average resolution time only if there are resolved reports
        averageResolutionTime = totalResolutionTime / resolvedReports;
      }

      // Update the UI with the calculated metrics
      setState(() {});
    } catch (error) {
      // print('Error fetching reports: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: const Text(
          'تقرير حل المشكلة',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'Cario',
            color: Colors.white,
            fontSize: 18, //  تغيير هذه القيمة لتكون الحجم
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        onPressed: () {
          setState(() {
            fetchReports();
          });
        },
        backgroundColor: Colors.white,
        child: const Icon(
          Icons.refresh,
          color: Colors.teal,
          size: 35,
        ),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Lottie.asset(
              'assets/animation/afterAfect.json',
              fit: BoxFit.fill,
            ),
          ),
          Positioned.fill(
            child: Lottie.asset(
              'assets/animation/ppmana.json',
              fit: BoxFit.fill,
            ),
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 70, sigmaY: 70),
              child: const SizedBox(),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  children: [
                    _buildMetricCard(
                      title: 'البلاغات المستلمة',
                      value: totalReports.toString(),
                    ),
                    _buildMetricCard(
                      title: 'البلاغات المغلقة',
                      value: resolvedReports.toString(),
                    ),
                    _buildMetricCard(
                      title: 'متوسط وقت الحل',
                      value: '${averageResolutionTime.toStringAsFixed(2)} days',
                    ),
                    _buildMetricCardRate(
                      title: 'تقييم الموظف',
                      value: '${(resolutionRate * 100).toStringAsFixed(2)}%',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMetricCardRate({required String title, required String value}) {
    return SafeArea(
      child: Card(
        shape: RoundedRectangleBorder(
          side: const BorderSide(color: Colors.white70, width: 1),
          borderRadius: BorderRadius.circular(10),
        ),
        shadowColor: Colors.teal,
        elevation: 4,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Lottie.asset(
                'assets/animation/like1.json',
                height: 65,
              ),
            ),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            const SizedBox(height: 8),
            Text(
              value,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMetricCard({required String title, required String value}) {
    return Card(
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: Colors.white70, width: 1),
        borderRadius: BorderRadius.circular(10),
      ),
      shadowColor: Colors.teal,
      elevation: 4,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              'assets/images/uqu.png',
              height: 65,
            ),
          ),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          const SizedBox(height: 8),
          Text(
            value,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 20,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
