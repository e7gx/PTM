import 'package:flutter/material.dart';
import 'package:first_time/settings/it_settings.dart';

class TechnicalSupportStatisticsPage extends StatelessWidget {
  const TechnicalSupportStatisticsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'مؤشر الدعم الفني',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 24, //  تغيير هذه القيمة لتكون الحجم
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.cyan,
        iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: true,
        toolbarHeight: 50,
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
        automaticallyImplyLeading: true,
      ), //AppBar
      body: Center(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 255, 255, 255),
                Color.fromARGB(255, 169, 223, 255),
              ],
              begin: Alignment.topRight,
              end: Alignment.bottomCenter,
            ),
          ),
          child: const SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SupportStatisticCard(
                  title: 'سرعة الاستجابة للبلاغ',
                  value: '90%',
                  icon: Icons.access_time, // أيقونة سرعة الاستجابة
                  iconColor: Colors.blue, // لون أيقونة سرعة الاستجابة
                ),
                SupportStatisticCard(
                  title: 'نسبة حل المشكلة',
                  value: '75%',
                  icon: Icons.check_circle, // أيقونة نسبة حل المشكلة
                  iconColor: Colors.green,
                ),
                SupportStatisticCard(
                  title: 'التقييم الشامل',
                  value: '4.5/5',
                  icon: Icons.star, // أيقونة التقييم الشامل
                  iconColor: Colors.orange, // لون أيقونة التقييم الشامل
                ),
                SizedBox(
                  height: 30,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
