// import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_time/admin/Users/Regular%20user/normal_user_data.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:lottie/lottie.dart';

class AllUsersPage extends StatefulWidget {
  const AllUsersPage({super.key});

  @override
  State<AllUsersPage> createState() => _ITReportsPageState();
}

class _ITReportsPageState extends State<AllUsersPage> {
  @override
  Widget build(BuildContext context) {
    // User? userId = FirebaseAuth.instance.currentUser;

    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('Users_Normal')
            // .orderBy(true)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Lottie.asset('assets/animation/like1.json',
                      fit: BoxFit.contain, width: 200, height: 200),
                  const Text(
                    'لا يوجد تقارير',
                    style: TextStyle(
                        fontFamily: 'Cario',
                        color: Colors.teal,
                        fontSize: 23,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            );
          }

          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              var reportData =
                  snapshot.data!.docs[index].data() as Map<String, dynamic>;
              var reportId = snapshot.data!.docs[index].id;

              return ReportCard(
                user: Report(
                  title: 'مستفيد ',
                  firstName: reportData['first name'], // التاريخ المنسق
                  lastName: reportData['last name'] ?? 'غير محدد', // الموقع
                  image: reportData['imageUrl'] ?? 'assets/images/chat.png',
                ),
                userId: reportId,
              );
            },
          );
        },
      ),
    );
  }
}

class ReportCard extends StatelessWidget {
  final Report user;
  final String userId;

  const ReportCard({super.key, required this.user, required this.userId});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10.0,
      shadowColor: Colors.tealAccent,
      margin: const EdgeInsets.only(bottom: 10.0, top: 10, left: 4),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: ListTile(
        leading: Image.asset(
          user.image,
          width: 50.0, // حجم الصورة
          height: 50.0,
          errorBuilder: (context, error, stackTrace) {
            // في حالة وجود خطأ في تحميل الصورة يظهر placeholder
            return const Icon(Icons.image, size: 100.0);
          },
        ),
        title: Text(
          user.title, textAlign: TextAlign.center, // عنوان التقرير
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: 'Cario',
            fontSize: 16,
            color: Colors.black,
          ),
        ),
        subtitle: Center(
          child: SafeArea(
            child: Padding(
              padding:
                  const EdgeInsets.only(left: 4, right: 4, bottom: 10, top: 4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 5),
                  Text(
                    'الاسم الاول : ${user.firstName}',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Cario',
                        fontSize: 12,
                        color: Colors.black54),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'الاسم الاخير : ${user.lastName}',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Cario',
                        fontSize: 11,
                        color: Colors.black54),
                  ),
                ],
              ),
            ),
          ),
        ),
        isThreeLine: true,
        trailing: ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => UserDataInAdminPage(userId: userId),
              ),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.teal,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14.0),
            ),
          ),
          child: const Text(
            'عرض البيانات',
            style: TextStyle(
              color: Colors.white, fontFamily: 'Cario',
              fontSize: 14, //  تغيير هذه القيمة لتكون الحجم
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        hoverColor: Colors.tealAccent,
      ),
    );
  }
}

class Report {
  final String title;
  final String firstName;
  final String lastName;
  final String image;

  Report({
    required this.title,
    required this.firstName,
    required this.lastName,
    required this.image,
  });
}
