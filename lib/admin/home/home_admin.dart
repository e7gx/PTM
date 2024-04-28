import 'package:first_time/device_table/collage_name/business_collage.dart';
import 'package:first_time/device_table/collage_name/computer_collage.dart';
import 'package:first_time/device_table/collage_name/islamic_collage.dart';
import 'package:first_time/device_table/collage_name/sciences_collage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'dart:ui';

class IndividualBar {
  final int x;
  final double y;
  IndividualBar({required this.x, required this.y});
}

class BarData {
  final int sunday;
  final int monday;
  final int tuesday;
  final int wednesday;
  final int thursday;
  final int friday;
  final int saturday;

  BarData({
    required this.sunday,
    required this.monday,
    required this.tuesday,
    required this.wednesday,
    required this.thursday,
    required this.friday,
    required this.saturday,
  });

  List<IndividualBar> barData = [];
  void initalizeBarData() {
    barData = [
      IndividualBar(x: 0, y: sunday.toDouble()),
      IndividualBar(x: 10, y: monday.toDouble()),
      IndividualBar(x: 20, y: tuesday.toDouble()),
      IndividualBar(x: 30, y: wednesday.toDouble()),
      IndividualBar(x: 40, y: thursday.toDouble()),
      IndividualBar(x: 50, y: friday.toDouble()),
      IndividualBar(x: 60, y: saturday.toDouble()),
    ];
  }
}

class AdminDashboard extends StatefulWidget {
  const AdminDashboard({super.key});

  @override
  State<AdminDashboard> createState() => _TechnicalSupportStatisticsPageState();
}

class _TechnicalSupportStatisticsPageState extends State<AdminDashboard> {
  List<int> dashboard = [
    0,
    2,
    3,
    4,
    5,
    6,
    6,
  ];
  int itReportsCount = 0;
  int itReportsReceivedCount = 0;
  int userReportsCount = 0;
  int assetsCount = 0;

  @override
  void initState() {
    super.initState();
    fetchReportCounts();
  }

  Future<void> fetchReportCounts() async {
    final QuerySnapshot itReportsSnapshot =
        await FirebaseFirestore.instance.collection('IT_Reports').get();
    final QuerySnapshot itReportsReceivedSnapshot = await FirebaseFirestore
        .instance
        .collection('IT_Reports_Received')
        .get();
    final QuerySnapshot numberOfAssetsSnapshot =
        await FirebaseFirestore.instance.collection('devices_assets').get();
    final QuerySnapshot userReportsSnapshot =
        await FirebaseFirestore.instance.collection('User_Reports').get();

    setState(() {
      itReportsCount = itReportsSnapshot.size;
      itReportsReceivedCount = itReportsReceivedSnapshot.size;
      userReportsCount = userReportsSnapshot.size;
      assetsCount = numberOfAssetsSnapshot.size;
    });
  }

