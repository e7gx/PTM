import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_time/User/Reports/minitinesDone/user_mintines.dart';
import 'package:first_time/User/Reports/minitinesReceived/user_report_problem.dart';
import 'package:first_time/User/Reports/minitinesSend/user_minitines_send.dart';
import 'package:flutter/material.dart';
import 'package:first_time/User/Auth/login_page.dart';
import 'package:first_time/User/code/qr_scannerpage.dart';
import 'package:first_time/User/Chat/chat_main_page.dart';
import 'package:first_time/User/reports/user_report_first_page.dart';
import 'package:first_time/User/data/user_data.dart';
import 'package:first_time/User/settings/settings_page.dart';
import 'package:first_time/User/data/how_are_we.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
            .collection('Users_Normal')
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
      extendBodyBehindAppBar: false,
      appBar: AppBar(
        title: Text(
          textAlign: TextAlign.center,
          "Hello, $fullName",
          style: const TextStyle(
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
                    MaterialPageRoute(builder: (context) => const MyDataPage()),
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
                  'الصيانة المنتهية',
                  style: TextStyle(
                      color: Color(0xC3252525),
                      fontSize: 20, //  تغيير هذه القيمة لتكون الحجم
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Cario'),
                ),
                leading: const Icon(
                  Icons.add_task_rounded,
                  size: 30.0,
                  color: Colors.teal,
                ),
                onTap: () {
                  // Update the state of the app

                  // Then close the drawer
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const UserMintines()),
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
                  'الصيانة المستلمة',
                  style: TextStyle(
                      color: Color(0xC3252525),
                      fontSize: 20, //  تغيير هذه القيمة لتكون الحجم
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Cario'),
                ),
                leading: const Icon(
                  Icons.done_all_sharp,
                  size: 30.0,
                  color: Colors.teal,
                ),
                onTap: () {
                  // Update the state of the app

                  // Then close the drawer
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const UserMintinesStageOne()),
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
                  'البلاغ المرسل ',
                  style: TextStyle(
                      color: Color(0xC3252525),
                      fontSize: 20, //  تغيير هذه القيمة لتكون الحجم
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Cario'),
                ),
                leading: const Icon(
                  Icons.done,
                  size: 30.0,
                  color: Colors.teal,
                ),
                onTap: () {
                  // Update the state of the app

                  // Then close the drawer
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const UserMintinesView()),
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
                  'طرق التواصل',
                  style: TextStyle(
                      color: Color(0xC3252525),
                      fontSize: 20, //  تغيير هذه القيمة لتكون الحجم
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Cario'),
                ),
                leading: const Icon(
                  Icons.connect_without_contact,
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
                height: 175,
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
                onTap: () async {
                  final SharedPreferences sharedPreferences =
                      await SharedPreferences.getInstance();
                  sharedPreferences
                      .remove('isLoggedIn'); // Remove saved login status
                  // Then close the drawer
                  Navigator.pushReplacement(
                    // ignore: use_build_context_synchronously
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LoginPageUser()),
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
            icon: Icon(
              Icons.chat_outlined,
            ),
            label: 'المحادثة',
            activeIcon: Icon(
              Icons.auto_fix_high_outlined,
              color: Colors.teal,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.report,
            ),
            label: 'البلاغات',
            activeIcon: Icon(
              Icons.report_gmailerrorred,
              color: Colors.teal,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.qr_code,
            ),
            label: 'QR Scanner',
            activeIcon: Icon(
              Icons.video_call,
              color: Colors.teal,
            ),
          ),
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
