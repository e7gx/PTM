import 'package:flutter/material.dart';

import 'package:fl_chart/fl_chart.dart';

class IndividualBar {
  final int x;
  final double y;
  IndividualBar({required this.x, required this.y});
}

class BarData {
  final int sumReports;
  final int sumProblem;
  final int sumSloution;
  final int sumGood;

  BarData({
    required this.sumGood,
    required this.sumProblem,
    required this.sumSloution,
    required this.sumReports,
  });

  List<IndividualBar> barData = [];
  void initalizeBarData() {
    barData = [
      IndividualBar(x: 0, y: sumGood.toDouble()),
      IndividualBar(x: 10, y: sumProblem.toDouble()),
      IndividualBar(x: 20, y: sumSloution.toDouble()),
      IndividualBar(x: 30, y: sumReports.toDouble()),
    ];
  }
}

class TechnicalSupportStatisticsPage extends StatefulWidget {
  const TechnicalSupportStatisticsPage({Key? key}) : super(key: key);

  @override
  State<TechnicalSupportStatisticsPage> createState() =>
      _TechnicalSupportStatisticsPageState();
}

class _TechnicalSupportStatisticsPageState
    extends State<TechnicalSupportStatisticsPage> {
  List<int> dashboard = [
    1,
    4,
    5,
    5,
    2,
    4,
    5,
  ];

  @override
  Widget build(BuildContext context) {
    BarData myBarData = BarData(
      sumGood: dashboard[4],
      sumProblem: dashboard[1],
      sumSloution: dashboard[6],
      sumReports: dashboard[5],
    );
    myBarData.initalizeBarData();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'مؤشر الدعم الفني',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 24, //  تغيير هذه القيمة لتكون الحجم
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.cyan,
        iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: true,
        toolbarHeight: 50,
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
        automaticallyImplyLeading: true,
      ), //AppBar
      body: SingleChildScrollView(
        child: Column(
          children: [
            SafeArea(
              child: Card(
                elevation: 10,
                shadowColor: Colors.cyan,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(25.0),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(15, 15, 15, 40),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 50,
                      ),
                      SizedBox(
                        height: 200,
                        child: BarChart(
                          BarChartData(
                            backgroundColor: const Color(0xFF797373),
                            maxY:
                                10, // Change this value according to your data
                            minY: 0,
                            gridData: const FlGridData(
                              show: false,
                            ),
                            titlesData: const FlTitlesData(
                              show: true,
                              topTitles: AxisTitles(
                                sideTitles: SideTitles(showTitles: false),
                              ),
                              leftTitles: AxisTitles(
                                sideTitles: SideTitles(showTitles: false),
                              ),
                              rightTitles: AxisTitles(
                                sideTitles: SideTitles(showTitles: false),
                              ),
                            ),
                            borderData: FlBorderData(show: false),
                            barGroups: myBarData.barData
                                .map(
                                  (data) => BarChartGroupData(
                                    x: data.x,
                                    barRods: [
                                      BarChartRodData(
                                        toY: data.y,
                                        color: const Color(0xFF36A8F4),
                                        width: 25,
                                        borderRadius: BorderRadius.circular(2),
                                        backDrawRodData:
                                            BackgroundBarChartRodData(
                                          show: true,
                                          toY: 10,
                                          color: const Color.fromARGB(
                                              255, 229, 241, 241),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                                .toList(),
                          ),
                        ),
                      ),
                      const Text(
                        'Dashboard',
                        style: TextStyle(
                          fontFamily: 'Cario',

                          color: Colors.black,
                          fontSize: 40, //  تغيير هذه القيمة لتكون الحجم
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 80),
            SafeArea(
              child: Card(
                elevation: 10,
                shadowColor: Colors.cyan,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(25.0),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(15, 15, 15, 40),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 50,
                      ),
                      SizedBox(
                        height: 200,
                        child: BarChart(
                          BarChartData(
                            backgroundColor: const Color(0xFF797373),
                            maxY:
                                10, // Change this value according to your data
                            minY: 0,
                            gridData: const FlGridData(
                              show: false,
                            ),
                            titlesData: const FlTitlesData(
                              show: true,
                              topTitles: AxisTitles(
                                sideTitles: SideTitles(showTitles: false),
                              ),
                              leftTitles: AxisTitles(
                                sideTitles: SideTitles(showTitles: false),
                              ),
                              rightTitles: AxisTitles(
                                sideTitles: SideTitles(showTitles: false),
                              ),
                            ),
                            borderData: FlBorderData(show: false),
                            barGroups: myBarData.barData
                                .map(
                                  (data) => BarChartGroupData(
                                    x: data.x,
                                    barRods: [
                                      BarChartRodData(
                                        toY: data.y,
                                        color: const Color(0xFF36A8F4),
                                        width: 25,
                                        borderRadius: BorderRadius.circular(2),
                                        backDrawRodData:
                                            BackgroundBarChartRodData(
                                          show: true,
                                          toY: 10,
                                          color: const Color.fromARGB(
                                              255, 229, 241, 241),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                                .toList(),
                          ),
                        ),
                      ),
                      const Text(
                        'Reports',
                        style: TextStyle(
                          fontFamily: 'Cario',

                          color: Colors.black,
                          fontSize: 40, //  تغيير هذه القيمة لتكون الحجم
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 80),
          ],
        ),
      ),
    );
  }
}



// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: const Text(
// //           'مؤشر الدعم الفني',
// //           textAlign: TextAlign.center,
// //           style: TextStyle(
// //             color: Colors.white,
// //             fontSize: 24, //  تغيير هذه القيمة لتكون الحجم
// //             fontWeight: FontWeight.bold,
// //           ),
// //         ),
// //         backgroundColor: Colors.cyan,
// //         iconTheme: const IconThemeData(color: Colors.white),
// //         centerTitle: true,
// //         toolbarHeight: 50,
// //         flexibleSpace: Container(
// //           decoration: const BoxDecoration(
// //             gradient: LinearGradient(
// //                 colors: [
// //                   Color.fromARGB(255, 105, 142, 255),
// //                   Color(0xFF00CCFF),
// //                 ],
// //                 begin: FractionalOffset(0.0, 0.0),
// //                 end: FractionalOffset(1.0, 0.0),
// //                 stops: [0.0, 1.0],
// //                 tileMode: TileMode.clamp),
// //           ),
// //         ),
// //         automaticallyImplyLeading: true,
// //       ), //AppBar
// //       body: Center(
// //         child: Container(
// //           decoration: const BoxDecoration(
// //             gradient: LinearGradient(
// //               colors: [
// //                 Color.fromARGB(255, 255, 255, 255),
// //                 Color.fromARGB(255, 169, 223, 255),
// //               ],
// //               begin: Alignment.topRight,
// //               end: Alignment.bottomCenter,
// //             ),
// //           ),
// //           child: const SingleChildScrollView(
// //             child: Column(
// //               mainAxisAlignment: MainAxisAlignment.start,
// //               children: <Widget>[
// //                 SupportStatisticCard(
// //                   title: 'سرعة الاستجابة للبلاغ',
// //                   value: '90%',
// //                   icon: Icons.access_time, // أيقونة سرعة الاستجابة
// //                   iconColor: Colors.blue, // لون أيقونة سرعة الاستجابة
// //                 ),
// //                 SupportStatisticCard(
// //                   title: 'نسبة حل المشكلة',
// //                   value: '75%',
// //                   icon: Icons.check_circle, // أيقونة نسبة حل المشكلة
// //                   iconColor: Colors.green,
// //                 ),
// //                 SupportStatisticCard(
// //                   title: 'التقييم الشامل',
// //                   value: '4.5/5',
// //                   icon: Icons.star, // أيقونة التقييم الشامل
// //                   iconColor: Colors.orange, // لون أيقونة التقييم الشامل
// //                 ),
// //                 SizedBox(
// //                   height: 30,
// //                 )
// //               ],
// //             ),
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }
