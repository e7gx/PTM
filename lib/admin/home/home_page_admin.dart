import 'package:first_time/admin/Auth/admin_login.dart';
import 'package:first_time/admin/Users/IT/it_users.dart';
import 'package:first_time/admin/Users/Regular%20user/users_normal.dart';
import 'package:first_time/admin/home/home_admin.dart';
import 'package:first_time/admin/reports/it_report/it_all_reports.dart';
import 'package:first_time/admin/reports/user_report/user_reports.dart';
import 'package:first_time/register_assets/register_assets.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

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
    const UserReportsPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    'PTM\n To Make IT Easy',
                    textAlign: TextAlign.center,
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
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => MyDataPage()),
                  // );
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
                  '🚀 الصيانة',
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

                  // // Then close the drawer
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //       builder: (context) => const UserMintines()),
                  // );
                },
              ),
              const SizedBox(height: 10),
              const Divider(
                height: 2,
                thickness: BorderSide.strokeAlignOutside,
              ),
              ListTile(
                title: const Text(
                  'أضافة أصول',
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
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //       builder: (context) => const SettingsPageUser()),
                  // );
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
                onTap: () {
                  // Update the state of the app

                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AdminLoginPage()),
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
            tabs: const [
              GButton(
                icon: Icons.home_work_sharp,
                text: 'الرئيسية',
                iconColor: Colors.white,
                iconActiveColor: Colors.tealAccent,
                textStyle: TextStyle(
                    fontFamily: 'Cario',
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              GButton(
                icon: Icons.person_search_outlined,
                iconColor: Colors.white,
                iconActiveColor: Colors.tealAccent,
                text: 'المستخدمين',
                textStyle: TextStyle(
                    fontFamily: 'Cario',
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              GButton(
                icon: Icons.person_sharp,
                text: 'موظفي الدعم',
                iconColor: Colors.white,
                iconActiveColor: Colors.tealAccent,
                textStyle: TextStyle(
                    fontFamily: 'Cario',
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              GButton(
                icon: Icons.construction_sharp,
                text: 'الصيانة',
                iconColor: Colors.white,
                iconActiveColor: Colors.tealAccent,
                textStyle: TextStyle(
                    fontFamily: 'Cario',
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              GButton(
                icon: Icons.manage_accounts_outlined,
                text: ' البلاغات',
                iconColor: Colors.white,
                iconActiveColor: Colors.tealAccent,
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

  void goToPage(index) {
    setState(() {
      currentIndex = index;
    });
  }
}
