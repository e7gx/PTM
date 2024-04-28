import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_time/controller/routes/navbar_drawer.dart';
import 'package:first_time/generated/l10n.dart';
import 'package:first_time/notification/notification.dart';
import 'package:first_time/style/style.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:fluttertoast/fluttertoast.dart';

class DetailsOfTheReceivedReport extends StatefulWidget {
  final String reportId;
  final int reportNumber;
  const DetailsOfTheReceivedReport(
      {required this.reportId, this.reportNumber = 1, Key? key})
      : super(key: key);

  @override
  State<DetailsOfTheReceivedReport> createState() =>
      _DetailsOfTheReceivedReportState();
}

final TextEditingController itreportController = TextEditingController();
final TextEditingController endReportDate = TextEditingController();
// Update the Firestore data model

class _DetailsOfTheReceivedReportState
    extends State<DetailsOfTheReceivedReport> {
  late Stream<DocumentSnapshot> _reportStream;

  @override
  void initState() {
    super.initState();
    // استعلام للحصول على التقرير بناءً على معرف البلاغ و UID المستخدم الحالي
    _reportStream = FirebaseFirestore.instance
        .collection('IT_Reports_Received')
        .doc(widget.reportId)
        .snapshots();
  }

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
          'تفاصيل البلاغ',
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
                Colors.blue,
                Color(0xFF00CCFF),
              ],
              begin: FractionalOffset(0.0, 0.0),
              end: FractionalOffset(3.0, 0.0),
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
        child: StreamBuilder<DocumentSnapshot>(
          stream: _reportStream,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (!snapshot.hasData || snapshot.data!.data() == null) {
              return const Center(
                  child: Text(
                'لا يوجد تفاصيل للبلاغ',
                style: TextStyle(
                  fontFamily: 'Cario',
                  fontSize: 30,
                  color: Colors.lightBlue,
                  fontWeight: FontWeight.bold,
                ),
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
                    const Text(
                      'بلاغ رقم:',
                      style: TextStyle(
                          fontFamily: 'Cario',
                          fontSize: 20,
                          color: Colors.blue,
                          fontWeight: FontWeight.bold),
                    ),

                    Text(
                      '${reportData['reportNumber'] ?? 'No Location'}',
                      style: const TextStyle(
                          fontFamily: 'Cario',
                          fontSize: 30,
                          color: Colors.blue,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'التاريخ:',
                      style: TextStyle(
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
                    const Text(
                      'رقم الجهاز:',
                      style: TextStyle(
                          fontFamily: 'Cario',
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue),
                    ),
                    Text(
                      ' ${reportData['device'] ?? 'No Device Number'}',
                      style: const TextStyle(
                          fontFamily: 'Cario',
                          fontSize: 18,
                          color: Colors.black),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'الموقع:',
                      style: TextStyle(
                          fontFamily: 'Cario',
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue),
                    ),
                    Text(
                      ' ${reportData['selected_option'] ?? 'No Location'}',
                      style: const TextStyle(
                          fontSize: 18,
                          fontFamily: 'Cario',
                          color: Colors.black),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'موقع المعمل:',
                      style: TextStyle(
                          fontFamily: 'Cario',
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue),
                    ),
                    Text(
                      ' ${reportData['location'] ?? 'No Location'}',
                      style: const TextStyle(
                          fontSize: 18,
                          fontFamily: 'Cario',
                          color: Colors.black),
                    ),
                    const SizedBox(height: 16),
                    const SafeArea(
                      child: Text(
                        'وصف المشكلة:',
                        style: TextStyle(
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
                    const SizedBox(height: 34),
                    const SafeArea(
                      child: Text(
                        'يرجى ارفاق تفاصيل حل المشكلة',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: 'Cario',
                            fontSize: 20,
                            color: Colors.blue,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(height: 10),
                    buildTextFieldITReports(itreportController,
                        S.of(context).problem, S.of(context).problemSolve),
                    const SizedBox(height: 25),
                    // حدث عند الضغط على زر "نقل البلاغ إلى قسم تقنية المعلومات"
                    ElevatedButton(
                      onPressed: () async {
                        // Check if the text field is empty
                        if (itreportController.text.isEmpty) {
                          // Show a Snackbar indicating that a report must be written
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              backgroundColor: Color(0xFFFF1100),
                              duration: Duration(seconds: 2),
                              content: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Icon(Icons.error_outline_rounded,
                                      color: Colors.white),
                                  Text(
                                    'you must write a report',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Cario',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        } else {
                          // Show the confirmation dialog
                          showDialog(
                            // ignore: use_build_context_synchronously
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
                                    const Center(
                                      child: Text(
                                        '🪛 شكرا لك على تعاونك',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
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
                                      Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const WelcomePage(),
                                        ),
                                      );
                                      onCertainAction();
                                      Fluttertoast.showToast(
                                        msg: "❤️ شكرا لك",
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.CENTER,
                                        timeInSecForIosWeb: 1,
                                        textColor: Colors.white,
                                        fontSize: 16.0,
                                      );
                                    },
                                    child: const Text(
                                      'موافق',
                                      style: TextStyle(
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
                          Map<String, dynamic> reportData =
                              snapshot.data!.data() as Map<String, dynamic>;
                          reportData['receiver_uid'] =
                              FirebaseAuth.instance.currentUser!.uid;
                          reportData['solution'] = itreportController.text;

// Update the report data with the End Report Date
                          reportData['endReportDate'] = DateTime.now();

// Update the report in the User_Maintenance_Message collection
                          await FirebaseFirestore.instance
                              .collection('User_Maintenance_Message')
                              .doc(widget.reportId)
                              .set(reportData);

// Update the report in the IT_Reports collection
                          await FirebaseFirestore.instance
                              .collection('IT_Reports')
                              .doc(widget.reportId)
                              .set(reportData);

// Delete the report from the IT_Reports_Received collection
                          await FirebaseFirestore.instance
                              .collection('IT_Reports_Received')
                              .doc(widget.reportId)
                              .delete();
                          itreportController.clear();
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color(0xFF0F92EF), // New color for the button
                        padding: const EdgeInsets.symmetric(
                            horizontal: 50, vertical: 8),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14.0),
                        ),
                      ),
                      child: const Text(
                        'أنهاء الطلب',
                        style: TextStyle(
                          fontFamily: 'Cario',
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        showModalBottomSheet(
                          // backgroundColor: Color.fromARGB(255, 255, 255, 255),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(16.0),
                            ),
                          ),
                          context: context,
                          builder: (BuildContext context) {
                            return SizedBox(
                              height: MediaQuery.of(context).size.height,
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          GestureDetector(
                                            onTap: () => Navigator.pop(context),
                                            child: const Icon(
                                              Icons.close_rounded,
                                              size: 40,
                                              color: Colors.blueAccent,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Lottie.asset(
                                      'assets/animation/WOR.json',
                                      width: 300,
                                      height: 150, //  الارتفاع
                                    ),
                                    const SizedBox(height: 10),
                                    const Text(
                                      'أعادة البلاغ',
                                      style: TextStyle(
                                        fontFamily: 'Cario',
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.blueAccent,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    const Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 12.0),
                                      child: Text(
                                        " هنا يتم أعادة البلاغ بسبب عدم التمكن من حل المشكلة من طرفكم وهذا سيكون عليه تأثير على التقييم الخاص بك مستقبلا ",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontFamily: 'Cario',
                                          fontSize: 12,
                                          fontWeight: FontWeight.normal,
                                          color: Colors.blueAccent,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 30),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: ElevatedButton(
                                        onPressed: () async {
                                          await FirebaseFirestore.instance
                                              .collection('IT_Reports_Received')
                                              .doc(widget.reportId)
                                              .delete();

                                          //! إضافة البلاغ إلى قسم تقنية المعلومات باستخدام بيانات البلاغ المسترجعة من Firestore
                                          Map<String, dynamic> reportData =
                                              snapshot.data!.data()
                                                  as Map<String, dynamic>;

                                          await FirebaseFirestore.instance
                                              .collection('User_Reports')
                                              .doc(widget.reportId)
                                              .set(reportData);

                                          showDialog(
                                            // ignore: use_build_context_synchronously
                                            context: context,
                                            builder: (context) {
                                              return AlertDialog(
                                                shape:
                                                    const RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                    Radius.circular(32.0),
                                                  ),
                                                ),
                                                content: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    Lottie.asset(
                                                        'assets/animation/like1.json',
                                                        height:
                                                            200), // يجب أن تكون الصورة موجودة في مجلد الـ assets
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                    const Center(
                                                      child: Text(
                                                        ' 🪛 تم أعادة البلاغ بنجاح',
                                                        style: TextStyle(
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontFamily: 'Cario',
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .push(
                                                        MaterialPageRoute(
                                                          builder: (context) =>
                                                              const WelcomePage(),
                                                        ),
                                                      );
                                                      Fluttertoast.showToast(
                                                        msg:
                                                            "👍 تمت عملية أعادة الطلب",
                                                        toastLength:
                                                            Toast.LENGTH_SHORT,
                                                        gravity:
                                                            ToastGravity.CENTER,
                                                        timeInSecForIosWeb: 1,
                                                        textColor: Colors.white,
                                                        fontSize: 16.0,
                                                      );
                                                    },
                                                    child: const Text(
                                                      'موافق',
                                                      style: TextStyle(
                                                          fontFamily: 'Cario',
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.bold,
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
                                              Colors.blueAccent.shade700,
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 50, vertical: 5),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                        ),
                                        child: const Text(
                                          'أعادة البلاغ',
                                          style: TextStyle(
                                              fontFamily: 'Cario',
                                              fontSize: 16,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    const SizedBox(height: 10),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 50, vertical: 10),
                        backgroundColor: Colors.red,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14.0),
                        ),
                      ),
                      child: const Text(
                        'أعادة البلاغ',
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontFamily: 'Cario',
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
