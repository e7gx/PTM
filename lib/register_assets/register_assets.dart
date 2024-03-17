import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lottie/lottie.dart';
import 'package:first_time/style/style.dart';

const List<String> list = <String>[
  ' كلية الحاسب الالي  جامعة ام القرى',
  ' كلية ادارة الاعمال جامعة ام القرى',
  'كلية الشريعة جامعة ام القرى',
  'كلية التاريخ جامعة ام القرى'
];

class RegisterDevice extends StatefulWidget {
  const RegisterDevice({super.key});

  @override
  State<RegisterDevice> createState() => RegisterDeviceState();
}

class RegisterDeviceState extends State<RegisterDevice> {
  String dropdownValue = list.first;
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
  final TextEditingController operatingSystemController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          "تسجيل جهاز جديد",
          style: TextStyle(
            fontFamily: 'Cario',
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
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
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF698EFF),
                Color(0xFF00CCFF),
              ],
              begin: FractionalOffset(0.0, 0.0),
              end: FractionalOffset(1.0, 0.0),
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp,
            ),
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFFFFFFF),
              Colors.lightBlue,
              Color(0xFFFFFFFF),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  'assets/images/uqu.png',
                  fit: BoxFit.contain,
                  height: 250,
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
                    DropdownMenuExample(
                      onChanged: (value) {
                        setState(() {
                          dropdownValue = value;
                        });
                      },
                      onSelected: (String value) {
                        setState(() {
                          dropdownValue = value;
                        });
                      },
                    ),
                    const SizedBox(height: 20),
                    buildTextField(
                      deviceBrandController,
                      'العلامة التجارية',
                      'أدخل العلامة التجارية للجهاز',
                    ),
                    const SizedBox(height: 10),
                    buildTextField(
                      operatingSystemController,
                      'نظام التشغيل',
                      'أدخل نوع نظام التشغيل',
                    ),
                    const SizedBox(height: 10),
                    buildTextField(
                      deviceCpuController,
                      'المعالج',
                      'أدخل نوع المعالج',
                    ),
                    const SizedBox(height: 10),
                    buildTextField(
                      deviceHardDeskController,
                      'القرص الصلب',
                      'أدخل نوع القرص الصلب',
                    ),
                    const SizedBox(height: 10),
                    buildTextField(
                      deviceLocationController,
                      'الموقع',
                      'أدخل موقع الجهاز',
                    ),
                    const SizedBox(height: 10),
                    buildTextField(
                      macAddressController,
                      'عنوان MAC',
                      'أدخل عنوان MAC',
                    ),
                    const SizedBox(height: 10),
                    buildTextFieldNum(
                      ministryNumberController,
                      'رقم الوزارة',
                      'أدخل رقم الوزارة',
                    ),
                    const SizedBox(height: 10),
                    buildTextFieldNum(
                      serialNumberController,
                      'الرقم التسلسلي',
                      'أدخل الرقم التسلسلي',
                    ),
                    const SizedBox(height: 30),
                    SizedBox(
                      width: 150,
                      child: ElevatedButton(
                        onPressed: () => _submitReport(context),
                        style: ButtonStyle(
                          padding: MaterialStateProperty.all(
                            const EdgeInsets.symmetric(
                              vertical: 10,
                              horizontal: 40,
                            ),
                          ),
                          backgroundColor: MaterialStateProperty.all(
                            const Color.fromARGB(255, 15, 146, 239),
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
                          ),
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

  void uploadReport(
      String brand,
      String cpu,
      String hardDisk,
      String location,
      String macAddress,
      String ministryNumber,
      String serialNumber,
      String operatingSystem) {
    var reportData = {
      'date': Timestamp.now(),
      'device_brand': brand,
      'device_cpu': cpu,
      'device_hard_disk': hardDisk,
      'device_location': location,
      'mac_address': macAddress,
      'ministry_number': ministryNumber,
      'serial_number': serialNumber,
      'operating _system': operatingSystem,
      'selected_option': dropdownValue,
    };

    FirebaseFirestore.instance
        .collection('devices_assets')
        .add(reportData)
        .then((documentReference) {
      // Handle successful upload here, for example:
      // print('Document added with ID: ${documentReference.id}');
    }).catchError((e) {
      // Handle any errors here, for example:
      // print('Error uploading data to Firestore: $e');
    });
  }

  void _submitReport(BuildContext context) {
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
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(35),
            ),
            title: Lottie.asset(
              'assets/animation/WOR.json',
              height: 190,
            ),
            content: const Text(
              'يُرجى تعبئة جميع الحقول\nلنتمكن من رفع التقرير',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Cario',
                fontSize: 16,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text(
                  'حسنًا',
                  style: TextStyle(
                    fontFamily: 'Cario',
                    color: Colors.cyan,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
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
        deviceBrandController.text,
        deviceCpuController.text,
        deviceHardDeskController.text,
        deviceLocationController.text,
        macAddressController.text,
        ministryNumberController.text,
        serialNumberController.text,
        operatingSystemController.text,
      );
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(36),
            ),
            title: Lottie.asset(
              'assets/animation/like1.json',
              height: 200,
            ),
            content: const Text(
              '! شكرًا لك على تعاونك',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Cario',
                fontSize: 18,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text(
                  'حسنًا',
                  style: TextStyle(
                    color: Colors.cyan,
                    fontStyle: FontStyle.italic,
                    fontSize: 16,
                  ),
                ),
                onPressed: () {
                  setState(() {
                    deviceBrandController.clear();
                    deviceCpuController.clear();
                    deviceHardDeskController.clear();
                    deviceLocationController.clear();
                    macAddressController.clear();
                    ministryNumberController.clear();
                    serialNumberController.clear();
                    operatingSystemController.clear();
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
  final ValueChanged<String> onSelected;

  const DropdownMenuExample(
      {Key? key,
      required this.onSelected,
      required Null Function(dynamic value) onChanged})
      : super(key: key);

  @override
  State<DropdownMenuExample> createState() => _DropdownMenuExampleState();
}

class _DropdownMenuExampleState extends State<DropdownMenuExample> {
  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        border: Border.all(
          color: Colors.blue,
          style: BorderStyle.solid,
        ),
        gradient: const LinearGradient(
          colors: [
            Color(0xFFFFFFFF),
            Color(0xFFA9DFFF),
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
            padding: EdgeInsets.all(8.0),
            child: Icon(
              Icons.location_city,
              size: 30,
              color: Colors.blue,
            ),
          ),
          // dropdownColor: Colors.grey,
          borderRadius: BorderRadius.circular(20),
          iconSize: 24,
          elevation: 16,
          style: const TextStyle(color: Colors.blue),
          underline: Container(
            color: Colors.transparent,
          ),
          onChanged: (String? newValue) {
            setState(() {
              dropdownValue = newValue!;
              widget.onSelected(newValue); // Notify the parent widget
            });
          },
          items: list.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Center(
                child: Text(
                  value,
                  style: const TextStyle(
                    fontFamily: 'Cario',
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
