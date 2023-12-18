// ignore: file_names
// ignore: file_names
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
          '       معلومات الاجهزة',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: DeviceList(devices: devices),
        ),
      ),
    );
  }
}

class DeviceList extends StatefulWidget {
  final List<DeviceInfo> devices;

  const DeviceList({super.key, required this.devices});

  @override
  // ignore: library_private_types_in_public_api
  _DeviceListState createState() => _DeviceListState();
}

class _DeviceListState extends State<DeviceList> {
  final PageController _pageController = PageController();
  int _currentPage = 1;

  @override
  Widget build(BuildContext context) {
    return Column(
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
              return Card(
                elevation: 3.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0), // Rounded corners
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ListTile(
                      leading: Image.asset(
                        'images/uqu.png', // Replace with the device image
                        width: 100.0, // Image size
                        height: 100.0,
                      ),
                      title: Text(
                        device.name,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 12.0),
                      ),
                      subtitle: Text('Device Location: ${device.location}'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('\n' 'Device Type: ${device.type}' '\n'),
                          Text(
                              'Ministry Number: ${device.ministryNumber}' '\n'),
                          Text('Serial Number: ${device.serialNumber}' '\n'),
                          Text('Specifications: ${device.specifications}'
                              '\n'),
                          const Text(
                              'Operating System: Windows 10 64-bit' '\n'),
                          const Text('Processor: Intel Core i7.' '\n'),
                          const Text('Brand: lenovo desktop.' '\n'),
                          const Text('RAM: 8 GB.' '\n'),
                          const Text('Hard Drive: SDD.' '\n'),
                          const Text('Screen Size: 15.6 inches.' '\n'),
                          const Text('Screen Resolution: 4K.' '\n'),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back),
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
              icon: const Icon(Icons.arrow_forward),
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
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
