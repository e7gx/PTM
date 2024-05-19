import 'package:first_time/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
// import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:first_time/style/style.dart';

const List<String> collegeList = <String>[
  'كلية الحاسب الالي  جامعة ام القرى',
  'كلية ادارة الاعمال جامعة ام القرى',
  'كلية الشريعة الإسلامية جامعة ام القرى',
  'كلية العلوم التطبيقية جامعة ام القرى'
];
const List<String> brandOptions = <String>[
  'Apple',
  'Samsung',
  'Huawei',
  'Lenovo',
  'Dell',
  'HP',
  'Asus',
  'Acer',
  'Microsoft',
];
const List<String> operatingSystemOptions = <String>[
  'Windows',
  'macOS',
  'Linux',
  'iOS',
  'Android',
  'Chrome OS',
];
const List<String> cpuTypeOptions = <String>[
  'Intel Core i9',
  'Intel Core i7',
  'Intel Core i5',
  'Intel Core i3',
  'Intel Xeon',
  'Intel Pentium',
  'Intel Celeron',
];
const List<String> hardDiskOptions = <String>[
  'HDD (Hard Disk Drive)',
  'SSD (Solid State Drive)',
  'Hybrid Drive',
  'SAS (Serial Attached SCSI)',
  'NVMe (Non-Volatile Memory Express)',
  'External HDD',
];
const List<String> locationOptions = <String>[
  'Cis Lab 1',
  'Cis Lab 2',
  'Cis Lab 3',
  'Cis Lab 4',
  'Cis Lab 5',
  'Cis Lab 6',
  'Cis Lab 7',
  'Cis Lab 8',
  'Cis Lab 9',
  'Cis Lab 10',
  'Cis Lab 11',
  'Cis Lab 12',
  'Cis Lab 13',
  'Cis Lab 14',
  'Cis Lab 15',
  'Cis Lab 16',
  'Cis Lab 17',
];

class RegisterDevice extends StatefulWidget {
  const RegisterDevice({Key? key}) : super(key: key);

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
  final TextEditingController operatingSystemController =
      TextEditingController();
  String dropdownValue = collegeList.first;

  @override
  Widget build(BuildContext context) {
    // var height = MediaQuery.of(context).size.height;
    // var width = MediaQuery.of(context).size.width;
    // var aspectRatio = MediaQuery.of(context).size.aspectRatio;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () {
            Navigator.pop(context);
            Navigator.pop(context);
          },
        ),
        title: Text(
          S.of(context).register_assets_RegisterNewDevice,
          style: const TextStyle(
            fontFamily: 'Cario',
            fontSize: 21,
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
                Colors.teal,
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
              Colors.teal,
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
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    DropdownMenuExample(
                      onSelected: (String value) {
                        setState(() {
                          dropdownValue = value;
                        });
                      },
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 200,
                      width: double.infinity,
                      child: _buildTextField(
                          deviceBrandController,
                          S.of(context).register_assets_BrandName,
                          S.of(context).register_assets_BrandNameEnter,
                          brandOptions),
                    ),
                    const SizedBox(height: 10),
                    _buildTextField(
                        operatingSystemController,
                        S.of(context).register_assets_OS,
                        S.of(context).register_assets_EnterOs,
                        operatingSystemOptions),
                    const SizedBox(height: 10),
                    _buildTextField(
                        deviceCpuController,
                        S.of(context).register_assets_Processor,
                        S.of(context).register_assets_ProcessorName,
                        cpuTypeOptions),
                    const SizedBox(height: 10),
                    _buildTextField(
                        deviceHardDeskController,
                        S.of(context).register_assets_HardDisk,
                        S.of(context).register_assets_HardDiskNAme,
                        hardDiskOptions),
                    const SizedBox(height: 10),
                    _buildTextField(
                      deviceLocationController,

                      S.of(context).register_assets_Location,
                      S.of(context).register_assets_EnterDeviceLocation,
                      locationOptions, // Assuming you have a list named locationOptions with location options
                    ),
                    const SizedBox(height: 40),
                    buildTextField(
                      macAddressController,
                      S.of(context).register_assets_MacAddress,
                      S.of(context).register_assets_EnterMAcAddress,
                    ),
                    const SizedBox(height: 30),
                    buildTextFieldNum(
                      ministryNumberController,
                      S.of(context).register_assets_MinisterialNumber,
                      S.of(context).register_assets_EnterMinisterialNumber,
                    ),
                    const SizedBox(height: 10),
                    buildTextFieldNum(
                      serialNumberController,
                      S.of(context).register_assets_SerialNumber,
                      S.of(context).register_assets_EnterSerialNumber,
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
                            Colors.teal,
                          ),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                        child: Text(
                          S.of(context).register_assets_Sent,
                          style: const TextStyle(
                            fontFamily: 'Cario',
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

  Widget _buildTextField(TextEditingController controller, String label,
      String hint, List<String> options,
      {int maxLines1 = 1}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            border: Border.all(
              color: Colors.teal,
              style: BorderStyle.solid,
            ),
            gradient: const LinearGradient(
              colors: [Color(0xFFFFFFFF), Colors.teal],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 20),
            child: DropdownButtonFormField<String>(
              icon: const Icon(
                Icons.arrow_drop_down,
                color: Colors.teal,
              ),
              decoration: InputDecoration(
                labelText: label,
                hintText: hint,
                labelStyle: const TextStyle(color: Colors.teal),
                filled: true,
                fillColor: Colors.white54,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide:
                      const BorderSide(color: Colors.transparent, width: 0),
                ),
              ),
              value: controller.text.isEmpty ? null : controller.text,
              onChanged: (String? newValue) {
                controller.text = newValue!;
              },
              items: options.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: const TextStyle(
                        fontFamily: 'Cario',
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
        const SizedBox(height: 10),
        TextFormField(
          controller: controller,
          maxLines: maxLines1,
          style: const TextStyle(
            color: Colors.teal,
            fontFamily: 'Cario',
          ),
          decoration: InputDecoration(
            labelText: S.of(context).register_assets_ExtrsInfo,
            labelStyle: const TextStyle(color: Colors.teal),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.teal, width: 2.0),
            ),
            filled: true,
            fillColor: Colors.white,
            hintText: S.of(context).register_assets_ExtrsInfo,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: Colors.transparent,
                width: 4.0,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide:
                  const BorderSide(color: Colors.transparent, width: 2.0),
            ),
          ),
          onChanged: (String value) {
            controller.text = value;
          },
          validator: (value) {
            if (value!.isEmpty) {
              return 'Please enter something';
            }
            return null;
          },
          inputFormatters: [
            TextInputFormatter.withFunction((oldValue, newValue) {
              // Allow newValue if it's empty or doesn't start with a space
              if (newValue.text.isEmpty || newValue.text[0] != ' ') {
                return newValue;
              }
              // Otherwise, return oldValue to prevent adding the space at the beginning
              return oldValue;
            }),
          ],
        ),
      ],
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
            content: Text(
              S.of(context).register_assets_AbleToSumbitReport,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontFamily: 'Cario',
                fontSize: 16,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: Text(
                  S.of(context).register_assets_Ok,
                  style: const TextStyle(
                    fontFamily: 'Cario',
                    color: Colors.teal,
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
            content: Text(
              S.of(context).register_assets_Ty4Cooperation,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontFamily: 'Cario',
                fontSize: 18,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: Text(
                  S.of(context).register_assets_Ok,
                  style: const TextStyle(
                    color: Colors.teal,
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
          colors: [Color(0xFFFFFFFF), Colors.teal],
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
              color: Colors.teal,
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
