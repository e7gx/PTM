import 'package:flutter/material.dart';
import 'package:first_time/Register_Accounts/login_page.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'الاعدادات',
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
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(5000),
            bottomLeft: Radius.circular(0),
          ),
        ),
        automaticallyImplyLeading: true,
      ), //AppBar
      body: ListView(
        children: [
          // قائمة الإشعارات
          ListTile(
            leading: const Icon(Icons.notifications), // أيقونة الإشعارات
            title: const Text('الإشعارات'),
            trailing: const Icon(Icons
                .arrow_forward_ios), // أيقونة الانتقال للصفحة الخاصة بالإشعارات إذا كان هناك
            onTap: () {
              // قم بإضافة المنطق الخاص بصفحة الإشعارات هنا
            },
          ),
          const Divider(), // خط فاصل بين القوائم

          // قائمة تعديل كلمة المرور
          ListTile(
            leading: const Icon(Icons.lock), // أيقونة تعديل كلمة المرور
            title: const Text('تعديل كلمة المرور'),
            trailing: const Icon(Icons
                .arrow_forward_ios), // أيقونة الانتقال لصفحة تعديل كلمة المرور إذا كان هناك
            onTap: () {
              // قم بإضافة المنطق الخاص بصفحة تعديل كلمة المرور هنا
            },
          ),
          const Divider(),

          // قائمة اللغة
          ListTile(
            leading: const Icon(Icons.language), // أيقونة اللغة
            title: const Text('اللغة'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              // قم بإضافة المنطق الخاص بصفحة تغيير اللغة هنا
            },
          ),
          const Divider(),

          // قائمة التقييم وتعديل الصور
          ListTile(
            leading: const Icon(Icons.rate_review), // أيقونة التقييم
            title: const Text('التقييم وتعديل الصور'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              // قم بإضافة المنطق الخاص بصفحة التقييم وتعديل الصور هنا
            },
          ),
          const Divider(),

          // قائمة تسجيل الخروج
          ListTile(
            leading: const Icon(Icons.logout), // أيقونة تسجيل الخروج
            title: const Text('تسجيل الخروج'),
            onTap: () {
              // قم بإضافة المنطق الخاص بتسجيل الخروج هنا
              // يجب توجيه المستخدم إلى صفحة تسجيل الدخول (LoginPage)
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => LoginPage(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
