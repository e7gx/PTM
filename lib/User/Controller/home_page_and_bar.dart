import 'package:flutter/material.dart';
import '../Auth/login_page.dart';
import '../code/qr_scannerpage.dart';
import '../Page/chat_main_page.dart';
import '../reports/user_report_first_page.dart';
import '../data/user_data.dart';
import '../Settings/settings_page.dart';
import '../data/how_are_we.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final _pages = [
    const MainPage(),
    const ReportProblemPage(),
    const QRScannerPage()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: false,
      appBar: AppBar(
        title: const Text(
          textAlign: TextAlign.center,
          '       الصفحة الرئيسية',
          style: TextStyle(
              color: Colors.white,
              fontSize: 24, //  تغيير هذه القيمة لتكون الحجم
              fontWeight: FontWeight.bold,
              fontFamily: 'Cario'),
        ),
        centerTitle: true,
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
        automaticallyImplyLeading: true,
        iconTheme: const IconThemeData(color: Colors.white),
        elevation: 4,
        toolbarHeight: 50,
      ),
      drawer: Drawer(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.white, // Red
                Color(0xFFD6F7F7), // Green
                Colors.white, // Orange
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.tealAccent,
                      Colors.teal,
                      Colors.cyan,
                    ],
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                  ),
                ),
                child: Center(
                  child: Text(
                    '           PTM\n To Make IT Easy',
                    style: TextStyle(
                      fontSize: 34,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              ListTile(
                title: const Text(
                  'البيانات الشخصية',
                  style: TextStyle(
                      color: Color(0xC3252525),
                      fontSize: 20, //  تغيير هذه القيمة لتكون الحجم
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Cario'),
                ),
                onTap: () {
                  // Update the state of the app

                  // Then close the drawer
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyDataPage()),
                  );
                },
                leading: const Icon(
                  Icons.supervised_user_circle,
                  size: 30.0,
                  color: Colors.teal,
                ),
              ),
              const SizedBox(height: 10),
              const Divider(
                height: 2,
                thickness: BorderSide.strokeAlignOutside,
              ),
              ListTile(
                title: const Text(
                  'طرق التواصل',
                  style: TextStyle(
                      color: Color(0xC3252525),
                      fontSize: 20, //  تغيير هذه القيمة لتكون الحجم
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Cario'),
                ),
                leading: const Icon(
                  Icons.help_outline,
                  size: 30.0,
                  color: Colors.teal,
                ),
                onTap: () {
                  // Update the state of the app

                  // Then close the drawer
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HowAreWe()),
                  );
                },
              ),
              const SizedBox(height: 10),
              const Divider(
                height: 2,
                thickness: BorderSide.strokeAlignOutside,
              ),
              ListTile(
                title: const Text(
                  'الإعدادات',
                  style: TextStyle(
                      color: Color(0xC3252525),
                      fontSize: 20, //  تغيير هذه القيمة لتكون الحجم
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Cario'),
                ),
                leading: const Icon(
                  Icons.settings,
                  size: 30.0,
                  color: Colors.teal,
                ),
                onTap: () {
                  // Update the state of the app

                  // Then close the drawer
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SettingsPageUser()),
                  );
                },
              ),
              const SizedBox(height: 10),
              const Divider(
                height: 2,
                thickness: BorderSide.strokeAlignOutside,
              ),
              const SizedBox(
                height: 250,
              ),
              const Divider(
                endIndent: BorderSide.strokeAlignCenter,
                height: 5,
              ),
              ListTile(
                title: const Text(
                  'تسجيل خروج',
                  style: TextStyle(
                    color: Color(0xC3252525),
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Cario',
                  ),
                ),
                leading: const Icon(
                  Icons.logout,
                  size: 36.0,
                  color: Colors.teal,
                ),
                onTap: () {
                  // Update the state of the app

                  // Then close the drawer
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPageUser()),
                  );
                },
              ),
              const Divider(
                height: 5,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_outlined),
            label: 'المحادثة',
            activeIcon: Icon(Icons.auto_fix_high_outlined),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.report),
            label: 'البلاغات',
            activeIcon: Icon(Icons.report_gmailerrorred),
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.qr_code),
              label: 'QR Scanner',
              activeIcon: Icon(Icons.video_call)),
        ],
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
