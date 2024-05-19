import 'package:first_time/Auth/reset_password.dart';
import 'package:first_time/generated/l10n.dart';
import 'package:first_time/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
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
        title: Text(
          S.of(context).account_setting_Settings,
          style: const TextStyle(
            fontFamily: 'Cario',

            color: Colors.white,
            fontSize: 22, //  تغيير هذه القيمة لتكون الحجم
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
              color: Colors.blue,
            ),
            title: Text(
              S.of(context).account_setting_ChangeTheme,
              style: const TextStyle(
                fontSize: 20,
                color: Colors.blue,
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
              activeTrackColor: Colors.cyan,
              activeColor: Theme.of(context).brightness == Brightness.dark
                  ? Colors.blue
                  : Colors.cyan,
              inactiveThumbColor: Colors.blue[100],
              inactiveTrackColor: Colors.blueAccent[200],
            ),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(
              Icons.notifications,
              color: Colors.blue,
            ), // أيقونة الإشعارات
            title: Text(
              S.of(context).account_setting_Notifications,
              style: const TextStyle(
                fontSize: 20,
                color: Colors.blue,
                fontWeight: FontWeight.bold,
                fontFamily: 'Cario',
              ),
            ),
            trailing: Switch(
              value: abdullahSwitch,
              activeColor: Colors.blue,
              onChanged: (value) {
                setState(() {
                  abdullahSwitch = value;
                });
              },
            ),

            onTap: () {},
          ),
          const Divider(), // خط فاصل بين القوائم

          ListTile(
            leading: const Icon(
              Icons.lock,
              color: Colors.blue,
            ), // أيقونة تعديل كلمة المرور
            title: Text(
              S.of(context).account_setting_EditPassword,
              style: const TextStyle(
                fontSize: 20,
                color: Colors.blue,
                fontWeight: FontWeight.bold,
                fontFamily: 'Cario',
              ),
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios,
              color: Colors.blue,
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
              color: Colors.blue,
            ), // أيقونة اللغة
            title: Text(
              S.of(context).account_setting_Language,
              style: const TextStyle(
                fontSize: 20,
                color: Colors.blue,
                fontWeight: FontWeight.bold,
                fontFamily: 'Cario',
              ),
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios,
              color: Colors.blue,
            ),
            onTap: () async {
              await launchUrl(Uri.parse('https://github.com/e7gx'));
            },
          ),
          const Divider(),

          // قائمة التقييم وتعديل الصور
          ListTile(
            leading: const Icon(
              Icons.rate_review,
              color: Colors.blue,
            ), // أيقونة التقييم
            title: Text(
              S.of(context).account_setting_WhoAreWe,
              style: const TextStyle(
                fontSize: 20,
                color: Colors.blue,
                fontWeight: FontWeight.bold,
                fontFamily: 'Cario',
              ),
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios,
              color: Colors.blue,
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
