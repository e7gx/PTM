import 'package:first_time/Auth/login_page.dart';
import 'package:first_time/Chat/ai_chat_page.dart';
import 'package:first_time/reports/it_tasks/it_reports_received.dart';
import 'package:flutter/material.dart';
import 'package:first_time/reports/it_reports/submited_it_reports/it_display_reports_page.dart';
import 'package:first_time/device_table/device_table_page.dart';
import 'package:first_time/reports/user_reports/device_display_reports.dart';
import 'package:first_time/reports/it_reports/write_it_reports/it_write_solution_report.dart';
import 'package:lottie/lottie.dart';
import 'package:first_time/settings/accont_setting.dart';
import 'package:first_time/settings/it_settings.dart';
import 'package:first_time/user_info/technical_support_statistics.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:first_time/page/display_slide_homepage.dart';
import 'package:first_time/register_assets/register_assets.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  int _selectedIndex = 0; // Set the initial index to 0
  final PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(117, 255, 255, 255),
                Color.fromARGB(248, 255, 255, 255),
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
                      Color.fromARGB(255, 105, 142, 255),
                      Color(0xFF00CCFF),
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
                    color: Color.fromARGB(195, 37, 37, 37),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
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
                  'التقارير',
                  style: TextStyle(
                    fontFamily: 'Cario',
                    color: Color.fromARGB(195, 37, 37, 37),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
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
              ListTile(
                title: const Text(
                  'البيانات الشخصية',
                  style: TextStyle(
                    fontFamily: 'Cario',

                    color: Color.fromARGB(195, 37, 37, 37),
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
                    color: Color.fromARGB(195, 37, 37, 37),
                    fontSize: 20, //  تغيير هذه القيمة لتكون الحجم
                    fontWeight: FontWeight.bold,
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
                    color: Color.fromARGB(195, 37, 37, 37),
                    fontSize: 20, //  تغيير هذه القيمة لتكون الحجم
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
              const SizedBox(height: 190),
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
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      body: buildBody(),
      bottomNavigationBar: buildBottomNavigationBar(),
    );
  }

//! 111111111111111111111111   <HOMEPAGE> 111111111111111111111111111111111111
  SingleChildScrollView buildBody() {
    return SingleChildScrollView(
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          //!1111111111111111111111111  Card Number One   1111111111111111111111111111111111111111111111111111
          Lottie.asset('assets/animation/ppmana.json',
              width: 500, fit: BoxFit.cover),

          const Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              // Lottie.asset('assets/animation/aichat.json', width: 100),
              Text(
                '\t👋\tأهلا وسهلا بك ',
                style: TextStyle(
                    fontFamily: 'Cario',
                    color: Color(0xFF0099FF),
                    fontSize: 29,
                    fontWeight: FontWeight.bold),
              ), //! debugPrint(عدلها عبدالله اذا شفتها !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!);
            ],
          ),

          // const Row(
          //   mainAxisAlignment: MainAxisAlignment.end,
          //   children: [
          //     // Icon(
          //     //   Icons.manage_history_rounded,
          //     //   size: 38,
          //     //   color: Color(0xFF008DD4),
          //     // ),
          //     Text(
          //       '\t👋\tأهلا وسهلا بك ',
          //       style: TextStyle(
          //           fontFamily: 'Cario',
          //           color: Color(0xFF0099FF),
          //           fontSize: 29,
          //           fontWeight: FontWeight.bold),
          //     ),
          //   ],
          // ),
          //!222222222222222222222222   Card Number Two   2222222222222222222222222222222222222222222222222222

          buildSlideView(),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.arrow_back,
                size: 30,
              ),
              SizedBox(
                height: 30,
                width: 30,
              ),
              Text(
                '1/3        ',
                style: TextStyle(
                    color: Colors.cyan, fontFamily: 'Cario', fontSize: 20),
              ),
              Icon(
                Icons.arrow_forward_rounded,
                size: 30,
              ),
            ],
          ),
          const Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                '\t⚡🔧\tاليك بلاغات اليوم ',
                textAlign: TextAlign.right,
                style: TextStyle(
                    fontFamily: 'Cario',
                    color: Color(0xFF0099FF),
                    fontSize: 23,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          buildSlideViewTwo(),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.arrow_back,
                size: 30,
              ),
              SizedBox(
                height: 50,
                width: 30,
              ),
              Text(
                '1/3        ',
                style: TextStyle(
                    color: Colors.cyan, fontFamily: 'Cario', fontSize: 20),
              ),
              Icon(
                Icons.arrow_forward_rounded,
                size: 30,
              ),
            ],
          ),
        ],
      ),
    );
  }

  SizedBox buildSlideViewTwo() {
    return SizedBox(
      height: 200,
      child: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('User_Reports')
            .orderBy('date',
                descending: true) // فرز البيانات بالترتيب العكسي للتاريخ
            .limit(3) // الحصول على آخر ثلاثة بلاغات فقط
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('حدث خطأ: ${snapshot.error}'));
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(child: Text('لا توجد بلاغات'));
          }

          // تحويل البيانات إلى قائمة من SlideData
          final slides = snapshot.data!.docs.map((doc) {
            final data = doc.data() as Map<String, dynamic>;
            return SlideData(
              image: 'assets/images/uqu.png',
              title: data['location'] ?? 'جهاز غير معروف',
              content: data['problem'] ?? 'مشكلة غير معروفة',
            );
          }).toList();

          return PageView.builder(
            controller: _pageController,
            itemCount: slides.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const DeviceReports()),
                  );
                },
                child: SlideWidget(
                  image: slides[index].image,
                  title: slides[index].title,
                  content: slides[index].content,
                ),
              );
            },
          );
        },
      ),
    );
  }

  SizedBox buildSlideView() {
    return SizedBox(
      height: 200,
      child: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('User_Reports')
            .orderBy('date',
                descending: true) // فرز البيانات بالترتيب العكسي للتاريخ
            .limit(3) // الحصول على آخر ثلاثة بلاغات فقط
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('حدث خطأ: ${snapshot.error}'));
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(child: Text('لا توجد بلاغات'));
          }

          // تحويل البيانات إلى قائمة من SlideData
          final slides = snapshot.data!.docs.map((doc) {
            final data = doc.data() as Map<String, dynamic>;
            return SlideDatas(
              image: 'assets/images/uqu.png',
              title: data['location'] ?? 'جهاز غير معروف',
              // content: data['problem'] ?? 'مشكلة غير معروفة',
            );
          }).toList();

          return PageView.builder(
            controller: _pageController,
            itemCount: slides.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const DeviceReports()),
                  );
                },
                child: SlideWidgetTwo(
                  image: slides[index].image,
                  title: slides[index].title,
                  // content: slides[index].content,
                ),
              );
            },
          );
        },
      ),
    );
  }

//! the BottomNavigationBar here<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
  BottomNavigationBar buildBottomNavigationBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.cyan,
      unselectedItemColor: Colors.grey[750],
      currentIndex: _selectedIndex,
      onTap: (int index) {
        setState(() {
          _selectedIndex = index;
        });
        navigateToSelectedPage(index);
      },
      items: const [
        BottomNavigationBarItem(
            icon: Icon(Icons.paste_outlined), label: 'تقديم تقرير'),
        BottomNavigationBarItem(
            icon: Icon(Icons.important_devices_rounded), label: 'الأجهزة'),
        BottomNavigationBarItem(
            icon: Icon(Icons.miscellaneous_services_outlined), label: 'صيانتي'),
        BottomNavigationBarItem(
            icon: Icon(Icons.manage_accounts_outlined), label: 'جميع البلاغات'),
      ],
    );
  }

  void navigateToSelectedPage(int index) {
    switch (index) {
      case 0:
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const ReportSolutionPage(),
          ),
        );

        break;
      case 1:
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const DeviceTablePage(),
          ),
        );
        break;
      case 2:
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const ReportsReceived(),
          ),
        );
        break;
      case 3:
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const DeviceReports(),
          ),
        );
        break;
    }
  }
}
