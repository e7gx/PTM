import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:first_time/reports/user_reports/device_details_report.dart';
import 'package:lottie/lottie.dart';

class DeviceReports extends StatefulWidget {
  const DeviceReports({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _DeviceReportsState createState() => _DeviceReportsState();
}

class _DeviceReportsState extends State<DeviceReports> {
  bool sortByNewest = false;
  bool sortByOldest = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.white,
              Colors.lightBlue,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                gradient: const LinearGradient(colors: [
                  Colors.blue,
                  Colors.black,
                ]),
                border: Border.all(color: Colors.blueAccent),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {
                      setState(() {
                        sortByNewest = true;
                        sortByOldest = false;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 8),
                      backgroundColor:
                          sortByNewest ? Colors.redAccent : Colors.lightBlue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14.0),
                      ),
                    ),
                    icon: const Icon(
                      Icons.new_releases,
                      color: Colors.white,
                    ),
                    label: const Text(
                      'السابق',
                      style: TextStyle(
                        fontFamily: 'Cario',
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      setState(() {
                        sortByNewest = false;
                        sortByOldest = true;
                      });
                    },
                    icon: const Icon(
                      Icons.today_outlined,
                      color: Colors.white,
                    ),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 8),
                      backgroundColor:
                          sortByOldest ? Colors.teal : Colors.lightBlue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14.0),
                      ),
                    ),
                    label: const Text(
                      'الاحدث',
                      style: TextStyle(
                        fontFamily: 'Cario',
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('User_Reports')
                    .orderBy(
                      sortByNewest
                          ? 'date'
                          : sortByOldest
                              ? 'date'
                              : FieldPath.documentId,
                      descending: sortByOldest,
                    )
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

                      // Calculate the difference in days between the current date and the report date
                      DateTime reportDate = reportData['date'].toDate();
                      DateTime currentDate = DateTime.now();
                      int differenceInDays =
                          currentDate.difference(reportDate).inDays;

                      // Define color and status text based on the difference in days
                      Color statusColor;
                      String statusText;
                      if (differenceInDays >= 4) {
                        statusColor = Colors.red;
                        statusText = 'اولوية';
                      } else if (differenceInDays >= 2) {
                        statusColor = Colors.yellow;
                        statusText = 'متاخر';
                      } else {
                        statusColor = Colors.teal;
                        statusText = 'سليم';
                      }

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
                          shadowColor: Colors.blue,
                          margin: const EdgeInsets.only(
                            bottom: 16.0,
                            left: 8.0,
                            right: 8.0,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.asset(
                                  reportData['imageUrl'] ??
                                      'assets/images/pc.png',
                                  width: double.infinity,
                                  height: 200.0,
                                  fit: BoxFit.contain,
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                right: 0,
                                left: 0,
                                child: Container(
                                  color: Colors.blue.shade700.withOpacity(0.6),
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Report Number:   ${reportData['reportNumber'] ?? 'No Location'}',
                                            style: const TextStyle(
                                                fontSize: 12.0,
                                                color: Colors.white),
                                          ),
                                          Text(
                                            'Report Date : ${DateFormat('dd/MM/yyyy').format(reportDate)}',
                                            style: const TextStyle(
                                                fontSize: 12.0,
                                                color: Colors.white),
                                          ),
                                          Text(
                                            'Report Location:   ${reportData['location'] ?? 'No Location'}',
                                            style: const TextStyle(
                                              fontSize: 12.0,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                      // Display the status circle with color and text
                                      Container(
                                        width: 80,
                                        height: 50,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: statusColor,
                                        ),
                                        alignment: Alignment.center,
                                        child: Text(
                                          statusText,
                                          style: const TextStyle(
                                              fontSize: 14,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
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
          ],
        ),
      ),
    );
  }
}
