import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_time/User/controller/home_page_and_bar.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../styles/style.dart';
import 'package:fluttertoast/fluttertoast.dart';

const List<String> collegeList = <String>[
  'كلية الحاسب الالي  جامعة ام القرى',
  'كلية ادارة الاعمال جامعة ام القرى',
  'كلية الشريعة الإسلامية جامعة ام القرى',
  'كلية العلوم التطبيقية جامعة ام القرى'
];

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  User? userId = FirebaseAuth.instance.currentUser;
  int _reportNumber = 0; // Initialize report number

  final TextEditingController locationController = TextEditingController();
  final TextEditingController deviceController = TextEditingController();
  final TextEditingController problemController = TextEditingController();
  final TextEditingController currentUserController = TextEditingController();
  String dropdownValue = collegeList.first;

  @override
  void initState() {
    super.initState();
    _fetchLastReportNumber(); // Fetch last report number when the page initializes
  }

  // Method to fetch the last report number from Firestore
  Future<void> _fetchLastReportNumber() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('User_Reports')
        .orderBy('reportNumber', descending: true)
        .limit(1)
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      _reportNumber = querySnapshot.docs.first['reportNumber'] ?? 0;
    }
  }

  void uploadReport(String location, String device, String problem) {
    _reportNumber++; // Increment report number
    var reportData = {
      'reportNumber': _reportNumber, // Include report number in report data
      'date': FieldValue.serverTimestamp(),
      'location': location,
      'device': device,
      'problem': problem,
      'userUid': FirebaseAuth.instance.currentUser!.uid,
    };

    FirebaseFirestore.instance
        .collection('User_Reports')
        .add(reportData)
        .then((documentReference) {
      // print('Document added with ID: ${documentReference.id}');
    }).catchError((e) {
      // print('Error adding document: $e');
    });
  }

  void _submitReport(BuildContext context) {
    if (locationController.text.isEmpty ||
        deviceController.text.isEmpty ||
        problemController.text.isEmpty) {
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
              'يرجى تعبئة جميع الحقول\nلنتمكن من مساعدتك',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
                fontFamily: 'Cario',
              ),
            ),
            actions: <Widget>[
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
      uploadReport(
        locationController.text,
        deviceController.text,
        problemController.text,
      );
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(35)),
            title: Lottie.asset(
              'assets/animation/like1.json',
              height: 180,
            ),
            content: const Text(
              '! شكرًا لك على تعاونك\n  سيتم تقديم الحل في أقرب وقت',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Cario'),
            ),
            actions: <Widget>[
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
                  Fluttertoast.showToast(
                    msg: "تم ارسال البلاغ👍",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIosWeb: 1,
                    textColor: Colors.white,
                    fontSize: 16.0,
                  );
                  // هنا تم إضافة تعليمات لمسح النص من الـ Controllers
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomePage(),
                    ),
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
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: const Text(
          "تقديم بلاغ",
          style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
              fontFamily: 'Cario'),
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
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFFFFFFF),
              Colors.teal,
              Color(0xFFFFFFFF),
            ],
            begin: Alignment.topRight,
            end: Alignment.bottomRight,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset('assets/images/uqu.png',
                    fit: BoxFit.contain, width: double.infinity, height: 200),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment
                      .stretch, //موقع الزر و طوله في هذي الخاصيه
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 2.0),
                      child: Text(
                        'يجب ملاء جميع الحقول ب بيانات صحيحة لنتمكن من مساعدتكم في اسرع وقت',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.black54,
                            fontFamily: 'Cario'),
                      ),
                    ),
                    const SizedBox(height: 10),
                    DropdownMenuExample(
                      onSelected: (String value) {
                        setState(() {
                          dropdownValue = value;
                        });
                      },
                    ),
                    const SizedBox(height: 20),
                    buildTextFieldLocation(
                      locationController,
                      'الموقع',
                      'أدخل اسم المعمل',
                    ),
                    const SizedBox(height: 10),
                    buildTextFieldNum(
                        deviceController, 'رقم الجهاز', 'أدخل رقم الجهاز'),
                    const SizedBox(height: 10),
                    buildTextFieldTextUserProblem(
                        problemController, 'وصف المشكلة', 'أدخل وصف المشكلة'),
                    const SizedBox(height: 30),
                    SizedBox(
                      width: 150,
                      child: ElevatedButton(
                        onPressed: () => _submitReport(
                          context,
                        ),
                        style: ButtonStyle(
                          padding: MaterialStateProperty.all(
                            const EdgeInsets.symmetric(
                              vertical: 10,
                            ),
                          ),
                          backgroundColor: MaterialStateProperty.all(
                            Colors.teal,
                          ),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                        child: const Text(
                          'إرسال',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontFamily: 'Cario'),
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
}

class DropdownMenuExample extends StatefulWidget {
  final ValueChanged<String> onSelected;

  const DropdownMenuExample({Key? key, required this.onSelected})
      : super(key: key);

  @override
  State<DropdownMenuExample> createState() => _DropdownMenuExampleState();
}

class _DropdownMenuExampleState extends State<DropdownMenuExample> {
  String dropdownValue = collegeList.first;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        border: Border.all(
          color: Colors.teal,
          style: BorderStyle.solid,
        ),
        gradient: const LinearGradient(
          colors: [
            Color(0xFFFFFFFF),
            Colors.teal,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
        child: DropdownButton<String>(
          value: dropdownValue,
          icon: const Padding(
            padding: EdgeInsets.all(5.0),
            child: Icon(
              Icons.location_pin,
              size: 30,
              color: Colors.redAccent,
            ),
          ),
          borderRadius: BorderRadius.circular(20),
          iconSize: 24,
          elevation: 16,
          style: const TextStyle(color: Colors.teal),
          underline: Container(
            color: Colors.transparent,
          ),
          onChanged: (String? newValue) {
            setState(() {
              dropdownValue = newValue!;
              widget.onSelected(newValue); // Notify the parent widget
            });
          },
          items: collegeList.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
                style: const TextStyle(
                  fontFamily: 'Cario',
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
