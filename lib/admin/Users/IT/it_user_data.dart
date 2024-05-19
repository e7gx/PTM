// ignore_for_file: use_build_context_synchronously

// import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_time/generated/l10n.dart';

import '../../home/home_page_admin.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ITDataInAdminPage extends StatefulWidget {
  final String userId;
  final int userNumber;

  const ITDataInAdminPage({Key? key, required this.userId, this.userNumber = 1})
      : super(key: key);

  @override
  State<ITDataInAdminPage> createState() => _ReportDetailsPageState();
}

class _ReportDetailsPageState extends State<ITDataInAdminPage> {
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
          S.of(context).it_user_data_EmployeeData,
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
            .collection('Users_IT')
            .doc(widget.userId)
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
                  S.of(context).it_user_data_NoReport,
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
                  const SizedBox(height: 10),
                  Image.asset(
                    reportData['imageUrl'] ?? 'assets/images/chat.png',
                    fit: BoxFit.fitWidth,
                    height: 300,
                  ),
                  const SizedBox(height: 16),

                  const SizedBox(height: 16),
                  Text(
                    S.of(context).it_user_data_FirtsName,
                    textAlign: TextAlign.right,
                    style: const TextStyle(
                      fontFamily: 'Cario',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal,
                    ),
                  ),
                  SelectableText(
                    ' ${reportData['first name'] ?? {
                          S.of(context).user_reports_Erorr,
                        }}',
                    textAlign: TextAlign.right,
                    style: const TextStyle(
                      fontFamily: 'Cario',
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    S.of(context).it_user_data_LastName,
                    textAlign: TextAlign.right,
                    style: const TextStyle(
                      fontFamily: 'Cario',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal,
                    ),
                  ),
                  SelectableText(
                    ' ${reportData['last name'] ?? {
                          S.of(context).user_reports_Erorr,
                        }}',
                    textAlign: TextAlign.right,
                    style: const TextStyle(
                      fontSize: 18,
                      fontFamily: 'Cario',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  SafeArea(
                    child: Text(
                      S.of(context).it_user_data_EmailOfEmployee,
                      textAlign: TextAlign.right,
                      style: const TextStyle(
                          fontFamily: 'Cario',
                          fontSize: 20,
                          color: Colors.teal,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SelectableText(
                    reportData['email'] ??
                        {
                          S.of(context).user_reports_Erorr,
                        },
                    textAlign: TextAlign.right,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Cario',
                    ),
                  ),
                  const SizedBox(height: 25),
                  // حدث عند الضغط على زر "نقل البلاغ إلى قسم تقنية المعلومات"
                  ElevatedButton(
                    onPressed: () async {
                      // //! إضافة البلاغ إلى قسم تقنية المعلومات باستخدام بيانات البلاغ المسترجعة من Firestore
                      // Map<String, dynamic> reportData =
                      //     snapshot.data!.data() as Map<String, dynamic>;

                      // await FirebaseFirestore.instance
                      //     .collection('Users_IT')
                      //     .doc(widget.userId)
                      //     .set(reportData);

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
                                Lottie.asset('assets/animation/WOR.json',
                                    height:
                                        200), // يجب أن تكون الصورة موجودة في مجلد الـ assets
                                const SizedBox(height: 10),
                                Center(
                                  child: Text(
                                    S
                                        .of(context)
                                        .it_user_data_SureOFDeleteTheEmployee,
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
                                            .collection('Users_IT')
                                            .doc(widget.userId)
                                            .delete();
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const AdminHomePage(),
                                          ),
                                        );
                                        Fluttertoast.showToast(
                                          msg: S
                                              .of(context)
                                              .it_user_data_DoneDelete,
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.CENTER,
                                          timeInSecForIosWeb: 1,
                                          textColor: Colors.white,
                                          fontSize: 16.0,
                                        );
                                      },
                                      child: Text(
                                        S.of(context).it_user_data_Done,
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
                                        S.of(context).it_user_data_Undo,
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
                      S.of(context).it_user_data_DoneDelete,
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
}
