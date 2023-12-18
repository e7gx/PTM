import 'package:flutter/material.dart';
import 'package:first_time/settings/it_settings.dart';

class TechnicalSupportStatisticsPage extends StatelessWidget {
  const TechnicalSupportStatisticsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('        مؤشر الدعم الفني لدي  '),
      ),
      body: const Center(
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
            // يمكنك إضافة المزيد من الإحصائيات حسب الحاجة
          ],
        ),
      ),
    );
  }
}
