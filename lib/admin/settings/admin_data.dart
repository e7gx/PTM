import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_time/generated/l10n.dart';
import 'package:flutter/material.dart';

class AdminDataPage extends StatefulWidget {
  const AdminDataPage({super.key});

  @override
  State<AdminDataPage> createState() => _MyDataPageState();
}

class _MyDataPageState extends State<AdminDataPage> {
  String firstName = ''; // Variable to store the user's first name
  String lastName = ''; // Variable to store the user's last name
  String fullName = ''; // Variable to store the user's full name
  String email = ''; // Variable to store the user's email
  String data = ''; // Variable to store the user's email

  @override
  void initState() {
    super.initState();
    fetchNameFromFirestore();
  }

  Future<void> fetchNameFromFirestore() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        String uid = user.uid;

        QuerySnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore
            .instance
            .collection('Users_IT')
            .where('uid', isEqualTo: uid)
            .limit(1)
            .get();

        if (snapshot.docs.isNotEmpty) {
          // Get the first document in the snapshot
          DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
              snapshot.docs.first;

          // Retrieve the user's first name from the document
          String firstName = documentSnapshot.data()?['first name'] ?? '';
          String lastName = documentSnapshot.data()?['last name'] ?? '';
          String email = documentSnapshot.data()?['email'] ?? 'opss';

          setState(() {
            fullName = '$firstName $lastName ';
            data = '$email ';
          });
        } else {
          // print('User data not found');
        }
      }
    } catch (e) {
      // print('Error fetching user data: $e');
    }
  }

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
        title: Text(S.of(context).admin_data_UserData),
        centerTitle: true,
        titleTextStyle: const TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontFamily: 'Cario',
            fontWeight: FontWeight.bold),
        iconTheme: const IconThemeData(color: Colors.white),
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
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            UserAvatarInfoCard(
              imageUrl: 'assets/images/chat.png',
              name: fullName,
              lastNameWidget: S.of(context).Admin,
            ),
            UserDetailTile(
              title: S.of(context).admin_data_Username,
              value: fullName,
              icon: Icons.person_2_rounded,
            ),
            UserDetailTile(
              title: S.of(context).admin_data_Email,
              value: data,
              icon: Icons.email,
            ),
            UserDetailTile(
              title: S.of(context).admin_data_JobPosition,
              value: S.of(context).admin_data_Admin,
              icon: Icons.contact_emergency_sharp,
            ),
          ],
        ),
      ),
    );
  }
}

class UserAvatarInfoCard extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String lastNameWidget;

  const UserAvatarInfoCard({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.lastNameWidget,
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
              height: 300,
              fit: BoxFit.contain,
            ),
          ),
          ListTile(
            title: Center(
              child: Text(
                name,
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.teal,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Cario',
                ),
              ),
            ),
            subtitle: Center(
              child: Text(
                lastNameWidget,
                style: const TextStyle(
                  color: Colors.teal,
                  fontFamily: 'Cario',
                ),
              ),
            ),
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
  final TextStyle? style;

  const UserDetailTile({
    Key? key,
    required this.title,
    required this.value,
    this.icon,
    this.style,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isRTL = Localizations.localeOf(context).languageCode == 'ar';

    return ListTile(
      leading: icon != null ? Icon(icon) : null,
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontFamily: 'Cario',
          fontWeight: FontWeight.bold,
          color: Colors.teal,
        ),
        textDirection: isRTL ? TextDirection.ltr : TextDirection.rtl,
      ),
      subtitle: Text(
        value,
        textDirection: isRTL ? TextDirection.ltr : TextDirection.rtl,
      ),
      textColor: Colors.teal,
    );
  }
}
