import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class DitelsUserMintines extends StatelessWidget {
  final String userReportId;

  const DitelsUserMintines({super.key, required this.userReportId});

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
                .doc(userReportId)
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
                    const SizedBox(height: 0),
                    const Text(
                      'رقم الجهاز او رقم البلاغ:',
                      style: TextStyle(
                        fontFamily: 'Cario',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      reportData['device'] ?? 'لا يوجد وصف متاح.',
                      style:
                          const TextStyle(fontSize: 16, color: Colors.black87),
                    ),
                    const SizedBox(height: 10),
                    // النصوص والمحتويات الأخرى تأتي هنا
                    const Text(
                      'تاريخ التقرير:',
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
                      reportData['problem'] ?? 'لا يوجد وصف متاح.',
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black87,
                        fontFamily: 'Cario',
                      ),
                    ),
                    const SizedBox(height: 20),

                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          showModalBottomSheet(
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(16.0),
                              ),
                            ),
                            // context and builder are
                            // required properties in this widget
                            context: context,
                            builder: (BuildContext context) {
                              // we set up a container inside which
                              // we create center column and display text

                              // Returning SizedBox instead of a Container
                              return SizedBox(
                                height: 500,
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      const Text(
                                        'تقييم الخدمة',
                                        style: TextStyle(
                                          fontFamily: 'Cario',
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.teal,
                                        ),
                                      ),
                                      const SizedBox(height: 15),
                                      const Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 12.0),
                                        child: Text(
                                          'يمكنك هنا تقييم الخدمة التي قدمت لك من قبل الدعم الفني نرجو ان يكون هنالك مصداقية في عملية التقييم لكي لايؤثر الامر سلبا على الموظف',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontFamily: 'Cario',
                                            fontSize: 14,
                                            fontWeight: FontWeight.normal,
                                            color: Colors.teal,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 15),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Card(
                                          color: Colors.transparent,
                                          shadowColor: Colors.tealAccent,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(16.0),
                                          ),
                                          child: Center(
                                            child: RatingBar.builder(
                                              initialRating: 3,
                                              minRating: 1,
                                              direction: Axis.horizontal,
                                              allowHalfRating: true,
                                              itemCount: 5,
                                              itemPadding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 4.0),
                                              itemBuilder: (context, _) =>
                                                  const Icon(
                                                Icons.star,
                                                color: Colors.yellowAccent,
                                              ),
                                              onRatingUpdate: (rating) {
                                                // print(rating);
                                              },
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 15),
                                      ElevatedButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                          Navigator.pop(context);
                                          Navigator.pop(context);
                                          Navigator.pop(context);
                                        },
                                        style: ElevatedButton.styleFrom(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 50, vertical: 8),
                                          backgroundColor: Colors.teal,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(14.0),
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
                      ),
                    ),

                    const SizedBox(height: 20),
                  ],
                ),
              );
            },
          ),
        ),
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
