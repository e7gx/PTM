import 'package:flutter/material.dart';

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
          '\n\n' 'Computer Number$index',
          'UQULAB $index',
          'device Specifications ',
          '\n\n\tLenovo Desktop ThinkCentre M920',
          '441003562$index',
          '249765402843$index'),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '  معلومات الاجهزة',
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 24.0, color: Colors.white),
          textAlign: TextAlign.center,
        ),
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
        backgroundColor: Colors.cyan,
        iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: true,
        toolbarHeight: 50,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(5000),
            bottomLeft: Radius.circular(0),
          ),
        ),
        automaticallyImplyLeading: true,
      ), //AppBar
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
              itemCount: widget.devices.length,
              onPageChanged: (int page) {
                setState(() {
                  _currentPage = page;
                });
              },
              itemBuilder: (context, index) {
                final device = widget.devices[index];
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
                              width: 100.0, // Image size
                              height: 125.0,
                            ),
                            title: Text(
                              device.name,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle:
                                Text('Device Location: ${device.location}'),
                          ),
                          SafeArea(
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Device Type: ${device.type}' '\n',
                                      style: const TextStyle(fontSize: 15.0),
                                    ),
                                    Text(
                                      'Ministry Number: ${device.ministryNumber}',
                                      style: const TextStyle(fontSize: 15.0),
                                    ),
                                    Text(
                                      'Serial Number: ${device.serialNumber}',
                                      style: const TextStyle(fontSize: 15.0),
                                    ),
                                    Text(
                                      'Specifications: ${device.specifications}'
                                      '\n',
                                      style: const TextStyle(fontSize: 15.0),
                                    ),
                                    const Text(
                                      'Operating System: Windows 10 64-bit',
                                      style: TextStyle(fontSize: 15.0),
                                    ),
                                    const Text(
                                      'Processor: Intel Core i7.',
                                      style: TextStyle(fontSize: 15.0),
                                    ),
                                    const Text(
                                      'Brand: lenovo desktop.',
                                      style: TextStyle(fontSize: 15.0),
                                    ),
                                    const Text(
                                      'RAM: 8 GB.',
                                      style: TextStyle(fontSize: 15.0),
                                    ),
                                    const Text(
                                      'Hard Drive: SDD.' '\n',
                                      style: TextStyle(fontSize: 15.0),
                                    ),
                                    const Text(
                                      'Screen Size: 15.6 inches.',
                                      style: TextStyle(fontSize: 15.0),
                                    ),
                                    const Text(
                                      'Screen Resolution: 4K.'
                                      '\n',
                                      style: TextStyle(fontSize: 15.0),
                                    ),
                                    const SizedBox(
                                      height: 40,
                                    ),
                                    SafeArea(
                                      child: Center(
                                        child: Image.asset(
                                          'assets/images/pc.png', // Replace with the device image
                                          width: 200.0, // Image size
                                          height: 100.0,
                                        ),
                                      ),
                                    ),
                                  ],
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
                style: const TextStyle(fontSize: 18.0),
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
