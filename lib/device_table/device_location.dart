import 'package:first_time/device_table/device_table_page.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class DisplayLocationsNavBar extends StatelessWidget {
  const DisplayLocationsNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Wrap(
          // crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Card(
              margin: const EdgeInsets.fromLTRB(5, 14, 5, 15),
              color: Colors.white,
              elevation: 8,
              shadowColor: Colors.teal,
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(25.0), // إضافة BorderRadius هنا
              ),
              child: SizedBox(
                width: double.infinity,
                height: 200,
                child: Column(
                  children: [
                    Lottie.asset('assets/animation/Search.json',
                        fit: BoxFit.fitWidth, height: 130),
                    const Text(
                      'يمكنك من هنا استعراض الكليات وجميع الاجهزة المتواجده داخلها لتسريع عملية الاستجابة للبلاغات',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Cario',
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //! First Row First Card
                Card(
                  color: Colors.white,
                  elevation: 8,
                  shadowColor: Colors.teal,
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(25.0), // إضافة BorderRadius هنا
                  ),
                  child: SizedBox(
                    width: 170,
                    height: 180,
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/images/uqu.png',
                          height: 90,
                          width: 90,
                        ),
                        const Text(
                          'كلية الحاسب الإلي',
                          style: TextStyle(
                            fontFamily: 'Cario',
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const DeviceTablePage()));
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 29, vertical: 8),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14.0),
                            ),
                          ),
                          child: const Text(
                            'استعراض البيانات',
                            style: TextStyle(
                              fontFamily: 'Cario',
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                //! First Row Second Card

                Card(
                  color: Colors.white,
                  elevation: 6,
                  shadowColor: Colors.cyan,
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(25.0), // إضافة BorderRadius هنا
                  ),
                  child: SizedBox(
                    width: 170,
                    height: 180,
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/images/uqu.png',
                          height: 90,
                          width: 90,
                        ),
                        const Text(
                          'كلية أدارة الاعمال',
                          style: TextStyle(
                            fontFamily: 'Cario',
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 29, vertical: 8),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14.0),
                            ),
                          ),
                          child: const Text(
                            'استعراض البيانات',
                            style: TextStyle(
                              fontFamily: 'Cario',
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //! Second Row First Card

                Card(
                  color: Colors.white,
                  elevation: 8,
                  shadowColor: Colors.teal,
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(25.0), // إضافة BorderRadius هنا
                  ),
                  child: SizedBox(
                    width: 170,
                    height: 180,
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/images/uqu.png',
                          height: 90,
                          width: 90,
                        ),
                        const Text(
                          'كلية التاريخ',
                          style: TextStyle(
                            fontFamily: 'Cario',
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const DeviceTablePage()));
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 29, vertical: 8),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14.0),
                            ),
                          ),
                          child: const Text(
                            'استعراض البيانات',
                            style: TextStyle(
                              fontFamily: 'Cario',
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                //! Second Row Second Card

                Card(
                  color: Colors.white,
                  elevation: 6,
                  shadowColor: Colors.cyan,
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(25.0), // إضافة BorderRadius هنا
                  ),
                  child: SizedBox(
                    width: 170,
                    height: 180,
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/images/uqu.png',
                          height: 90,
                          width: 90,
                        ),
                        const Text(
                          'كلية العلوم التطبيقية',
                          style: TextStyle(
                            fontFamily: 'Cario',
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 29, vertical: 8),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14.0),
                            ),
                          ),
                          child: const Text(
                            'استعراض البيانات',
                            style: TextStyle(
                              fontFamily: 'Cario',
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}