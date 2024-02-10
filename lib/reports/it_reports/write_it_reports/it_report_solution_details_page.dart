import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:first_time/style/style.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  final TextEditingController locationController = TextEditingController();
  final TextEditingController itreportController = TextEditingController();
  final TextEditingController userreportNumController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        title: const Text(
          "رفع تقرير",
          style: TextStyle(
              fontFamily: 'Cario',
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
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
        reverse: true,
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 255, 255, 255),
                Color.fromARGB(255, 169, 223, 255),
              ],
              begin: Alignment.topRight,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Column(
            children: [
              const SizedBox(height: 20),
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Lottie.asset(
                  'assets/animation/signup1.json',
                  fit: BoxFit.contain,
                  height: 300,
                  width: double.infinity,
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    buildTextFieldNum(
                      userreportNumController,
                      'رقم البلاغ',
                      'أدخل رقم البلاغ',
                    ),
                    const SizedBox(height: 10),
                    buildTextFieldITReportslocation(
                        locationController, 'موقع الجهاز', 'أدخل اسم المعمل'),
                    const SizedBox(height: 30),
                    buildTextFieldITReports(
                        itreportController, 'حل المشكلة', 'أدخل حل المشكلة'),
                    const SizedBox(height: 30),
                    SizedBox(
                      width: 150,
                      child: ElevatedButton(
                        onPressed: () => _submitReport(context),
                        style: ButtonStyle(
                          padding: MaterialStateProperty.all(
                              const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 40)),
                          backgroundColor: MaterialStateProperty.all(
                            const Color.fromARGB(255, 15, 146, 239),
                          ),
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8))),
                        ),
                        child: const Text(
                          'إرسال',
                          style: TextStyle(
                              fontFamily: 'Cario',
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void uploadReport(String location, String report, String numberReport) {
    var reportData = {
      'date': Timestamp.now(),
      'user_report_num': numberReport,
      'location': location,
      'it_report_solution': report
    };

    FirebaseFirestore.instance
        .collection('IT_Reports')
        .add(reportData)
        .then((documentReference) {
      // ignore: avoid_print
      print('Document added with ID: ${documentReference.id}');
      // Handle successful upload here
    }).catchError((e) {
      // ignore: avoid_print
      print(e);
    });
  }

  void _submitReport(BuildContext context) {
    // Just use the class-level controller instances you've declared at the top.
    // There's no need to declare new ones here.

    if (locationController.text.isEmpty ||
        itreportController.text.isEmpty ||
        userreportNumController.text.isEmpty) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            title: Lottie.asset(
              'assets/animation/WOR.json',
              height: 290,
            ),
            content: const Text(
                '      يرجى تعبئة جميع الحقول\n         لنتمكن من رفع التقرير',
                style: TextStyle(
                    fontFamily: 'Cario',
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic)),
            actions: <Widget>[
              TextButton(
                child: const Text(
                  'حسنا',
                  style: TextStyle(
                      fontFamily: 'Cario',
                      color: Color.fromARGB(255, 109, 194, 255),
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    } else {
      // Again, use the class-level instances when calling uploadReport
      uploadReport(
        locationController.text,
        itreportController.text,
        userreportNumController.text,
      );
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            title: Lottie.asset(
              'assets/animation/like1.json',
              height: 300,
            ),
            content: const Row(
              children: [
                Text(
                  '      ! شكرًا لك على تعاونك',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
            actions: <Widget>[
              TextButton(
                child: const Text(
                  'حسنا',
                  style: TextStyle(
                      color: Color.fromARGB(255, 15, 146, 239),
                      fontStyle: FontStyle.italic,
                      fontSize: 16),
                ),
                onPressed: () {
                  // هنا تم إضافة تعليمات لمسح النص من الـ Controllers
                  setState(() {
                    locationController.clear();
                    itreportController.clear();
                    userreportNumController.clear();
                  });
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }
}
