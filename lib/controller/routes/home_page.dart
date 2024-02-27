import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_time/Auth/login_page.dart';
import 'package:first_time/Chat/ai_chat_page.dart';
import 'package:first_time/controller/home/home.dart';
import 'package:first_time/reports/it_tasks/it_reports_received.dart';
import 'package:flutter/material.dart';
import 'package:first_time/reports/it_reports/submited_it_reports/it_display_reports_page.dart';
import 'package:first_time/device_table/device_table_page.dart';
import 'package:first_time/reports/user_reports/device_display_reports.dart';
import 'package:first_time/reports/it_reports/write_it_reports/it_write_solution_report.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:lottie/lottie.dart';
import 'package:first_time/settings/accont_setting.dart';
import 'package:first_time/settings/it_settings.dart';
import 'package:first_time/controller/model/dashboard.dart';

import 'package:first_time/register_assets/register_assets.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  int currentIndex = 0; //! ButtomNavBar Index
  final int _selectedIndex = 0; //! DrawerIndex

  final List _pages = [
    const Home(),
    const ReportSolutionPage(),
    const DeviceTablePage(),
    const ReportsReceived(),
    const DeviceReports(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'الصفحة الرئيسية',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'Cario',
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
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
        backgroundColor: Colors.cyan,
        automaticallyImplyLeading: true,
        iconTheme: const IconThemeData(color: Colors.white),
        elevation: 4,
        toolbarHeight: 50,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const AiChatPage(),
            ),
          );
        },
        backgroundColor: const Color(0x9D64ACFA),
        child: Container(
          child: Lottie.asset('assets/animation/aichat.json',
              width: 500, height: 500),
        ),
      ),
      drawer: Drawer(
        backgroundColor: Theme.of(context).colorScheme.background,
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.black, // Red
                Colors.black, // Green
                Colors.black, // Orange
                Color.fromARGB(255, 33, 36, 56),
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
                      Color(0xFF00CCFF),
                      Color(0xFF698EFF),
                      Color(0xFF00CCFF),
                      Color(0xFF698EFF),
                    ],
                    begin: Alignment.topRight,
                    end: Alignment.bottomCenter,
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
                  'أضافة أصول تقنية',
                  style: TextStyle(
                    fontFamily: 'Cario',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xF9257BEC),
                  ),
                ),
                leading: Icon(
                  Icons.devices_rounded,
                  size: 30.0,
                  color: Colors.blue[800],
                ),
                selected: _selectedIndex == 0,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const RegisterDevice()),
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
                  'البيانات الشخصية',
                  style: TextStyle(
                    fontFamily: 'Cario',
                    color: Color(0xF9257BEC),

                    fontSize: 20, //  تغيير هذه القيمة لتكون الحجم
                    fontWeight: FontWeight.bold,
                  ),
                ),
                leading: Icon(
                  Icons.supervised_user_circle,
                  size: 30.0,
                  color: Colors.blue[800],
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyDataPage()),
                  );
                },
              ),
              const SizedBox(height: 10),

              const Divider(
                height: 2,
                thickness: BorderSide.strokeAlignOutside,
              ), // خط فاصل بينقوائم
              ListTile(
                title: const Text(
                  ' مؤشر الاداء العام',
                  style: TextStyle(
                    fontFamily: 'Cario',
                    fontSize: 20, //  تغيير هذه القيمة لتكون الحجم
                    fontWeight: FontWeight.bold, color: Color(0xF9257BEC),
                  ),
                ),
                leading: Icon(
                  Icons.bar_chart_sharp,
                  size: 30.0,
                  color: Colors.blue[800],
                ),
                selected: _selectedIndex == 2,
                onTap: () {
                  // Update the state of the app

                  // Then close the drawer
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const TechnicalSupportStatisticsPage()),
                  );
                },
              ),
              const SizedBox(height: 10),

              const Divider(
                height: 2,
                thickness: BorderSide.strokeAlignOutside,
              ), // خط فاصل بين
              ListTile(
                title: const Text(
                  'اعدادات البرنامج',
                  style: TextStyle(
                    fontFamily: 'Cario',
                    fontSize: 20,
                    color: Color(0xF9257BEC),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                leading: Icon(
                  Icons.settings,
                  size: 30.0,
                  color: Colors.blue[800],
                ),
                selected: _selectedIndex == 3,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SettingsPage()),
                  );
                },
              ),
              const SizedBox(height: 10),

              const Divider(
                height: 2,
                thickness: BorderSide.strokeAlignOutside,
              ), // خط فاصل بين
              ListTile(
                title: const Text(
                  'التقارير',
                  style: TextStyle(
                    fontFamily: 'Cario',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xF9257BEC),
                  ),
                ),
                leading: Icon(
                  Icons.gpp_good_outlined,
                  size: 30.0,
                  color: Colors.blue[800],
                ),
                selected: _selectedIndex == 0,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ReportsPage()),
                  );
                },
              ),
              const SizedBox(height: 10),

              const Divider(
                height: 2,
                thickness: BorderSide.strokeAlignOutside,
              ),
              const SizedBox(height: 120),
              const Divider(
                height: 2,
                thickness: BorderSide.strokeAlignOutside,
              ), // خط فاصل بين
              ListTile(
                title: const Text(
                  'تسجيل خروج',
                  style: TextStyle(
                    fontFamily: 'Cario',
                    color: Color(0xF9257BEC),
                    fontSize: 20, //  تغيير هذه القيمة لتكون الحجم
                    fontWeight: FontWeight.bold,
                  ),
                ),
                leading: Icon(
                  Icons.logout,
                  size: 30.0,
                  color: Colors.blue[800],
                ),
                selected: _selectedIndex == 2,
                onTap: () {
                  FirebaseAuth.instance.signOut();

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      body: _pages[currentIndex],

      //! bottomNavigationBar
      bottomNavigationBar: Container(
        color: Colors.grey.shade900,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
          child: GNav(
            backgroundColor: Colors.transparent,
            tabBackgroundColor: Colors.blueGrey,
            padding: const EdgeInsets.all(7),
            gap: 8,
            onTabChange: (value) => goToPage(value),
            selectedIndex: 0,
            tabs: const [
              GButton(
                icon: Icons.home_work_sharp,
                text: 'الرئيسية',
                iconColor: Colors.white,
                iconActiveColor: Colors.cyan,
                textStyle: TextStyle(
                    fontFamily: 'Cario',
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              GButton(
                icon: Icons.paste_outlined,
                iconColor: Colors.white,
                iconActiveColor: Colors.cyan,
                text: 'التقارير',
                textStyle: TextStyle(
                    fontFamily: 'Cario',
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              GButton(
                icon: Icons.important_devices_rounded,
                text: 'الأجهزة',
                iconColor: Colors.white,
                iconActiveColor: Colors.cyan,
                textStyle: TextStyle(
                    fontFamily: 'Cario',
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              GButton(
                icon: Icons.settings_suggest_sharp,
                text: 'الصيانة',
                iconColor: Colors.white,
                iconActiveColor: Colors.cyan,
                textStyle: TextStyle(
                    fontFamily: 'Cario',
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              GButton(
                icon: Icons.manage_accounts_outlined,
                text: ' البلاغات',
                iconColor: Colors.white,
                iconActiveColor: Colors.cyan,
                textStyle: TextStyle(
                    fontFamily: 'Cario',
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }

//! 111111111111111111111111   <HOMEPAGE> 111111111111111111111111111111111111

  void goToPage(index) {
    setState(() {
      currentIndex = index;
    });
  }
//! the BottomNavigationBar here<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
}
