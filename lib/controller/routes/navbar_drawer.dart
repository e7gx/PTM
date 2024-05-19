import 'package:first_time/generated/l10n.dart';
import 'package:first_time/qrcode/qrcode_scanner.dart';
import 'package:first_time/register_assets/password_assets.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import 'package:first_time/Auth/login_page_it.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_time/Chat/ai_chat_page.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:first_time/settings/it_settings.dart';
import 'package:first_time/controller/home/home.dart';
import 'package:first_time/settings/accont_setting.dart';
import 'package:first_time/controller/model/dashboard.dart';
import 'package:first_time/device_table/device_location.dart';
import 'package:first_time/reports/it_tasks/it_reports_received.dart';
import 'package:first_time/reports/user_reports/device_display_reports.dart';
import 'package:first_time/reports/it_reports/submited_it_reports/it_display_reports_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
    const QRScannerPageIT(),
    const DisplayLocationsNavBar(),
    const ReportsReceived(),
    const DeviceReports(),
  ];
  String fullName = ''; // Variable to store the user's full name

  @override
  void initState() {
    super.initState();
    fetchNameFromFirestore();
  }

  Future<void> fetchNameFromFirestore() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        String uid = user.uid;

        QuerySnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore
            .instance
            .collection('Users_IT')
            .where('uid', isEqualTo: uid)
            .limit(1)
            .get();

        if (snapshot.docs.isNotEmpty) {
          // Get the first document in the snapshot
          DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
              snapshot.docs.first;

          // Retrieve the user's first name from the document
          String firstName = documentSnapshot.data()?['first name'] ?? '';

          setState(() {
            fullName = firstName;
          });
        } else {
          // print('User data not found');
        }
      }
    } catch (e) {
      // print('Error fetching user data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              S.of(context).navbar_drawer_HomePage,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontFamily: 'Cario',
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
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
                Colors.white,
                Color(0xFFD6F7F7),
                Colors.white,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.blueAccent,
                      Colors.lightBlue,
                      Colors.blue,
                    ],
                    begin: Alignment.topRight,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Column(
                  children: [
                    const Text(
                      'PTM \n To Make IT Easy',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Cario',
                        fontSize: 26,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '${S.of(context).welcome} $fullName',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontFamily: 'Cario',
                        fontSize: 15,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              ListTile(
                title: Text(
                  S.of(context).home_page_and_bar_PersonalInfo,
                  style: const TextStyle(
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
                    MaterialPageRoute(builder: (context) => const MyDataPage()),
                  );
                },
              ),
              const SizedBox(height: 10),

              const Divider(
                height: 2,
                thickness: BorderSide.strokeAlignOutside,
              ), //
              ListTile(
                title: Text(
                  S.of(context).navbar_drawer_AddAssets,
                  style: const TextStyle(
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
                        builder: (context) => const PasswordAccessWidget()),
                  );
                },
              ),
              const SizedBox(height: 10),

              const Divider(
                height: 2,
                thickness: BorderSide.strokeAlignOutside,
              ),
              ListTile(
                title: Text(
                  S.of(context).navbar_drawer_GeneralPreformsnceIndicator,
                  style: const TextStyle(
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
                title: Text(
                  S.of(context).navbar_drawer_Reports,
                  style: const TextStyle(
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
              ), // خط فاصل بين

              ListTile(
                title: Text(
                  S.of(context).navbar_drawer_ApplicationSettings,
                  style: const TextStyle(
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
              ),
              ListTile(
                title: Text(
                  S.of(context).navbar_drawer_SignOut,
                  style: const TextStyle(
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
                onTap: () async {
                  final SharedPreferences sharedPreferences =
                      await SharedPreferences.getInstance();
                  sharedPreferences
                      .remove('isLoggedIn'); // Remove saved login status

                  // Navigate back to the login page
                  // ignore: use_build_context_synchronously
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => const LoginPage(),
                    ),
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
            tabs: [
              GButton(
                icon: Icons.home_work_sharp,
                text: S.of(context).navbar_drawer_Main,
                iconColor: Colors.white,
                iconActiveColor: Colors.cyan,
                textStyle: const TextStyle(
                    fontFamily: 'Cario',
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              const GButton(
                icon: Icons.qr_code_scanner_outlined,
                iconColor: Colors.white,
                iconActiveColor: Colors.cyan,
                text: 'Qrcode',
                textStyle: TextStyle(
                    fontFamily: 'Cario',
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              GButton(
                icon: Icons.important_devices_rounded,
                text: S.of(context).navbar_drawer_Devices,
                iconColor: Colors.white,
                iconActiveColor: Colors.cyan,
                textStyle: const TextStyle(
                    fontFamily: 'Cario',
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              GButton(
                icon: Icons.construction_sharp,
                text: S.of(context).navbar_drawer_Maintenance,
                iconColor: Colors.white,
                iconActiveColor: Colors.cyan,
                textStyle: const TextStyle(
                    fontFamily: 'Cario',
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              GButton(
                icon: Icons.manage_accounts_outlined,
                text: S.of(context).navbar_drawer_Reports,
                iconColor: Colors.white,
                iconActiveColor: Colors.cyan,
                textStyle: const TextStyle(
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
