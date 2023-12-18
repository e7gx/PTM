import 'package:flutter/material.dart';

class SupportStatisticCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color iconColor;

  const SupportStatisticCard({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(60),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Icon(
                  icon,
                  color: iconColor,
                  size: 40,
                ),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              value,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyDataPage extends StatelessWidget {
  final UserData userData = UserData(
    jobNumber: '441003568',
    fullName: 'Abdullah Al-Ghamdi',
    organization: 'جامعة ام القرى',
    position: 'فني صيانة الاجهزة',
    email: 's441003562@st.uqu.edu.sa',
    username: 'abdulla2001',
  );

  MyDataPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('          بيانات المستخدم '),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            UserAvatarInfoCard(
              imageUrl: 'images/emp.jpeg',
              fullName: userData.fullName,
              jobTitle: userData.position,
            ),
            UserDetailTile(
              title: 'اسم المستخدم',
              value: userData.username,
              icon: Icons.person_2_rounded,
            ),
            UserDetailTile(
              title: 'الرقم الوظيفي',
              value: userData.jobNumber,
              icon: Icons.work,
            ),
            UserDetailTile(
              title: 'الموسسة',
              value: userData.organization,
              icon: Icons.business,
            ),
            UserDetailTile(
              title: 'البريد الإلكتروني',
              value: userData.email,
              icon: Icons.email,
            ),
          ],
        ),
      ),
    );
  }
}

class UserAvatarInfoCard extends StatelessWidget {
  final String imageUrl;
  final String fullName;
  final String jobTitle;

  const UserAvatarInfoCard({
    super.key,
    required this.imageUrl,
    required this.fullName,
    required this.jobTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.all(16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15.0),
              topRight: Radius.circular(15.0),
            ),
            child: Image.asset(
              imageUrl,
              width: double.infinity,
              height: 400,
              fit: BoxFit.cover,
            ),
          ),
          ListTile(
            title: Text(
              fullName,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(jobTitle),
          ),
        ],
      ),
    );
  }
}

class UserDetailTile extends StatelessWidget {
  final String title;
  final String value;
  final IconData? icon;

  const UserDetailTile({
    super.key,
    required this.title,
    required this.value,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: icon != null ? Icon(icon) : null,
      title: Text(title),
      subtitle: Text(value),
    );
  }
}

class UserData {
  final String jobNumber;
  final String fullName;
  final String organization;
  final String position;
  final String email;
  final String username;

  UserData({
    required this.jobNumber,
    required this.fullName,
    required this.organization,
    required this.position,
    required this.email,
    required this.username,
  });
}
