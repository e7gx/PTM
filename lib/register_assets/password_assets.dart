import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_time/generated/l10n.dart';
import 'package:first_time/register_assets/register_assets.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:google_fonts/google_fonts.dart';

class PasswordAccessWidget extends StatefulWidget {
  const PasswordAccessWidget({Key? key}) : super(key: key);

  @override
  State<PasswordAccessWidget> createState() => _PasswordAccessWidgetState();
}

class _PasswordAccessWidgetState extends State<PasswordAccessWidget> {
  TextEditingController controller = TextEditingController();
  String fullName = ''; // Variable to store the user's full name

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

          setState(() {
            fullName = firstName;
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
        elevation: 0,
        title: Text(
          S.of(context).password,
          textAlign: TextAlign.center,
          style: GoogleFonts.almarai(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.teal),
        backgroundColor: const Color(0xffF3F5FA),
      ),
      backgroundColor: const Color(0xffF3F5FA),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // const SizedBox(
              //   height: 20,
              // ),
              Text(
                '${S.of(context).welcome} $fullName',
                textAlign: TextAlign.center,
                style: GoogleFonts.almarai(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Pinput(
                defaultPinTheme: PinTheme(
                  constraints:
                      const BoxConstraints(maxHeight: 40, maxWidth: 40),
                  width: 40,
                  height: 40,
                  padding: const EdgeInsets.all(0), // Remove specific padding
                  textStyle: const TextStyle(
                    fontSize: 20, // Adjust font size as needed
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.transparent),
                    color: const Color(0xffAFBFD5),
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
                length: 5, // Change the length to 5
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                showCursor: true,
                controller: controller,
                onCompleted: (pin) {
                  if (pin == '12345') {
                    // Password is correct
                    // You can navigate to another screen here
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RegisterDevice(),
                      ),
                    );
                  } else {
                    // Password is incorrect
                    // You can show an error message or clear the PIN input field
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                            S.of(context).password_assets_IncorrectPassword),
                        backgroundColor: Colors.redAccent,
                      ),
                    );
                    controller.clear(); // Clear the input field
                  }
                },
              ),
              const SizedBox(
                height: 50,
              ),
              GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 8),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 1,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                ),
                itemCount: 12,
                itemBuilder: (BuildContext context, int index) {
                  return circleButton(index + 1);
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget circleButton(int value) {
    return GestureDetector(
      onTap: () {
        if (controller.text.length < 5) {
          // Allow inputting up to 5 characters
          if (value < 10 || value == 11) {
            if (value < 10) {
              controller.text = controller.text + value.toString();
            } else {
              controller.text = '${controller.text}0';
            }
          } else if (value == 12) {
            int lengthOfText = controller.text.length;
            if (lengthOfText > 0) {
              controller.text = controller.text.substring(0, lengthOfText - 1);
            }
          }
          setState(() {});
        }
      },
      child: Container(
        width: 80,
        height: 80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: const Color(0xffFFFFFF),
          boxShadow: [
            BoxShadow(
              color: const Color(0x3F101010).withOpacity(0.05),
              blurRadius: 12,
              offset: const Offset(2, 4),
              spreadRadius: 0,
            )
          ],
        ),
        child: returnValueOfButton(value) is String
            ? Center(
                child: Text(
                  returnValueOfButton(value).toString(),
                  textAlign: TextAlign.center,
                  style: GoogleFonts.almarai(
                    color: Colors.green,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            : Center(
                child: returnValueOfButton(value)!,
              ),
      ),
    );
  }

  dynamic returnValueOfButton(int index) {
    if (index < 10) {
      return index.toString();
    } else if (index == 10) {
      return const Icon(
        Icons.fingerprint_sharp,
        color: Colors.green,
      );
    } else if (index == 12) {
      return const Icon(
        Icons.backspace_outlined,
        color: Colors.red,
      );
    } else if (index == 11) {
      return '0';
    }
  }
}
