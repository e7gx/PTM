import 'package:first_time/controller/routes/navbar_drawer.dart';
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
        title: Text(
          'تفاصيل بلاغ رقم ${widget.reportNumber}',
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
                    Text(
                      'بلاغ رقم:\n ${widget.reportNumber}',
                      style: const TextStyle(
                          fontFamily: 'Cario',
                          fontSize: 20,
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
                    const SizedBox(height: 25),
                    // حدث عند الضغط على زر "نقل البلاغ إلى قسم تقنية المعلومات"
                    ElevatedButton(
                      onPressed: () async {
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
                                  const Center(
                                    child: Text(
                                      '🪛  شكرا لك على تعاونك\n نامل كتابة التقرير الخاص بالبلاغ',
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

                        // حذف البلاغ من قسم الدعم الفني
                        await FirebaseFirestore.instance
                            .collection('IT_Reports_Received')
                            .doc(widget.reportId)
                            .delete();
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
                      child: const Text(
                        'أنهاء الطلب',
                        style: TextStyle(
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
      ),
    );
  }
}