  @override
  Widget build(BuildContext context) {
    BarData myBarData = BarData(
      sunday: dashboard[3],
      monday: dashboard[1],
      tuesday: dashboard[2],
      wednesday: dashboard[3],
      thursday: dashboard[4],
      friday: dashboard[5],
      saturday: dashboard[6],
    );
    myBarData.initalizeBarData();

    return Scaffold(
      body: Stack(children: [
        afterAfectSTACK(),
        SingleChildScrollView(
          child: Column(
            children: [
              // Padding(
              //   padding:
              //       const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
              //   child: TextField(
              //     style:
              //         const TextStyle(color: Colors.teal, fontFamily: 'Cario'),
              //     cursorColor: Colors.teal,
              //     textAlign: TextAlign.end,
              //     decoration: InputDecoration(
              //       filled: true,
              //       fillColor: Colors.white,
              //       focusColor: Colors.teal,
              //       hintText: 'البحث عن صفحة',
              //       hintStyle: const TextStyle(
              //           fontFamily: 'Cario',
              //           color: Colors.teal,
              //           fontSize: 12,
              //           fontWeight: FontWeight.bold),
              //       prefixIcon: const Icon(
              //         Icons.search_rounded,
              //         color: Colors.teal,
              //       ),
              //       iconColor: Colors.teal,
              //       border: OutlineInputBorder(
              //         borderSide: const BorderSide(
              //           color: Colors.teal,
              //           width: 2,
              //         ),
              //         borderRadius: BorderRadius.circular(10),
              //       ),
              //       focusedBorder: OutlineInputBorder(
              //         borderRadius: BorderRadius.circular(10),
              //         borderSide: const BorderSide(
              //           color: Colors.teal,
              //           width: 3.0,
              //         ),
              //       ),
              //       enabledBorder: OutlineInputBorder(
              //         borderRadius: BorderRadius.circular(10),
              //         borderSide: const BorderSide(
              //           color: Colors.teal,
              //           width: 1.0,
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Text(
                      'البيانات الرئيسية',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        fontFamily: 'Cario',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: 180,
                        height: 180,
                        child: ReportCard(
                          title: 'البلاغات المستلمة',
                          count: itReportsReceivedCount,
                          icon: Icons.inbox,
                          color: Colors.blue,
                        ),
                      ),
                      SizedBox(
                        width: 180,
                        height: 180,
                        child: ReportCard(
                          title: 'البلاغات المغلقة',
                          count: itReportsCount,
                          icon: Icons.done_all,
                          color: Colors.green,
                        ),
                      ),
                      SizedBox(
                        width: 180,
                        height: 180,
                        child: ReportCard(
                          title: 'بلاغات المستخدمين',
                          count: userReportsCount,
                          icon: Icons.person,
                          color: Colors.orange,
                        ),
                      ),
                      SizedBox(
                        width: 180,
                        height: 180,
                        child: ReportCard(
                          title: 'تقارير الدعم',
                          count: itReportsCount,
                          icon: Icons.support_agent,
                          color: Colors.green,
                        ),
                      ),
                      SizedBox(
                        width: 180,
                        height: 180,
                        child: ReportCard(
                          title: 'عدد الأصول المسجلة',
                          count: assetsCount,
                          icon: Icons.assignment,
                          color: Colors.purple,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'بيانات الكليات',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        fontFamily: 'Cario',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment:
                      MainAxisAlignment.spaceBetween, // Adjust as needed
                  children: [
                    cardNumberOne(),
                    cardNumberTwo(),
                    cardNumberThree(),
                    cardNumberFour(),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              const Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Text(
                      'لوحة المعلومات',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        fontFamily: 'Cario',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    color: Colors.transparent,
                    elevation: 10,
                    shadowColor: Colors.teal,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(25.0),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 50,
                          ),
                          SizedBox(
                            height: 280,
                            child: BarChart(
                              swapAnimationDuration: const Duration(seconds: 4),
                              BarChartData(
                                backgroundColor: Colors.white,
                                maxY: 9,
                                // Change this value according to your data
                                minY: 2,
                                gridData: const FlGridData(
                                  show: true,
                                ),
                                titlesData: const FlTitlesData(
                                  show: true,
                                  topTitles: AxisTitles(
                                    sideTitles: SideTitles(showTitles: false),
                                  ),
                                  leftTitles: AxisTitles(
                                    sideTitles: SideTitles(showTitles: true),
                                  ),
                                  rightTitles: AxisTitles(
                                    sideTitles: SideTitles(showTitles: false),
                                  ),
                                ),
                                borderData: FlBorderData(show: true),
                                barGroups: myBarData.barData
                                    .map(
                                      (data) => BarChartGroupData(
                                        x: data.x,
                                        barRods: [
                                          BarChartRodData(
                                            toY: data.y,
                                            color: Colors.teal,
                                            width: 25,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            backDrawRodData:
                                                BackgroundBarChartRodData(
                                              show: true,
                                              toY: 9,
                                              color: const Color(0xFF075A5A),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                    .toList(),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            ' عدد البلاغات الاسبوعية',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Cario',
                              color: Colors.white,
                              fontSize: 15, //  تغيير هذه القيمة لتكون الحجم
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 80),
              SafeArea(
                child: Card(
                  color: Colors.transparent,
                  elevation: 10,
                  shadowColor: Colors.teal,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(25.0),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Column(
                      children: [
                        const SizedBox(height: 10),
                        const SizedBox(
                          height: 50,
                        ),
                        SizedBox(
                          height: 280,
                          child: BarChart(
                            swapAnimationDuration: const Duration(seconds: 3),
                            BarChartData(
                              backgroundColor: Colors.white,
                              maxY:
                                  9, // Change this value according to your data
                              minY: 1,
                              gridData: const FlGridData(
                                show: true,
                              ),
                              titlesData: const FlTitlesData(
                                show: true,
                                topTitles: AxisTitles(
                                  sideTitles: SideTitles(showTitles: false),
                                ),
                                leftTitles: AxisTitles(
                                  sideTitles: SideTitles(showTitles: true),
                                ),
                                rightTitles: AxisTitles(
                                  sideTitles: SideTitles(showTitles: false),
                                ),
                              ),
                              borderData: FlBorderData(show: true),
                              barGroups: myBarData.barData
                                  .map(
                                    (data) => BarChartGroupData(
                                      x: data.x,
                                      barRods: [
                                        BarChartRodData(
                                          toY: data.y,
                                          color: Colors.teal,
                                          width: 25,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          backDrawRodData:
                                              BackgroundBarChartRodData(
                                            show: true,
                                            toY: 9,
                                            color: const Color(0xFF075A5A),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                  .toList(),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'عدد البلاغات الاجمالية\nعدد البلاغات الإجمالية يُظهر عدد البلاغات الكلي التي تم تسجيلها أو تلقيها في نطاق معين، ويُستخدم هذا الرقم لتقييم حجم الأنشطة أو المشكلات التي تحتاج إلى متابعة أو حل في النظام أو التطبيق',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Cario', color: Colors.white,
                            fontSize: 15, //  تغيير هذه القيمة لتكون الحجم
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 80),
            ],
          ),
        ),
      ]),
    );
  }

  Padding cardNumberOne() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: Colors.white,
        elevation: 6,
        shadowColor: Colors.teal,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0), // إضافة BorderRadius هنا
        ),
        child: SizedBox(
          width: 170,
          height: 180,
          child: Column(
            children: [
              Image.asset(
                'assets/images/uqu.png',
                height: 90,
                width: 90,
              ),
              const Text(
                'كلية العلوم التطبيقية',
                style: TextStyle(
                  fontFamily: 'Cario',
                  color: Colors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SciencesCollage()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 29, vertical: 8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14.0),
                  ),
                ),
                child: const Text(
                  'استعراض البيانات',
                  style: TextStyle(
                    fontFamily: 'Cario',
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Padding cardNumberTwo() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: Colors.white,
        elevation: 8,
        shadowColor: Colors.teal,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0), // إضافة BorderRadius هنا
        ),
        child: SizedBox(
          width: 170,
          height: 180,
          child: Column(
            children: [
              Image.asset(
                'assets/images/uqu.png',
                height: 90,
                width: 90,
              ),
              const Text(
                'كلية الحاسب الإلي',
                style: TextStyle(
                  fontFamily: 'Cario',
                  color: Colors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ComputerCollage()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 29, vertical: 8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14.0),
                  ),
                ),
                child: const Text(
                  'استعراض البيانات',
                  style: TextStyle(
                    fontFamily: 'Cario',
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Padding cardNumberThree() {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Card(
        color: Colors.white,
        elevation: 8,
        shadowColor: Colors.teal,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0), // إضافة BorderRadius هنا
        ),
        child: SizedBox(
          width: 170,
          height: 180,
          child: Column(
            children: [
              Image.asset(
                'assets/images/uqu.png',
                height: 90,
                width: 90,
              ),
              const Text(
                'كلية الشريعة الإسلامية',
                style: TextStyle(
                  fontFamily: 'Cario',
                  color: Colors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HistoryCollage()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 29, vertical: 8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14.0),
                  ),
                ),
                child: const Text(
                  'استعراض البيانات',
                  style: TextStyle(
                    fontFamily: 'Cario',
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Padding cardNumberFour() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: Colors.white,
        elevation: 6,
        shadowColor: Colors.teal,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0), // إضافة BorderRadius هنا
        ),
        child: SizedBox(
          width: 170,
          height: 180,
          child: Column(
            children: [
              Image.asset(
                'assets/images/uqu.png',
                height: 90,
                width: 90,
              ),
              const Text(
                'كلية أدارة الاعمال',
                style: TextStyle(
                  fontFamily: 'Cario',
                  color: Colors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const BusinessCollage()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 29, vertical: 8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14.0),
                  ),
                ),
                child: const Text(
                  'استعراض البيانات',
                  style: TextStyle(
                    fontFamily: 'Cario',
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Stack afterAfectSTACK() {
    return Stack(
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
            filter: ImageFilter.blur(sigmaX: 50, sigmaY: 50),
            child: const SizedBox(),
          ),
        ),
      ],
    );
  }
}

class ReportCard extends StatelessWidget {
  final String title;
  final int count;
  final IconData icon;
  final Color color;

  const ReportCard(
      {Key? key,
      required this.title,
      required this.count,
      required this.icon,
      required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      shadowColor: Colors.teal,
      child: SizedBox(
        width: 150,
        height: 150,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 30,
                color: color,
              ),
              const SizedBox(height: 10),
              Text(
                title,
                style: const TextStyle(
                  fontFamily: 'Cario',
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                count.toString(),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.teal,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
