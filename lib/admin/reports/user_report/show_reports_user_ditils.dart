// ignore_for_file: use_build_context_synchronously

import 'package:first_time/generated/l10n.dart';

import '../../home/home_page_admin.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:fluttertoast/fluttertoast.dart';

class UserInAdminReportDetailsPage extends StatefulWidget {
  final String reportId;
  final int reportNumber;

  const UserInAdminReportDetailsPage(
      {Key? key, required this.reportId, this.reportNumber = 1})
      : super(key: key);

  @override
  State<UserInAdminReportDetailsPage> createState() =>
      _ReportDetailsPageState();
}

class _ReportDetailsPageState extends State<UserInAdminReportDetailsPage> {
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
        title: Text(
          S.of(context).show_reports_user_ditils_DetailsOfReport,
          textAlign: TextAlign.center,
          style: const TextStyle(
              fontFamily: 'Cario',
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold),
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
              tileMode: TileMode.clamp,
            ),
          ),
        ),
      ), //AppBar

      body: FutureBuilder<DocumentSnapshot>(
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
                  S.of(context).show_reports_user_ditils_DetailsOfReport,
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
                    S.of(context).show_reports_user_ditils_ReportNum,
                    style: const TextStyle(
                        fontFamily: 'Cario',
                        fontSize: 20,
                        color: Colors.teal,
                        fontWeight: FontWeight.bold),
                  ),

                  Text(
                    '${reportData['reportNumber'] ?? S.of(context).user_reports_Erorr}',
                    style: const TextStyle(
                        fontFamily: 'Cario',
                        fontSize: 30,
                        color: Colors.teal,
                        fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 20),
                  Text(
                    S.of(context).it_reports_received_Date,
                    style: const TextStyle(
                      fontFamily: 'Cario',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal,
                    ),
                  ),
                  Text(
                    ' ${DateFormat('dd/MM/yyyy').format(DateTime.parse(reportData['date'].toDate().toString()))}',
                    style: const TextStyle(
                      fontSize: 18,
                      fontFamily: 'Cario',
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    S.of(context).show_reports_user_ditils_NumOfDevice,
                    style: const TextStyle(
                      fontFamily: 'Cario',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal,
                    ),
                  ),
                  Text(
                    ' ${reportData['device'] ?? S.of(context).user_reports_Erorr}',
                    style: const TextStyle(
                      fontFamily: 'Cario',
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    S.of(context).show_reports_user_ditils_Location,
                    style: const TextStyle(
                      fontFamily: 'Cario',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal,
                    ),
                  ),
                  Text(
                    ' ${reportData['location'] ?? S.of(context).user_reports_Erorr}',
                    style: const TextStyle(
                      fontSize: 18,
                      fontFamily: 'Cario',
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    S.of(context).show_reports_user_ditils_building,
                    style: const TextStyle(
                      fontSize: 20,
                      fontFamily: 'Cario',
                      fontWeight: FontWeight.bold,
                      color: Colors.teal,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    '${reportData['selected_option']}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontFamily: 'Cario',
                    ),
                  ),
                  const SizedBox(height: 16),
                  SafeArea(
                    child: Text(
                      S
                          .of(context)
                          .show_reports_user_ditils_DescriptionOfTheProblem,
                      style: const TextStyle(
                          fontFamily: 'Cario',
                          fontSize: 20,
                          color: Colors.teal,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text(
                    reportData['problem'] ??
                        S.of(context).show_reports_user_ditils_NoDescription,
                    style: const TextStyle(
                      fontSize: 18,
                      fontFamily: 'Cario',
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    S.of(context).show_reports_user_ditils_ContactInformation,
                    style: const TextStyle(
                      fontSize: 20,
                      fontFamily: 'Cario',
                      fontWeight: FontWeight.bold,
                      color: Colors.teal,
                    ),
                  ),
                  Text(
                    '${reportData['userInfo']}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontFamily: 'Cario',
                    ),
                  ),
                  const SizedBox(height: 10),
                  const SizedBox(height: 25),
                  // حدث عند الضغط على زر "نقل البلاغ إلى قسم تقنية المعلومات"
                  ElevatedButton(
                    onPressed: () async {
                      _showAbdullahAlert();
                      // showDialog(
                      //   context: context,
                      //   builder: (context) {
                      //     return AlertDialog(
                      //       shape: const RoundedRectangleBorder(
                      //         borderRadius: BorderRadius.all(
                      //           Radius.circular(32.0),
                      //         ),
                      //       ),
                      //       content: Column(
                      //         mainAxisSize: MainAxisSize.min,
                      //         children: [
                      //           Lottie.asset('assets/animation/like1.json',
                      //               height:
                      //                   200), // يجب أن تكون الصورة موجودة في مجلد الـ assets
                      //           const SizedBox(
                      //             height: 10,
                      //           ),
                      //           const Center(
                      //             child: Text(
                      //               ' شكرا لك على تعاونك\n 🪛 تم استلام البلاغ',
                      //               style: TextStyle(
                      //                 fontSize: 15,
                      //                 fontWeight: FontWeight.bold,
                      //                 fontFamily: 'Cario',
                      //               ),
                      //             ),
                      //           ),
                      //         ],
                      //       ),
                      //       actions: [
                      //         TextButton(
                      //           onPressed: () {
                      //             // Navigator.of(context).push(
                      //             //   MaterialPageRoute(
                      //             //     builder: (context) => const WelcomePage(),
                      //             //   ),
                      //             // );//!helpppp
                      //             Fluttertoast.showToast(
                      //               msg: "👍 تمت عملية استلام الطلب ",
                      //               toastLength: Toast.LENGTH_SHORT,
                      //               gravity: ToastGravity.CENTER,
                      //               timeInSecForIosWeb: 1,
                      //               textColor: Colors.white,
                      //               fontSize: 16.0,
                      //             );
                      //           },
                      //           child: const Text(
                      //             'موافق',
                      //             style: TextStyle(
                      //               fontFamily: 'Cario',
                      //               fontSize: 16,
                      //               fontWeight: FontWeight.bold,
                      //               color: Colors.teal,
                      //             ),
                      //           ),
                      //         ),
                      //       ],
                      //     );
                      //   },
                      // );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 50, vertical: 8),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    child: Text(
                      S.of(context).show_reports_user_ditils_DeleteTheReport,
                      style: const TextStyle(
                          fontFamily: 'Cario',
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  _showAbdullahAlert() {
    return showDialog(
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
              Lottie.asset('assets/animation/WOR.json',
                  height: 200), // يجب أن تكون الصورة موجودة في مجلد الـ assets
              const SizedBox(height: 10),
              Center(
                child: Text(
                  S.of(context).show_reports_user_ditils_SureOFDelete,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Cario',
                  ),
                ),
              ),
              const SizedBox(height: 10),

              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () async {
                      await FirebaseFirestore.instance
                          .collection('User_Reports')
                          .doc(widget.reportId)
                          .delete();

                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const AdminHomePage(),
                        ),
                      );
                      Fluttertoast.showToast(
                        msg: S
                            .of(context)
                            .show_reports_user_ditils_TheRepotHasBeenDeleted,
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        textColor: Colors.white,
                        fontSize: 16.0,
                      );
                    },
                    child: Text(
                      S.of(context).show_reports_user_ditils_Done,
                      style: const TextStyle(
                        fontFamily: 'Cario',
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.teal,
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      S.of(context).show_reports_user_ditils_Undo,
                      style: const TextStyle(
                        fontFamily: 'Cario',
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.redAccent,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
