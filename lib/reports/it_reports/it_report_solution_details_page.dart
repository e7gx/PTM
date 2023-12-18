import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  final TextEditingController locationController = TextEditingController();
  final TextEditingController reportController = TextEditingController();

  void uploadReport(String location, String report) {
    var reportData = {
      'date': Timestamp.now(),
      'location': location,
      'report': report
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
    if (locationController.text.isEmpty || reportController.text.isEmpty) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            title: Lottie.asset(
              'animation/WOR.json',
              height: 290,
            ),
            content: const Text(
                '      يرجى تعبئة جميع الحقول\n         لنتمكن من رفع التقرير',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic)),
            actions: <Widget>[
              TextButton(
                child: const Text('حسنا',
                    style: TextStyle(
                        color: Colors.cyan,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic)),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    } else {
      uploadReport(locationController.text, reportController.text);
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            title: Lottie.asset(
              'animation/like1.json',
              height: 300,
            ),
            content: const Text(
              '          ! شكرًا لك على تعاونك\n  ',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('حسنا',
                    style: TextStyle(
                        color: Colors.cyan, fontStyle: FontStyle.italic)),
                onPressed: () {
                  // هنا تم إضافة تعليمات لمسح النص من الـ Controllers
                  setState(() {
                    reportController.clear();
                    locationController.clear();
                  });
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
      // Show a success dialog
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: const Text(
          "رفع تقرير",
          style: TextStyle(
              color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Lottie.asset(
                'animation/signup1.json',
                fit: BoxFit.contain,
                height: 300,
                width: double.infinity,
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 0),
                  _buildTextField(
                      locationController, 'موقع الجهاز', 'أدخل اسم المعمل'),
                  const SizedBox(height: 30),
                  _buildTextField(
                      reportController, 'حل المشكلة', 'أدخل حل المشكلة'),
                  const SizedBox(height: 30),
                  SizedBox(
                    width: 150,
                    child: ElevatedButton(
                      onPressed: () => _submitReport(context),
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all(
                            const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 40)),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.cyan[400]),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8))),
                      ),
                      child: const Text(
                        'إرسال',
                        style: TextStyle(
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
    );
  }

  Widget _buildTextField(
      TextEditingController controller, String label, String hint,
      {int maxLines = 1}) {
    return TextField(
      controller: controller,
      maxLines: maxLines,
      decoration: InputDecoration(
        border: InputBorder.none,
        filled: true,
        fillColor: Colors.grey[200],
        labelText: label,
        hintText: hint,
        labelStyle: TextStyle(color: Colors.cyan[400]),
        hintStyle: TextStyle(color: Colors.grey[400]),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.cyan[400]!, width: 3.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.cyan[400]!, width: 2.0),
        ),
      ),
    );
  }
}
