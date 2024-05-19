import 'dart:ui';

import 'package:first_time/generated/l10n.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:first_time/reports/it_tasks/it_reports_received.dart';
import 'package:first_time/controller/home/display_slide_homepage.dart';
// import 'package:first_time/reports/user_reports/device_display_reports.dart';
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
      child: Stack(
        children: [
          Positioned.fill(
            child: Lottie.asset(
              'assets/animation/afterAfect.json',
              fit: BoxFit.fill,
            ),
          ),
          Positioned.fill(
            child: Lottie.asset(
              'assets/animation/ppmana.json',
              fit: BoxFit.fill,
            ),
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 50, sigmaY: 50),
              child: const SizedBox(),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 20),
              // Padding(
              //   padding:
              //       const EdgeInsets.symmetric(horizontal: 8.0, vertical: 0),
              //   child: TextField(
              //     style:
              //         const TextStyle(color: Colors.cyan, fontFamily: 'Cario'),
              //     cursorColor: Colors.cyan,
              //     textAlign: TextAlign.end,
              //     decoration: InputDecoration(
              //       filled: true,
              //       fillColor: Colors.white,
              //       focusColor: Colors.blue,
              //       hintText: 'البحث عن صفحة',
              //       hintStyle: const TextStyle(
              //           fontFamily: 'Cario',
              //           color: Colors.blue,
              //           fontSize: 12,
              //           fontWeight: FontWeight.bold),
              //       prefixIcon: const Icon(
              //         Icons.search_rounded,
              //         color: Colors.blue,
              //       ),
              //       iconColor: Colors.blue,
              //       border: OutlineInputBorder(
              //         borderSide: const BorderSide(
              //           color: Colors.blue,
              //           width: 2,
              //         ),
              //         borderRadius: BorderRadius.circular(10),
              //       ),
              //       focusedBorder: OutlineInputBorder(
              //         borderRadius: BorderRadius.circular(10),
              //         borderSide: const BorderSide(
              //           color: Colors.transparent,
              //           width: 3.0,
              //         ),
              //       ),
              //       enabledBorder: OutlineInputBorder(
              //         borderRadius: BorderRadius.circular(10),
              //         borderSide: const BorderSide(
              //             color: Colors.transparent, width: 1.0),
              //       ),
              //     ),
              //   ),
              // ),

              //!1111111111111111111111111  Card Number One   1111111111111111111111111111111111111111111111111111

              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    S.of(context).home_TodayReports,
                    textAlign: TextAlign.right,
                    style: const TextStyle(
                        fontFamily: 'Cario',
                        color: Color(0xFF0099FF),
                        fontSize: 23,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 50),
                ],
              ),
              const SizedBox(height: 10),

              buildSlideViewTwo(),

              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    S.of(context).home_MyMaintenanceToday,
                    style: const TextStyle(
                        fontFamily: 'Cario',
                        color: Color(0xFF0099FF),
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ), //! debugPrint(عد
              //!222222222222222222222222   Card Number Two   2222222222222222222222222222222222222222222222222222

              buildSlideView(),

              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    S.of(context).home_Reports,
                    textAlign: TextAlign.right,
                    style: const TextStyle(
                        fontFamily: 'Cario',
                        color: Color(0xFF0099FF),
                        fontSize: 23,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 30),
                ],
              ),
              buildSlideViewThree(),
              const SizedBox(height: 30),
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
            return Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Lottie.asset('assets/animation/like1.json',
                    fit: BoxFit.contain, width: 100, height: 100),
                Text(
                  S.of(context).home_NoReports,
                  style: const TextStyle(
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
              title: data['location'] ?? S.of(context).home_UnknownDevice,
              content: data['problem'] ?? S.of(context).home_UnknownProblem,
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
                  Text(
                    S.of(context).home_NoReports,
                    style: const TextStyle(
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
              title: data['location'] ?? S.of(context).home_UnknownDevice,
              // content: data['problem'] ?? 'مشكلة غير معروفة',
            );
          }).toList();

          return PageView.builder(
            controller: _pageController,
            itemCount: slides.length,
            itemBuilder: (context, index) {
              return SlideWidgetTwo(
                image: slides[index].image,
                title: slides[index].title,
                // content: slides[index].content,
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
                Text(
                  S.of(context).home_NoReports,
                  style: const TextStyle(
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
              title: data['location'] ?? S.of(context).home_UnknownDevice,
              content: data['solution'] ?? S.of(context).home_UnknownProblem,
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
