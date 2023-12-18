import 'package:flutter/material.dart';
import 'package:first_time/reports/it_reports/it_display_reports_page.dart';
import 'package:first_time/device_table/device_table_page.dart';
import 'package:first_time/reports/user_reports/device_display_reports.dart';
import 'package:first_time/reports/it_reports/it_write_solution_report.dart';
import 'package:lottie/lottie.dart';
import 'package:first_time/settings/accont_setting.dart';
import 'package:first_time/settings/it_settings.dart';
import 'package:first_time/user_info/technical_support_statistics.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:first_time/page/display_slide_homepage.dart';

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
        title: const Text(
          textAlign: TextAlign.center,
          '       الصفحة الرئيسية',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24, //  تغيير هذه القيمة لتكون الحجم
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.cyan,
        automaticallyImplyLeading: false,
        leading: buildPopupMenuButton(),
        iconTheme: const IconThemeData(color: Colors.white),
        elevation: 20,
      ),
      body: buildBody(),
      bottomNavigationBar: buildBottomNavigationBar(),
    );
  }

  PopupMenuButton<String> buildPopupMenuButton() {
    return PopupMenuButton<String>(
      icon: const Icon(Icons.more_vert),
      onSelected: (String result) {
        handlePopupMenuSelection(result);
      },
      itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
        const PopupMenuItem<String>(
          value: 'بياناتي',
          child: ListTile(
            leading: Icon(Icons.person),
            title: Text('بياناتي'),
          ),
        ),
        const PopupMenuItem<String>(
          value: 'مؤشر الأداء',
          child: ListTile(
            leading: Icon(Icons.bar_chart),
            title: Text('مؤشر الأداء'),
          ),
        ),
        const PopupMenuItem<String>(
          value: 'الإعداد',
          child: ListTile(
            leading: Icon(Icons.settings),
            title: Text('الإعداد'),
          ),
        ),
      ],
    );
  }

  void handlePopupMenuSelection(String result) {
    switch (result) {
      case 'بياناتي':
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => MyDataPage()),
        );
        break;
      case 'مؤشر الأداء':
        Navigator.of(context).push(
          MaterialPageRoute(
              builder: (context) => const TechnicalSupportStatisticsPage()),
        );
        break;
      case 'الإعداد':
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const SettingsPage()),
        );
        break;
    }
  }

  SingleChildScrollView buildBody() {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Lottie.asset('animation/ppmana.json', width: 400, height: 400),
            const SizedBox(height: 10),
            const Text('أهلا وسهلا بك',
                style: TextStyle(
                    color: Colors.black54,
                    fontSize: 50,
                    fontWeight: FontWeight.bold)),
            const SizedBox(height: 0),
            const Text('اليك بلاغات اليوم',
                style: TextStyle(
                    color: Colors.black54,
                    fontSize: 30,
                    fontWeight: FontWeight.bold)),
            buildSlideView(),
          ],
        ),
      ),
    );
  }

  SizedBox buildSlideView() {
    return SizedBox(
      height: 400,
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
              image:
                  'images/uqu.png', // يمكنك تغييرها إلى مسار الصورة الحقيقية إذا وجدت في البيانات
              title: data['location'] ?? 'جهاز غير معروف',
              content: data['problem'] ?? 'مشكلة غير معروفة',
            );
          }).toList();

          return PageView.builder(
            controller: _pageController,
            itemCount: slides.length,
            itemBuilder: (context, index) {
              return SlideWidget(
                image: slides[index].image,
                title: slides[index].title,
                content: slides[index].content,
              );
            },
          );
        },
      ),
    );
  }

//the bottumbar here<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
  BottomNavigationBar buildBottomNavigationBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.white,
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
            icon: Icon(Icons.important_devices_rounded), label: 'الأجهزة'),
        BottomNavigationBarItem(
          icon: Icon(Icons.paste_outlined),
          label: 'تقديم تقرير',
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.local_post_office_outlined), label: 'التقارير'),
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
            builder: (context) => const DeviceTablePage(),
          ),
        );
        break;
      case 1:
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const ReportSolutionPage(),
          ),
        );
        break;
      case 2:
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const ReportsPage(),
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
