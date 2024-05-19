import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_time/User/Reports/minitinesDone/ditels_user_minitines.dart';
import 'package:first_time/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';

class UserMintines extends StatefulWidget {
  const UserMintines({super.key});

  @override
  State<UserMintines> createState() => _UserMintinesState();
}

class _UserMintinesState extends State<UserMintines> {
  User? userId = FirebaseAuth.instance.currentUser;

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
        title: Text(
          S.of(context).user_mainitines_CompletedMaintenance,
          style: const TextStyle(
            fontFamily: 'Cario',
            color: Colors.white,
            fontSize: 22, //  تغيير هذه القيمة لتكون الحجم
            fontWeight: FontWeight.bold,
          ),
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  Colors.teal,
                  Colors.tealAccent,
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

      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.black,
              Colors.tealAccent,
            ],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
        ),
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('User_Maintenance_Message')
              .where('userUid', isEqualTo: userId?.uid)
              // .orderBy('endReportDate',
              //     descending:
              //         true) // Assuming 'date' is the field representing time

              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            }
            if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Lottie.asset('assets/animation/like1.json',
                        fit: BoxFit.contain, width: 200, height: 200),
                    Text(
                      S.of(context).user_mainitines_NoReports,
                      style: const TextStyle(
                          fontFamily: 'Cario',
                          color: Colors.white,
                          fontSize: 23,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              );
            }

            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                var reportData =
                    snapshot.data!.docs[index].data() as Map<String, dynamic>;
                var reportId = snapshot.data!.docs[index].id;

                String formattedDate = DateFormat('dd/MM/yyyy')
                    .format((reportData['date'] as Timestamp).toDate());
                return ReportCard(
                  report: Report(
                    title: reportData[''] ??
                        '${S.of(context).ditels_user_minitines_ReportNumber}${index + 1}', // العنوان
                    date: formattedDate, // التاريخ المنسق
                    location: reportData['location'] ??
                        S.of(context).user_mainitines_Undefined, // الموقع
                    image: reportData['imageUrl'] ??
                        'assets/images/uqu.png', // الصورة
                  ),
                  userReportId: reportId,
                );
              },
            );
          },
        ),
      ),
    );
  }
}

class ReportCard extends StatelessWidget {
  final Report report;
  final String userReportId;

  const ReportCard(
      {super.key, required this.report, required this.userReportId});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10.0,
      shadowColor: Colors.tealAccent,
      margin: const EdgeInsets.only(bottom: 10.0, top: 10, left: 4),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: ListTile(
        leading: Image.asset(
          report.image,
          width: 90.0, // حجم الصورة
          height: 90.0,
          errorBuilder: (context, error, stackTrace) {
            // في حالة وجود خطأ في تحميل الصورة يظهر placeholder
            return const Icon(Icons.image, size: 100.0);
          },
        ),
        title: Text(
          report.title, textAlign: TextAlign.center,
          // عنوان التقرير
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: 'Cario',
            fontSize: 16,
            color: Colors.black,
          ),
        ),
        subtitle: SafeArea(
          child: Padding(
            padding:
                const EdgeInsets.only(left: 4, right: 4, bottom: 10, top: 4),
            child: Column(
              children: [
                Text(
                  '${S.of(context).user_mainitines_Date}${report.date}',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Cario',
                      fontSize: 12,
                      color: Colors.black54),
                ),
                Text(
                  '${S.of(context).user_mainitines_Location} ${report.location}',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Cario',
                      fontSize: 12,
                      color: Colors.black54),
                ),
              ],
            ),
          ),
        ),
        isThreeLine: true,
        trailing: ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) =>
                    DitelsUserMintines(userReportId: userReportId),
              ),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.teal,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14.0),
            ),
          ),
          child: Text(
            S.of(context).user_mainitines_ShowReport,
            style: const TextStyle(
              color: Colors.white, fontFamily: 'Cario',
              fontSize: 14, //  تغيير هذه القيمة لتكون الحجم
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        hoverColor: Colors.tealAccent,
      ),
    );
  }
}
