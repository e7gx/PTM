import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:lottie/lottie.dart';
import 'package:first_time/style/style.dart';

const List<String> list = <String>[
  'كلية الحاسب',
  'كلية ادارة الاعمال',
  'كلية الشريعة',
  'كلية التاريخ'
];

class RegisterDevice extends StatefulWidget {
  const RegisterDevice({super.key});

  @override
  State<RegisterDevice> createState() => RegisterDeviceState();
}

class RegisterDeviceState extends State<RegisterDevice> {
  final TextEditingController deviceBrandController = TextEditingController();
  final TextEditingController deviceCpuController = TextEditingController();
  final TextEditingController deviceHardDeskController =
      TextEditingController();
  final TextEditingController deviceLocationController =
      TextEditingController();
  final TextEditingController macAddressController = TextEditingController();
  final TextEditingController ministryNumberController =
      TextEditingController();
  final TextEditingController serialNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "تسجيل جهاز جديد",
          style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
        toolbarHeight: 50,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(500),
            bottomLeft: Radius.circular(40),
          ),
        ),
        elevation: 2.00,
        backgroundColor: Colors.cyan,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                'images/pc.png',
                fit: BoxFit.contain,
                height: 300,
                width: double.infinity,
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Center(child: DropdownMenuExample()),
                  const SizedBox(height: 20),
                  buildTextField(deviceBrandController, 'العلامة التجارية',
                      'أدخل العلامة التجارية للجهاز'),
                  const SizedBox(height: 10),
                  buildTextField(
                      deviceCpuController, 'المعالج', 'أدخل نوع المعالج'),
                  const SizedBox(height: 10),
                  buildTextField(deviceHardDeskController, 'القرص الصلب',
                      'أدخل نوع القرص الصلب'),
                  const SizedBox(height: 10),
                  buildTextField(
                      deviceLocationController, 'الموقع', 'أدخل موقع الجهاز'),
                  const SizedBox(height: 10),
                  buildTextField(
                      macAddressController, 'عنوان MAC', 'أدخل عنوان MAC'),
                  const SizedBox(height: 10),
                  buildTextFieldNum(ministryNumberController, 'رقم الوزارة',
                      'أدخل رقم الوزارة'),
                  const SizedBox(height: 10),
                  buildTextFieldNum(serialNumberController, 'الرقم التسلسلي',
                      'أدخل الرقم التسلسلي'),
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

  void uploadReport(String brand, String cpu, String hardDisk, String location,
      String macAddress, String ministryNumber, String serialNumber) {
    var reportData = {
      'date': Timestamp.now(),
      'device_brand': brand,
      'device_cpu': cpu,
      'device_hard_disk': hardDisk,
      'device_location': location,
      'mac_address': macAddress,
      'ministry_number': ministryNumber,
      'serial_number': serialNumber
    };

    FirebaseFirestore.instance
        .collection('devices_assets')
        .add(reportData)
        .then((documentReference) {
      // Handle successful upload here, for example:
      // ignore: avoid_print
      print('Document added with ID: ${documentReference.id}');
    }).catchError((e) {
      // Handle any errors here, for example:
      // ignore: avoid_print
      print('خطاء في قاعدة بيانات تسجيل الاجهزة ');
    });
  }

  void _submitReport(BuildContext context) {
    // Just use the class-level controller instances you've declared at the top.
    // There's no need to declare new ones here.

    if (deviceBrandController.text.isEmpty ||
        deviceCpuController.text.isEmpty ||
        deviceHardDeskController.text.isEmpty ||
        deviceLocationController.text.isEmpty ||
        macAddressController.text.isEmpty ||
        ministryNumberController.text.isEmpty ||
        serialNumberController.text.isEmpty) {
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
      // Again, use the class-level instances when calling uploadReport
      uploadReport(
        deviceBrandController.text,
        deviceCpuController.text,
        deviceHardDeskController.text,
        deviceLocationController.text,
        macAddressController.text,
        ministryNumberController.text,
        serialNumberController.text,
      );
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            title: Lottie.asset(
              'animation/like1.json',
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
                      color: Colors.cyan,
                      fontStyle: FontStyle.italic,
                      fontSize: 16),
                ),
                onPressed: () {
                  // هنا تم إضافة تعليمات لمسح النص من الـ Controllers
                  setState(() {
                    deviceBrandController.clear();
                    deviceCpuController.clear();
                    deviceHardDeskController.clear();
                    deviceLocationController.clear();
                    macAddressController.clear();
                    ministryNumberController.clear();
                    serialNumberController.clear();
                  });
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

class DropdownMenuExample extends StatefulWidget {
  const DropdownMenuExample({super.key});

  @override
  State<DropdownMenuExample> createState() => _DropdownMenuExampleState();
}

class _DropdownMenuExampleState extends State<DropdownMenuExample> {
  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return DropdownMenu<String>(
      initialSelection: list.first,
      onSelected: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          dropdownValue = value!;
        });
      },
      dropdownMenuEntries: list.map<DropdownMenuEntry<String>>((String value) {
        return DropdownMenuEntry<String>(value: value, label: value);
      }).toList(),
    );
  }
}
