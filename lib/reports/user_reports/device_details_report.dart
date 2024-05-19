// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_time/controller/routes/navbar_drawer.dart';
import 'package:first_time/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ReportDetailsPage extends StatefulWidget {
  final String reportId;
  final int reportNumber;

  const ReportDetailsPage(
      {Key? key, required this.reportId, this.reportNumber = 1})
      : super(key: key);

  @override
  State<ReportDetailsPage> createState() => _ReportDetailsPageState();
}

class _ReportDetailsPageState extends State<ReportDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,

      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: const Text(
          'تفاصيل البلاغ ',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontFamily: 'Cario',
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold),
        ),
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
              tileMode: TileMode.clamp,
            ),
          ),
        ),
      ), //AppBar

      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFFFFFFF),
              Color(0xFFD8F3FD),
            ],
            begin: Alignment.topRight,
            end: Alignment.bottomCenter,
          ),
        ),
        child: FutureBuilder<DocumentSnapshot>(
          future: FirebaseFirestore.instance
              .collection('User_Reports')
              .doc(widget.reportId)
              .get(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (!snapshot.hasData || snapshot.data!.data() == null) {
              return Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Lottie.asset('assets/animation/like1.json',
                      fit: BoxFit.contain, width: 100, height: 100),
                  Text(
                    S.of(context).device_dateils_report_NoReports,
                    style: const TextStyle(
                        fontFamily: 'Cario',
                        color: Colors.black54,
                        fontSize: 23,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ));
            }
            var reportData = snapshot.data!.data() as Map<String, dynamic>;

            return SingleChildScrollView(
              padding: const EdgeInsets.all(15.0),
              child: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 50),
                    Image.asset(
                      reportData['imageUrl'] ?? 'assets/images/pc.png',
                      fit: BoxFit.fill,
                      height: 300,
                    ),
                    const SizedBox(height: 16),

                    Text(
                      'بلاغ رقم:\n${reportData['reportNumber'] ?? {
                            S.of(context).user_reports_Erorr,
                          }}',
                      style: const TextStyle(
                          fontFamily: 'Cario',
                          fontSize: 20,
                          color: Colors.blue,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      S.of(context).device_dateils_report_Date,
                      style: const TextStyle(
                          fontFamily: 'Cario',
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue),
                    ),
                    Text(
                      ' ${DateFormat('dd/MM/yyyy').format(DateTime.parse(reportData['date'].toDate().toString()))}',
                      style: const TextStyle(
                          fontSize: 18,
                          fontFamily: 'Cario',
                          color: Colors.black),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      S.of(context).device_dateils_report_DeviceNumber,
                      style: const TextStyle(
                          fontFamily: 'Cario',
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue),
                    ),
                    Text(
                      ' ${reportData['device'] ?? {
                            S.of(context).user_reports_Erorr,
                          }}',
                      style: const TextStyle(
                          fontFamily: 'Cario',
                          fontSize: 18,
                          color: Colors.black),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      S.of(context).device_dateils_report_Location,
                      style: const TextStyle(
                          fontFamily: 'Cario',
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue),
                    ),
                    Text(
                      ' ${reportData['selected_option'] ?? {
                            S.of(context).user_reports_Erorr,
                          }}',
                      style: const TextStyle(
                          fontSize: 18,
                          fontFamily: 'Cario',
                          color: Colors.black),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      S.of(context).device_dateils_report_ContactInformation,
                      style: const TextStyle(
                        fontSize: 20,
                        fontFamily: 'Cario',
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 15, 146, 239),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      '${reportData['userInfo']}',
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black87,
                        fontFamily: 'Cario',
                      ),
                    ),
                    const SizedBox(height: 16),

                    Text(
                      S.of(context).device_dateils_report_LabLocation,
                      style: const TextStyle(
                          fontFamily: 'Cario',
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue),
                    ),
                    Text(
                      ' ${reportData['location'] ?? {
                            S.of(context).show_reports_user_ditils_NoLocation,
                          }}',
                      style: const TextStyle(
                          fontSize: 18,
                          fontFamily: 'Cario',
                          color: Colors.black),
                    ),
                    const SizedBox(height: 16),
                    SafeArea(
                      child: Text(
                        S
                            .of(context)
                            .device_dateils_report_DescriptionOfProblem,
                        style: const TextStyle(
                            fontFamily: 'Cario',
                            fontSize: 20,
                            color: Colors.blue,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text(
                      reportData['problem'] ?? 'No Description',
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontFamily: 'Cario',
                      ),
                    ),
                    const SizedBox(height: 25),
                    // حدث عند الضغط على زر "نقل البلاغ إلى قسم تقنية المعلومات"
                    ElevatedButton(
                      onPressed: () async {
                        await FirebaseFirestore.instance
                            .collection('User_Reports')
                            .doc(widget.reportId)
                            .delete();

                        //! إضافة البلاغ إلى قسم تقنية المعلومات باستخدام بيانات البلاغ المسترجعة من Firestore
                        Map<String, dynamic> reportData =
                            snapshot.data!.data() as Map<String, dynamic>;

                        // قم بإضافة معرف المستخدم (UID) للمستلم الجديد إلى بيانات البلاغ
                        reportData['receiver_uid'] =
                            FirebaseAuth.instance.currentUser!.uid;

                        await FirebaseFirestore.instance
                            .collection('IT_Reports_Received')
                            .doc(widget.reportId)
                            .set(reportData);

                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(32.0),
                                ),
                              ),
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Lottie.asset('assets/animation/like1.json',
                                      height:
                                          200), // يجب أن تكون الصورة موجودة في مجلد الـ assets
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Center(
                                    child: Text(
                                      S
                                          .of(context)
                                          .device_dateils_report_TheReportHasBeenReceivedTy4Cooperation,
                                      style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Cario',
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const WelcomePage(),
                                      ),
                                    );
                                    Fluttertoast.showToast(
                                      msg: S
                                          .of(context)
                                          .device_dateils_report_TheOrderHasBeenReceived,
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.CENTER,
                                      timeInSecForIosWeb: 1,
                                      textColor: Colors.white,
                                      fontSize: 16.0,
                                    );
                                  },
                                  child: Text(
                                    S.of(context).device_dateils_report_Agree,
                                    style: const TextStyle(
                                        fontFamily: 'Cario',
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.blue),
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color(0xFF0F92EF), // New color for the button
                        padding: const EdgeInsets.symmetric(
                            horizontal: 50, vertical: 8),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      child: Text(
                        S.of(context).device_dateils_report_ReceivingTheOrder,
                        style: const TextStyle(
                            fontFamily: 'Cario',
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
