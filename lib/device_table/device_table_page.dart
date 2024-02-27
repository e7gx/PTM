import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DeviceInfo {
  final String name;
  final String location;
  final String specifications;
  final String type;
  final String ministryNumber;
  final String serialNumber;

  DeviceInfo(this.name, this.location, this.specifications, this.type,
      this.ministryNumber, this.serialNumber);
}

class DeviceTablePage extends StatelessWidget {
  const DeviceTablePage({super.key});

  @override
  Widget build(BuildContext context) {
    // List of devices
    final List<DeviceInfo> devices = List.generate(
      20,
      (index) => DeviceInfo(
          'Computer Number$index',
          'UQULAB $index',
          'device Specifications',
          'Lenovo ThinkCentre M920',
          '441003562$index',
          '249765402843$index'),
    );

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 192, 208, 255),
              Color.fromARGB(255, 111, 199, 250),
            ],
            begin: Alignment.topRight,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: DeviceList(devices: devices),
          ),
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
      child: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: widget.devices.length + 1,
              onPageChanged: (int page) {
                setState(() {
                  _currentPage = page + 1;
                });
              },
              itemBuilder: (context, index) {
                final device = widget.devices[index + 1];
                return SafeArea(
                  child: Card(
                    elevation: 3.0,
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(15.0), // Rounded corners
                    ),
                    child: SafeArea(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ListTile(
                            leading: Image.asset(
                              'assets/images/uqu.png', // Replace with the device image
                              width: 75.0, // Image size
                              height: 75.0,
                            ),
                            title: Text(
                              device.name,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: Text(
                              'Device Location: ${device.location}',
                              style: const TextStyle(
                                  fontSize: 14.0, color: Colors.black87),
                            ),
                          ),
                          Expanded(
                            child: SafeArea(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 8.0, right: 8.0, bottom: 10),
                                child: SingleChildScrollView(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Divider(height: 4),
                                      Text(
                                        'Device Type: ${device.type}',
                                        style: const TextStyle(
                                            fontFamily: 'Cario',
                                            fontSize: 14.0,
                                            color: Colors.black87),
                                      ),
                                      const Divider(height: 4),
                                      Text(
                                        'Ministry Number: ${device.ministryNumber}',
                                        style: const TextStyle(
                                            fontSize: 14.0,
                                            color: Colors.black87),
                                      ),
                                      const Divider(height: 4),
                                      Text(
                                        'Serial Number: ${device.serialNumber}',
                                        style: const TextStyle(
                                            fontSize: 14.0,
                                            color: Colors.black87),
                                      ),
                                      const Divider(height: 4),
                                      Text(
                                        'Specifications: ${device.specifications}',
                                        style: const TextStyle(
                                            fontSize: 14.0,
                                            color: Colors.black87),
                                      ),
                                      const Divider(height: 4),
                                      const Text(
                                        'Operating System: Windows 10 64-bit',
                                        style: TextStyle(
                                            fontSize: 14.0,
                                            color: Colors.black87),
                                      ),
                                      const Divider(height: 4),
                                      const Text(
                                        'Processor: Intel Core i7.',
                                        style: TextStyle(
                                            fontSize: 14.0,
                                            color: Colors.black87),
                                      ),
                                      const Divider(height: 4),
                                      const Text(
                                        'Brand: lenovo desktop.',
                                        style: TextStyle(
                                            fontSize: 14.0,
                                            color: Colors.black87),
                                      ),
                                      const Divider(height: 4),
                                      const Text(
                                        'RAM: 8 GB.',
                                        style: TextStyle(
                                            fontSize: 14.0,
                                            color: Colors.black87),
                                      ),
                                      const Divider(height: 4),
                                      const Text(
                                        'Hard Drive: SDD.',
                                        style: TextStyle(
                                            fontSize: 14.0,
                                            color: Colors.black87),
                                      ),
                                      const Divider(height: 4),
                                      const Text(
                                        'Screen Size: 15.6 inches.',
                                        style: TextStyle(
                                            fontSize: 14.0,
                                            color: Colors.black87),
                                      ),
                                      const Divider(height: 4),
                                      const Text(
                                        'Screen Resolution: 4K.'
                                        '\n',
                                        style: TextStyle(
                                            fontSize: 14.0,
                                            color: Colors.black87),
                                      ),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          ElevatedButton(
                                            onPressed: () async {
                                              await launchUrl(Uri.parse(
                                                  'https://maps.app.goo.gl/M9JJGtxZQsoQXAhs5'));
                                            },
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                                  const Color(0xFF0F92EF),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(4.0),
                                              ),
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 50),
                                            ),
                                            child: const Text(
                                              'عرض الموقع',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontFamily: 'Cario',
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          // SafeArea(
                                          //   child: Center(
                                          //     child: Image.asset(
                                          //       'assets/images/uqu.png', // Replace with the device image
                                          //       width: 85.0, // Image size
                                          //       height: 60.0,
                                          //     ),
                                          //   ),
                                          // ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
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
            ],
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
