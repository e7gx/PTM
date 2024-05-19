import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../Auth/admin_login.dart';
import '../Users/IT/it_users.dart';
import '../Users/Regular user/users_normal.dart';
import '../chat/admin_chat_page.dart';
import 'home_admin.dart';
import '../reports/admin_solve_report/user_reports_admin.dart';
import '../reports/admin_upload_report/admin_upload_report.dart';
import 'package:lottie/lottie.dart';
import '../model/dashboard.dart';
import '../reports/it_report/it_all_reports.dart';
import '../reports/user_report/user_reports.dart';
import '../settings/admin_data.dart';
import '../settings/admin_settings.dart';
import 'package:first_time/generated/l10n.dart';
import 'package:first_time/register_assets/register_assets.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AdminHomePage extends StatefulWidget {
  const AdminHomePage({super.key});

  @override
  State<AdminHomePage> createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {
  int currentIndex = 0; //! ButtomNavBar Index
  // final int _selectedIndex = 0; //! DrawerIndex

  final List _pages = [
    const AdminDashboard(),
    const AllUsersPage(),
    const AllITUsersPage(),
    const ITReportsPage(),
    const AdminSolveReport(),
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
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              S.of(context).home_page_admin_HomePage,
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
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const AdminAiChatPage(),
            ),
          );
        },
        backgroundColor: const Color.fromARGB(103, 0, 150, 135),
        child: Container(
          child: Lottie.asset('assets/animation/green.json',
              width: 500, height: 500),
        ),
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
              DrawerHeader(
                decoration: const BoxDecoration(
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
                      '${S.of(context).welcome} $fullName ',
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
                  S.of(context).home_page_and_bar_PersonalInformation,
                  style: const TextStyle(
                      color: Color(0xC3252525),
                      fontSize: 20, //  تغيير هذه القيمة لتكون الحجم
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Cario'),
                ),
                onTap: () {
                  // Update the state of the app

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AdminDataPage()),
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
                title: Text(
                  S.of(context).home_page_admin_InformationPanel,
                  style: const TextStyle(
                      color: Color(0xC3252525),
                      fontSize: 20, //  تغيير هذه القيمة لتكون الحجم
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Cario'),
                ),
                leading: const Icon(
                  Icons.bar_chart_sharp,
                  size: 30.0,
                  color: Colors.teal,
                ),
                onTap: () {
                  // Update the state of the app

                  // // Then close the drawer
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AdminStatisticsPage()),
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
                  S.of(context).home_admin_UserReports,
                  style: const TextStyle(
                      color: Color(0xC3252525),
                      fontSize: 20,
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
                      builder: (context) => const UserReportsPage(),
                    ),
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
                  S.of(context).home_page_admin_AddReport,
                  style: const TextStyle(
                      color: Color(0xC3252525),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Cario'),
                ),
                leading: const Icon(
                  Icons.report_gmailerrorred_rounded,
                  size: 30.0,
                  color: Colors.teal,
                ),
                onTap: () {
                  // Update the state of the app

                  // Then close the drawer
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AdminUploadReport(),
                    ),
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
                  S.of(context).home_page_admin_AddAssets,
                  style: const TextStyle(
                      color: Color(0xC3252525),
                      fontSize: 20, //  تغيير هذه القيمة لتكون الحجم
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Cario'),
                ),
                leading: const Icon(
                  Icons.devices_rounded,
                  size: 30.0,
                  color: Colors.teal,
                ),
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
                title: Text(
                  S.of(context).home_page_admin_Settings,
                  style: const TextStyle(
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
                        builder: (context) => const AdminSettingsPage()),
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
                  S.of(context).home_page_admin_SignOut,
                  style: const TextStyle(
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
                  Navigator.pushReplacement(
                    // ignore: use_build_context_synchronously
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AdminLoginPage()),
                  );
                },
              ),
              const SizedBox(height: 10),
              const Divider(
                height: 2,
                thickness: BorderSide.strokeAlignOutside,
              ),
            ],
          ),
        ),
      ),
      body: _pages[currentIndex],
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
                text: S.of(context).home_page_admin_Main,
                iconColor: Colors.white,
                iconActiveColor: Colors.tealAccent,
                textStyle: const TextStyle(
                    fontFamily: 'Cario',
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              GButton(
                icon: Icons.person_search_outlined,
                iconColor: Colors.white,
                iconActiveColor: Colors.tealAccent,
                text: S.of(context).home_page_admin_Users,
                textStyle: const TextStyle(
                    fontFamily: 'Cario',
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              GButton(
                icon: Icons.person_sharp,
                text: S.of(context).home_page_admin_SupportStaff,
                iconColor: Colors.white,
                iconActiveColor: Colors.tealAccent,
                textStyle: const TextStyle(
                    fontFamily: 'Cario',
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              GButton(
                icon: Icons.construction_sharp,
                text: S.of(context).home_page_admin_Maintenance,
                iconColor: Colors.white,
                iconActiveColor: Colors.tealAccent,
                textStyle: const TextStyle(
                    fontFamily: 'Cario',
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              GButton(
                icon: Icons.manage_accounts_outlined,
                text: S.of(context).home_Reports,
                iconColor: Colors.white,
                iconActiveColor: Colors.tealAccent,
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

  void goToPage(index) {
    setState(() {
      currentIndex = index;
    });
  }
}
