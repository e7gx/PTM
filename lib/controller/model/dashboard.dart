import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'dart:ui';

class TechnicalSupportStatisticsPage extends StatefulWidget {
  const TechnicalSupportStatisticsPage({Key? key}) : super(key: key);

  @override
  State<TechnicalSupportStatisticsPage> createState() =>
      _TechnicalSupportStatisticsPageState();
}

class _TechnicalSupportStatisticsPageState
    extends State<TechnicalSupportStatisticsPage> {
  int totalReports = 0;
  int resolvedReports = 0;
  double resolutionRate = 0.0;
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
          .get();

      // Fetch reports resolved by the employee
      final QuerySnapshot resolvedSnapshot =
          await FirebaseFirestore.instance.collection('IT_Reports').get();

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
          'تقيماتي',
          textAlign: TextAlign.center,
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
                  Colors.blue,
                  Colors.black,
                ],
                begin: FractionalOffset(0.0, 0.0),
                end: FractionalOffset(1.0, 0.0),
                stops: [0.0, 1.0],
                tileMode: TileMode.clamp),
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
          color: Colors.blue,
          size: 35,
        ),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Lottie.asset(
              'assets/animation/p2p.json',
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
              filter: ImageFilter.blur(sigmaX: 50, sigmaY: 50),
              child: const SizedBox(),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Image.asset(
                  'assets/images/uqu.png',
                  width: 300,
                  height: 200,
                ),
              ),
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
                      title: 'التقارير المنجزة',
                      value: resolvedReports.toString(),
                    ),
                    _buildMetricCardRate(
                      title: 'تقييم الموظف',
                      percentage: resolutionRate * 100,
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

  Widget _buildMetricCardRate(
      {required String title, required double percentage}) {
    int numStars = convertPercentageToStars(percentage);
    String stars = '';
    for (int i = 0; i < numStars; i++) {
      stars += '⭐'; // Unicode star icon
    }

    return SafeArea(
      child: Card(
        shape: RoundedRectangleBorder(
          side: const BorderSide(color: Colors.white70, width: 1),
          borderRadius: BorderRadius.circular(10),
        ),
        shadowColor: Colors.blue,
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
              stars,
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

  int convertPercentageToStars(double percentage) {
    const double highPercentageThreshold =
        80.0; // تحديد النسبة المئوية لمستوى عالي يستحق 4 نجوم

    if (percentage >= highPercentageThreshold) {
      return 4; // إذا كانت النسبة المئوية أعلى من أو تساوي الحد العالي، فإنه يستحق 4 نجوم
    } else {
      // إذا كانت النسبة المئوية أقل من الحد العالي، سنقوم بتحديد عدد النجوم بناءً على النسبة المئوية
      // يمكنك تعديل هذه القيم وفقًا لتفضيلاتك
      if (percentage >= 60.0) {
        return 3; // نسبة مئوية 60٪ فأعلى تستحق 3 نجوم
      } else if (percentage >= 40.0) {
        return 2; // نسبة مئوية 40٪ فأعلى تستحق 2 نجوم
      } else if (percentage >= 20.0) {
        return 1; // نسبة مئوية 20٪ فأعلى تستحق نجم واحد
      } else {
        return 0; // أقل من 20٪ لا يستحق نجمًا
      }
    }
  }

  Widget _buildMetricCard({required String title, required String value}) {
    return Card(
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: Colors.white70, width: 1),
        borderRadius: BorderRadius.circular(10),
      ),
      shadowColor: Colors.blue,
      elevation: 4,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(
              Icons.bar_chart_sharp,
              color: Colors.blue,
              size: 50,
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
