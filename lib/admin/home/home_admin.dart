import 'package:first_time/device_table/collage_name/business_collage.dart';
import 'package:first_time/device_table/collage_name/computer_collage.dart';
import 'package:first_time/device_table/collage_name/islamic_collage.dart';
import 'package:first_time/device_table/collage_name/sciences_collage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'dart:ui';

// class IndividualBar {
//   final int x;
//   final double y;
//   final String label;
//   final Color color; // Add this property

//   IndividualBar({
//     required this.x,
//     required this.y,
//     required this.label,
//     required this.color, // Update the constructor
//   });
// }

class AdminDashboard extends StatefulWidget {
  const AdminDashboard({super.key});

  @override
  State<AdminDashboard> createState() => _TechnicalSupportStatisticsPageState();
}

class _TechnicalSupportStatisticsPageState extends State<AdminDashboard> {
  // List<IndividualBar> barData = [];

  void fetchReportCounts() async {
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
  void initState() {
    super.initState();
    fetchReportCounts(); // Call the function to fetch data when the page is initialized
  }

  int itReportsCount = 0;
  int itReportsReceivedCount = 0;
  int userReportsCount = 0;
  int assetsCount = 0;

  // Color _getColorForType(int x) {
  //   if (x < 5) {
  //     return Colors.teal; // اللون الافتراضي إذا كانت القيمة أقل من 5
  //   } else if (x <= 10) {
  //     return Colors.orange; // اللون الافتراضي إذا كانت القيمة بين 5 و 10
  //   } else if (x <= 20) {
  //     return Colors.redAccent; // اللون الافتراضي إذا كانت القيمة بين 10 و 20
  //   } else {
  //     return Colors.red; // اللون الافتراضي لجميع القيم الأخرى
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    // Map<String, int> textToValueMap = {
    //   'User Reports': userReportsCount,
    //   'Closed Reports': itReportsCount,
    //   'Technical Support Reports': itReportsReceivedCount,
    //   'Assets Count': assetsCount,
    // };
    // List<Color> barColors = [
    //   Colors.red,
    //   Colors.green,
    //   Colors.blue,
    //   Colors.yellow,
    // ];

    // List<IndividualBar> barData = [
    //   IndividualBar(
    //     x: textToValueMap['Technical Support Reports']!,
    //     y: textToValueMap['Technical Support Reports']!.toDouble(),
    //     label: 'Technical Support Reports', // Text label for the bar
    //     color: barColors[0], // Assigning color to the bar
    //   ),
    //   IndividualBar(
    //     x: textToValueMap['Closed Reports']!,
    //     y: textToValueMap['Closed Reports']!.toDouble(),
    //     label: 'Closed Reports', // Text label for the bar
    //     color: barColors[1], // Assigning color to the bar
    //   ),
    //   IndividualBar(
    //     x: textToValueMap['User Reports']!,
    //     y: textToValueMap['User Reports']!.toDouble(),
    //     label: 'User Reports', // Text label for the bar
    //     color: barColors[2], // Assigning color to the bar
    //   ),
    // ];

    return Scaffold(
      body: Stack(
        children: [
          afterAfectSTACK(),
          SingleChildScrollView(
            child: Column(
              children: [
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
                // const SizedBox(height: 10),
                // const Row(
                //   mainAxisAlignment: MainAxisAlignment.end,
                //   children: [
                //     Padding(
                //       padding: EdgeInsets.all(20.0),
                //       child: Text(
                //         'لوحة المعلومات',
                //         textAlign: TextAlign.right,
                //         style: TextStyle(
                //           fontFamily: 'Cario',
                //           fontSize: 20,
                //           fontWeight: FontWeight.bold,
                //         ),
                //       ),
                //     ),
                //   ],
                // ),
                // SafeArea(
                //   child: Padding(
                //     padding: const EdgeInsets.all(8.0),
                //     child: Card(
                //       color: Colors.transparent,
                //       elevation: 10,
                //       shadowColor: Colors.teal,
                //       shape: RoundedRectangleBorder(
                //         borderRadius: BorderRadius.circular(25.0),
                //       ),
                //       child: Padding(
                //         padding: const EdgeInsets.symmetric(horizontal: 30),
                //         child: Column(
                //           children: [
                //             const SizedBox(
                //               height: 50,
                //             ),
                //             SizedBox(
                //               height: 280,
                //               child: BarChart(
                //                 swapAnimationDuration:
                //                     const Duration(seconds: 4),
                //                 BarChartData(
                //                   backgroundColor: Colors.white,
                //                   maxY: barData.map((data) => data.y).reduce(
                //                       (max, current) =>
                //                           max > current ? max : current),
                //                   // يمكننا استخدام reduce للعثور على أعلى قيمة في القائمة وجعلها maxY لارتفاع البار
                //                   minY: barData.map((data) => data.y).reduce(
                //                       (min, current) =>
                //                           min < current ? min : current),
                //                   // يمكننا استخدام reduce للعثور على أدنى قيمة في القائمة وجعلها minY لارتفاع البار
                //                   gridData: const FlGridData(
                //                     show: true,
                //                   ),
                //                   titlesData: const FlTitlesData(
                //                     show: true,
                //                     topTitles: AxisTitles(
                //                       sideTitles: SideTitles(showTitles: false),
                //                     ),
                //                     leftTitles: AxisTitles(
                //                       sideTitles: SideTitles(showTitles: false),
                //                     ),
                //                     rightTitles: AxisTitles(
                //                       sideTitles: SideTitles(showTitles: false),
                //                     ),
                //                   ),
                //                   borderData: FlBorderData(show: true),
                //                   barGroups: barData.map((data) {
                //                     return BarChartGroupData(
                //                       x: data.x,
                //                       barRods: [
                //                         BarChartRodData(
                //                           toY: data.y,
                //                           color: _getColorForType(data
                //                               .x), // Color assigned based on type
                //                           width: 25,
                //                           borderRadius:
                //                               BorderRadius.circular(10),
                //                           backDrawRodData:
                //                               BackgroundBarChartRodData(
                //                             show: true,
                //                             toY: data.y,
                //                             color: _getColorForType(data
                //                                 .x), // Color assigned based on type
                //                           ),
                //                           rodStackItems: [
                //                             BarChartRodStackItem(
                //                               0,
                //                               data.y,
                //                               _getColorForType(data
                //                                   .x), // Color assigned based on type
                //                             ),
                //                           ],
                //                         ),
                //                       ],
                //                     );
                //                   }).toList(),
                //                 ),
                //               ),
                //             ),
                //             const SizedBox(height: 10),
                //             const Text(
                //               'عدد البلاغات الأسبوعية',
                //               textAlign: TextAlign.center,
                //               style: TextStyle(
                //                 fontFamily: 'Cario',
                //                 color: Colors.white,
                //                 fontSize: 15,
                //                 fontWeight: FontWeight.bold,
                //               ),
                //             ),
                //             const SizedBox(height: 10),
                //           ],
                //         ),
                //       ),
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ],
      ),
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
