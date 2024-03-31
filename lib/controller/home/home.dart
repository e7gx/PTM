import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:first_time/reports/it_tasks/it_reports_received.dart';
import 'package:first_time/controller/home/display_slide_homepage.dart';
import 'package:first_time/reports/user_reports/device_display_reports.dart';
import 'package:first_time/reports/it_reports/submited_it_reports/it_display_reports_page.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildBody(),
    );
  }

  SingleChildScrollView buildBody() {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2),
            child: TextField(
              cursorColor: Colors.cyan,
              textAlign: TextAlign.end,
              decoration: InputDecoration(
                fillColor: Colors.white,
                hintText: 'البحث عن صفحة',
                hintStyle: const TextStyle(
                    fontFamily: 'Cario',
                    color: Color(0xFF0099FF),
                    fontSize: 12,
                    fontWeight: FontWeight.bold),
                prefixIcon: const Icon(Icons.search_rounded),
                border: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.teal, width: 2),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),

          //!1111111111111111111111111  Card Number One   1111111111111111111111111111111111111111111111111111

          const Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                '\t⚡🔧 بلاغات اليوم ',
                textAlign: TextAlign.right,
                style: TextStyle(
                    fontFamily: 'Cario',
                    color: Color(0xFF0099FF),
                    fontSize: 23,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 50),
            ],
          ),
          const SizedBox(height: 10),

          buildSlideViewTwo(),

          const SizedBox(height: 20),
          const Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                '🚀 صيانتي اليوم',
                style: TextStyle(
                    fontFamily: 'Cario',
                    color: Color(0xFF0099FF),
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ), //! debugPrint(عد
          //!222222222222222222222222   Card Number Two   2222222222222222222222222222222222222222222222222222

          buildSlideView(),

          const Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                '\t📑📝 التقارير ',
                textAlign: TextAlign.right,
                style: TextStyle(
                    fontFamily: 'Cario',
                    color: Color(0xFF0099FF),
                    fontSize: 23,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 30),
            ],
          ),
          buildSlideViewThree(),
          const SizedBox(height: 30),
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
            return Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Lottie.asset('assets/animation/like1.json',
                    fit: BoxFit.contain, width: 100, height: 100),
                const Text(
                  'لا يوجد بلاغات',
                  style: TextStyle(
                      fontFamily: 'Cario',
                      color: Color(0xFF0099FF),
                      fontSize: 23,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ));
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
    User? userId = FirebaseAuth.instance.currentUser;

    return SizedBox(
      height: 200,
      child: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('IT_Reports_Received')
            .where('receiver_uid', isEqualTo: userId?.uid)
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
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Lottie.asset('assets/animation/like1.json',
                      fit: BoxFit.contain, width: 100, height: 100),
                  const Text(
                    'لا يوجد بلاغات',
                    style: TextStyle(
                        fontFamily: 'Cario',
                        color: Color(0xFF0099FF),
                        fontSize: 23,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            );
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
                        builder: (context) => const ReportsReceived()),
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

  SizedBox buildSlideViewThree() {
    User? userId = FirebaseAuth.instance.currentUser;

    return SizedBox(
      height: 200,
      child: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('IT_Reports')
            .where('IT_receiver_uid', isEqualTo: userId?.uid)
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
            return Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Lottie.asset('assets/animation/like1.json',
                    fit: BoxFit.contain, width: 100, height: 100),
                const Text(
                  'لا يوجد بلاغات',
                  style: TextStyle(
                      fontFamily: 'Cario',
                      color: Color(0xFF0099FF),
                      fontSize: 23,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ));
          }

          // تحويل البيانات إلى قائمة من SlideData
          final slides = snapshot.data!.docs.map((doc) {
            final data = doc.data() as Map<String, dynamic>;
            return SlideData(
              image: 'assets/images/uqu.png',
              title: data['location'] ?? 'جهاز غير معروف',
              content: data['it_report_solution'] ?? 'مشكلة غير معروفة',
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
                        builder: (context) => const ReportsPage()),
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
}
