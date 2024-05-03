import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_time/User/Data/how_are_we.dart';
import 'package:first_time/User/Styles/style.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class DitelsUserMintines extends StatefulWidget {
  final String userReportId;

  const DitelsUserMintines({super.key, required this.userReportId});

  @override
  State<DitelsUserMintines> createState() => _DitelsUserMintinesState();
}

class _DitelsUserMintinesState extends State<DitelsUserMintines> {
  final TextEditingController userRateTextController = TextEditingController();
  double userRateNum = 0.0;

  TextEditingController userRateNumController = TextEditingController();

  void uploadReport(
    String userRateText,
    double userRateNum, // Assuming rateNum is of type double in Firestore
  ) {
    var reportData = {
      'date': FieldValue.serverTimestamp(),
      'rateText': userRateText,
      'rateNum': userRateNum, // Pass the rating directly
      'User_uid': FirebaseAuth.instance.currentUser!.uid,
    };

    FirebaseFirestore.instance
        .collection('User_feedback')
        .add(reportData)
        .then((documentReference) {
      // print('Document added with ID: ${documentReference.id}');
    }).catchError((e) {
      // print(e);
    });
  }

  void _submitReport(BuildContext context) {
    if (userRateTextController.text.isEmpty) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(35)),
            title: Lottie.asset(
              'assets/animation/WOR.json',
              height: 200,
            ),
            content: const Text(
              'يرجى تعبئة جميع الحقول',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
                fontFamily: 'Cario',
              ),
            ),
            actions: [
              TextButton(
                child: const Text(
                  'حسنا',
                  style: TextStyle(
                    color: Colors.tealAccent,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Cario',
                  ),
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
      uploadReport(userRateTextController.text.trim(), userRateNum);
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(35),
            ),
            title: Lottie.asset(
              'assets/animation/like1.json',
              height: 180,
            ),
            content: const Text(
              '! شكرًا لك على تعاونك',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Cario'),
            ),
            actions: [
              TextButton(
                child: const Text(
                  'حسنا',
                  style: TextStyle(
                    color: Colors.tealAccent,
                    fontFamily: 'Cario',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pop(context);
                  Navigator.pop(context);
                  Navigator.pop(context);
                  Navigator.pop(context);

                  Fluttertoast.showToast(
                    msg: "🚀 تم الإرسال",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIosWeb: 1,
                    textColor: Colors.white,
                    fontSize: 16.0,
                  );
                },
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            colors: [
              Color(0xFF698EFF),
              Color(0xFF00CCFF),
            ],
            begin: FractionalOffset(0.0, 0.0),
            end: FractionalOffset(1.0, 0.0),
            stops: [0.0, 1.0],
            tileMode: TileMode.clamp),
      ),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new_rounded),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: const Text(
            'تفاصيل الصيانة',
            style: TextStyle(
              fontFamily: 'Cario',
              color: Colors.white,
              fontSize: 22, //  تغيير هذه القيمة لتكون الحجم
              fontWeight: FontWeight.bold,
            ),
          ),
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.teal, Colors.tealAccent],
                  begin: FractionalOffset(0.0, 0.0),
                  end: FractionalOffset(1.0, 0.0),
                  stops: [0.0, 1.0],
                  tileMode: TileMode.clamp),
            ),
          ),
          centerTitle: true,
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.white,
                Colors.tealAccent,
              ],
              begin: Alignment.topRight,
              end: Alignment.bottomCenter,
            ),
          ),
          child: FutureBuilder<DocumentSnapshot>(
            future: FirebaseFirestore.instance
                .collection('User_Maintenance_Message')
                .doc(widget.userReportId)
                .get(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              }
              if (!snapshot.hasData || snapshot.data!.data() == null) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Lottie.asset('assets/animation/like1.json', height: 200),
                    const SizedBox(width: 475),
                    const Text(
                      'لا يوجد تفاصيل للصيانة',
                      style: TextStyle(
                        fontFamily: 'Cario',
                        color: Colors.blue,
                        fontSize: 24, //  تغيير هذه القيمة لتكون الحجم
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                );
              }

              var reportData = snapshot.data!.data() as Map<String, dynamic>;

              return SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // الصورة في الأعلى
                    Lottie.asset(
                      'assets/animation/userLog2.json',
                      width: 400,
                      height: 200, //  الارتفاع
                      fit: BoxFit.contain,
                    ),
                    const SizedBox(height: 50),
                    const Text(
                      'رقم البلاغ:',
                      style: TextStyle(
                        fontFamily: 'Cario',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      reportData['reportNumber'].toString(),
                      style: const TextStyle(
                        fontFamily: 'Cario',
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                    const SizedBox(height: 10),
                    // النصوص والمحتويات الأخرى تأتي هنا
                    const Text(
                      'تاريخ بداية البلاغ:',
                      style: TextStyle(
                        fontFamily: 'Cario',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF0F92EF),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      DateFormat('dd/MM/yyyy')
                          .format((reportData['date'] as Timestamp).toDate()),
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 10),
                    // النصوص والمحتويات الأخرى تأتي هنا
                    const Text(
                      'تاريخ نهاية البلاغ:',
                      style: TextStyle(
                        fontFamily: 'Cario',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF0F92EF),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      DateFormat('dd/MM/yyyy').format(
                          (reportData['endReportDate'] as Timestamp).toDate()),
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'الموقع:',
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Cario',
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 15, 146, 239),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      '${reportData['location']}',
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black87,
                        fontFamily: 'Cario',
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'وصف المشكلة:',
                      style: TextStyle(
                        fontFamily: 'Cario',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF0F92EF),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      reportData['problem'] ?? 'لا يوجد وصف متاح.',
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black87,
                        fontFamily: 'Cario',
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'بيانات التواصل:',
                      style: TextStyle(
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
                    const SizedBox(height: 10),
                    const Text(
                      'حل المشكلة:',
                      style: TextStyle(
                        fontFamily: 'Cario',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF0F92EF),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      reportData['solution'] ?? 'لا يوجد وصف متاح.',
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black87,
                        fontFamily: 'Cario',
                      ),
                    ),
                    const SizedBox(height: 20),

                    Center(
                      child: rateService(),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

//!ويدجت خاصة بتقييم الخدمة تم ربط تقييم الخدمة ب فايربيس
  ElevatedButton rateService() {
    return ElevatedButton(
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
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: () => Navigator.pop(context),
                            child: const Icon(
                              Icons.close_rounded,
                              size: 40,
                              color: Colors.teal,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Lottie.asset(
                      'assets/animation/like1.json',
                      width: 200,
                      height: 150, //  الارتفاع
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'تقييم الخدمة',
                      style: TextStyle(
                        fontFamily: 'Cario',
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.teal,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12.0),
                      child: Text(
                        ' هنا تقييم الخدمة التي قدمت لك من قبل الدعم الفني نرجو ان يكون هنالك مصداقية في عملية التقييم لكي لايؤثر الامر سلبا على الموظف',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Cario',
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                          color: Colors.teal,
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: buildTextFieldTextUserRating(
                        userRateTextController,
                        'تقييم الخدمة',
                        'أدخل وصف الخدمة',
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        color: Colors.transparent,
                        shadowColor: Colors.tealAccent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        child: Center(
                          child: RatingBar.builder(
                            initialRating: 3,
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemPadding:
                                const EdgeInsets.symmetric(horizontal: 4.0),
                            itemBuilder: (context, _) => const Icon(
                              Icons.star,
                              color: Colors.yellowAccent,
                            ),
                            onRatingUpdate: (rating) {
                              setState(() {
                                userRateNum = rating;
                              });
                              // print(userRateNum);
                            },
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: () {
                          _submitReport(context);
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 75, vertical: 8),
                          backgroundColor: Colors.teal,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14.0),
                          ),
                        ),
                        child: const Text(
                          'إرسال',
                          style: TextStyle(
                            fontFamily: 'Cario',
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HowAreWe(),
                          ),
                        );
                      },
                      child: const Text(
                        'أضغط هنا لعرض بيانات التواصل',
                        style: TextStyle(
                          fontFamily: 'Cario',
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          color: Colors.teal,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            );
          },
        );
      },
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
        backgroundColor: Colors.teal,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14.0),
        ),
      ),
      child: const Text(
        'تقييم الخدمة',
        style: TextStyle(
            fontSize: 16,
            color: Colors.white,
            fontFamily: 'Cario',
            fontWeight: FontWeight.bold),
      ),
    );
  }
}

class Report {
  final String title;
  final String date;
  final String location;
  final String image;

  Report({
    required this.title,
    required this.date,
    required this.location,
    required this.image,
  });
}
