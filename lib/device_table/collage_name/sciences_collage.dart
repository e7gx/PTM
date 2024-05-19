import 'package:first_time/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DeviceInfo {
  final String brandOfDevice;
  final String deviceLocation;
  final String deviceHarddisk;
  final String deviceCpu;
  final String ministryNumber;
  final String serialNumber;
  final String collageName;
  final String date;

  final String macAddress;

  DeviceInfo(
    this.brandOfDevice,
    this.deviceLocation,
    this.deviceHarddisk,
    this.deviceCpu,
    this.ministryNumber,
    this.serialNumber,
    this.collageName,
    this.date,
    this.macAddress,
  );
}

class SciencesCollage extends StatelessWidget {
  const SciencesCollage({super.key});

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
        title: Text(
          S.of(context).business_collage_DeviceInfo,
          style: const TextStyle(
              color: Colors.white,
              fontFamily: 'Cario',
              fontWeight: FontWeight.bold),
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
                tileMode: TileMode.clamp),
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: true,
        toolbarHeight: 50,
        automaticallyImplyLeading: true,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFC0D0FF),
              Colors.lightBlue,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('devices_assets')
              .where('selected_option',
                  isEqualTo: 'كلية العلوم التطبيقية جامعة ام القرى')
              .snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            }
            if (snapshot.hasData) {
              final devices = snapshot.data!.docs.map((doc) {
                final data = doc.data() as Map<String, dynamic>;
                return DeviceInfo(
                  data['device_brand'] ?? 'البيانات غير متوفرة',
                  data['device_location'] ?? 'البيانات غير متوفرة',
                  data['device_hard_disk'] ?? 'البيانات غير متوفرة',
                  data['device_cpu'] ?? 'البيانات غير متوفرة',
                  data['ministry_number'] ?? 'البيانات غير متوفرة',
                  data['serial_number'] ?? 'البيانات غير متوفرة',
                  data['selected_option'] ?? 'البيانات غير متوفرة',
                  data['mac_address'] ?? 'البيانات غير متوفرة',
                  data['mac_address'] ?? 'البيانات غير متوفرة',
                );
              }).toList();
              return DeviceList(devices: devices);
            }
            return const Center(child: Text('No data available'));
          },
        ),
      ),
    );
  }
}

class DeviceList extends StatefulWidget {
  const DeviceList({super.key, required this.devices});

  final List<DeviceInfo> devices;
  @override
  // ignore: library_private_types_in_public_api
  _DeviceListState createState() => _DeviceListState();
}

