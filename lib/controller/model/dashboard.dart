import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lottie/lottie.dart';

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
        title: const Text(
          'تقرير حل المشكلة',
          style: TextStyle(
            fontFamily: 'Cario',
            color: Colors.white,
            fontSize: 18, //  تغيير هذه القيمة لتكون الحجم
            fontWeight: FontWeight.bold,
          ),
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  Colors.teal,
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
              filter: ImageFilter.blur(sigmaX: 100, sigmaY: 100),
              child: const SizedBox(),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Padding(
              //   padding: const EdgeInsets.symmetric(vertical: 10.0),
              //   child: Lottie.asset(
              //     'assets/animation/green.json',
              //     width: MediaQuery.of(context).size.width,
              //   ),
              // ),
              // SizedBox(
              //   width: double.infinity,
              //   child: _buildMetricCardRate(
              //     title: 'تقييم الموظف',
              //     value: '${(resolutionRate * 100).toStringAsFixed(2)}%',
              //   ),
              // ),
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
