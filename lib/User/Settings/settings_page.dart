import 'package:first_time/Auth/reset_password.dart';
import 'package:first_time/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsPageUser extends StatefulWidget {
  const SettingsPageUser({super.key});

  @override
  State<SettingsPageUser> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPageUser> {
  bool abdullahSwitch = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'الاعدادات',
          style: TextStyle(
            fontFamily: 'Cario',

            color: Colors.white,
            fontSize: 24, //  تغيير هذه القيمة لتكون الحجم
            fontWeight: FontWeight.bold,
          ),
        ),
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
        iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: true,
        toolbarHeight: 50,
        automaticallyImplyLeading: true,
      ), //AppBar
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(
              Icons.brightness_6,
              color: Colors.teal,
            ),
            title: const Text(
              'تغيير السمة',
              style: TextStyle(
                fontSize: 20,
                color: Colors.teal,
                fontWeight: FontWeight.bold,
                fontFamily: 'Cario',
              ),
            ),
            trailing: Switch(
              value: Theme.of(context).brightness == Brightness.dark,
              onChanged: (value) {
                final themeProvider =
                    Provider.of<ThemeProvider>(context, listen: false);
                themeProvider.toggleTheme();
              },
              activeTrackColor: Colors.tealAccent,
              activeColor: Theme.of(context).brightness == Brightness.dark
                  ? Colors.teal
                  : Colors.tealAccent,
              inactiveThumbColor: Colors.teal[100],
              inactiveTrackColor: Colors.teal[200],
            ),
          ),
          const Divider(),

          ListTile(
            leading: const Icon(
              Icons.notifications,
              color: Colors.teal,
            ), // أيقونة الإشعارات
            title: const Text(
              'الإشعارات',
              style: TextStyle(
                fontSize: 20,
                color: Colors.teal,
                fontWeight: FontWeight.bold,
                fontFamily: 'Cario',
              ),
            ),
            trailing: Switch(
              value: abdullahSwitch,
              onChanged: (value) {
                setState(() {
                  abdullahSwitch = value;
                });
              },
            ),
          ),
          const Divider(), // خط فاصل بين القوائم

          // قائمة تعديل كلمة المرور
          ListTile(
            leading: const Icon(
              Icons.lock,
              color: Colors.teal,
            ), // أيقونة تعديل كلمة المرور
            title: const Text(
              'تعديل كلمة المرور',
              style: TextStyle(
                fontSize: 20,
                color: Colors.teal,
                fontWeight: FontWeight.bold,
                fontFamily: 'Cario',
              ),
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios,
              color: Colors.teal,
            ), // أيقونة الانتقال لصفحة تعديل كلمة المرور إذا كان هناك
            onTap: () {
              Navigator.push(
                context,
                // ignore: prefer_const_constructors
                MaterialPageRoute(
                  builder: (context) => const ForgetPasswordPage(),
                ),
              );
            },
          ),
          const Divider(),

          // قائمة اللغة
          ListTile(
            leading: const Icon(
              Icons.language,
              color: Colors.teal,
            ), // أيقونة اللغة
            title: const Text(
              'اللغة',
              style: TextStyle(
                fontSize: 20,
                color: Colors.teal,
                fontWeight: FontWeight.bold,
                fontFamily: 'Cario',
              ),
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios,
              color: Colors.teal,
            ),
            onTap: () async {
              await launchUrl(Uri.parse('https://github.com/e7gx'));
            },
          ),
          const Divider(),
        ],
      ),
    );
  }
}