class _DeviceListState extends State<DeviceList> {
  final PageController _pageController = PageController();
  int _currentPage = 1;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: widget.devices.length,
                onPageChanged: (int page) {
                  setState(() {
                    _currentPage = page + 1;
                  });
                },
                itemBuilder: (context, index) {
                  final device = widget.devices[index];
                  return SingleChildScrollView(
                    child: SafeArea(
                      child: Card(
                        elevation: 3.0,
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(15.0), // Rounded corners
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ListTile(
                              leading: Image.asset(
                                'assets/images/uqu.png', // Replace with the device image
                                width: 50.0, // Image size
                                height: 50.0,
                              ),
                              selected: true,
                              trailing: const Icon(
                                Icons.location_city_sharp,
                                color: Colors.blue,
                                size: 30,
                              ),
                              title: Text(
                                S.of(context).business_collage_MainSite,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontFamily: 'Cario',
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              subtitle: SelectableText(
                                device.collageName,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    fontSize: 12.0,
                                    color: Colors.black87,
                                    fontFamily: 'Cario',
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            ListTile(
                              leading: Image.asset(
                                'assets/images/uqu.png', // Replace with the device image
                                width: 50.0, // Image size
                                height: 50.0,
                              ),
                              selected: true,
                              trailing: const Icon(
                                Icons.home_work_sharp,
                                color: Colors.blue,
                                size: 30,
                              ),
                              title: Text(
                                S.of(context).business_collage_SubSite,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontFamily: 'Cario',
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              subtitle: SelectableText(
                                ' ${device.deviceLocation}', //! Location
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    fontSize: 15.0,
                                    color: Colors.black87,
                                    fontFamily: 'Cario',
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            //!.....................................

                            ListTile(
                              leading: Image.asset(
                                'assets/images/uqu.png', // Replace with the device image
                                width: 50.0, // Image size
                                height: 50.0,
                              ),
                              selected: true,
                              trailing: const Icon(
                                Icons.important_devices_rounded,
                                color: Colors.blue,
                                size: 30,
                              ),
                              title: Text(
                                S.of(context).business_collage_DeviceModel,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontFamily: 'Cario',
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              subtitle: SelectableText(
                                device.brandOfDevice,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    fontSize: 12.0,
                                    color: Colors.black87,
                                    fontFamily: 'Cario',
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            ListTile(
                              leading: Image.asset(
                                'assets/images/uqu.png', // Replace with the device image
                                width: 50.0, // Image size
                                height: 50.0,
                              ),
                              selected: true,
                              trailing: const Icon(
                                Icons.sd_storage_outlined,
                                color: Colors.blue,
                                size: 30,
                              ),
                              title: Text(
                                S.of(context).business_collage_ProcessorType,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontFamily: 'Cario',
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              subtitle: SelectableText(
                                device.deviceCpu,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    fontSize: 12.0,
                                    color: Colors.black87,
                                    fontFamily: 'Cario',
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            ListTile(
                              leading: Image.asset(
                                'assets/images/uqu.png', // Replace with the device image
                                width: 50.0, // Image size
                                height: 50.0,
                              ),
                              selected: true,
                              trailing: const Icon(
                                Icons.storage_rounded,
                                color: Colors.blue,
                                size: 30,
                              ),
                              title: Text(
                                S.of(context).business_collage_HardDisk,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontFamily: 'Cario',
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              subtitle: SelectableText(
                                device.deviceHarddisk,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    fontSize: 12.0,
                                    color: Colors.black87,
                                    fontFamily: 'Cario',
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            ListTile(
                              leading: Image.asset(
                                'assets/images/uqu.png', // Replace with the device image
                                width: 50.0, // Image size
                                height: 50.0,
                              ),
                              selected: true,
                              trailing: const Icon(
                                Icons.handyman_rounded,
                                color: Colors.blue,
                                size: 30,
                              ),
                              title: Text(
                                S.of(context).business_collage_macddress,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontFamily: 'Cario',
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              subtitle: SelectableText(
                                device.macAddress,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    fontSize: 12.0,
                                    color: Colors.black87,
                                    fontFamily: 'Cario',
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            ListTile(
                              leading: Image.asset(
                                'assets/images/uqu.png', // Replace with the device image
                                width: 50.0, // Image size
                                height: 50.0,
                              ),
                              selected: true,
                              trailing: const Icon(
                                Icons.format_list_numbered_rtl,
                                color: Colors.blue,
                                size: 30,
                              ),
                              title: Text(
                                S.of(context).business_collage_serialnumber,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontFamily: 'Cario',
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              subtitle: SelectableText(
                                device.serialNumber,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    fontSize: 12.0,
                                    color: Colors.black87,
                                    fontFamily: 'Cario',
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            ListTile(
                              leading: Image.asset(
                                'assets/images/uqu.png', // Replace with the device image
                                width: 50.0, // Image size
                                height: 50.0,
                              ),
                              selected: true,
                              trailing: const Icon(
                                Icons.format_list_numbered_rtl,
                                color: Colors.blue,
                                size: 30,
                              ),
                              title: Text(
                                S.of(context).business_collage_ministrynumber,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontFamily: 'Cario',
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              subtitle: SelectableText(
                                device.ministryNumber,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    fontSize: 12.0,
                                    color: Colors.black87,
                                    fontFamily: 'Cario',
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    _pageController.previousPage(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                    );
                  },
                ),
                Text(
                  '$_currentPage/${widget.devices.length}',
                  style: const TextStyle(fontSize: 16.0),
                ),
                IconButton(
                  icon: const Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    _pageController.nextPage(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOutBack,
                    );
                  },
                ),
                ElevatedButton(
                  onPressed: () async {
                    await launchUrl(
                        Uri.parse('https://maps.app.goo.gl/SwrGTUrVBbAxgWAB7'));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF014780),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(36.0),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                  ),
                  child: const Text(
                    'عرض الموقع',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Cario',
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
