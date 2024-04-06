import 'package:first_time/register_assets/register_assets.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lottie/lottie.dart';

class PasswordAccessWidget extends StatefulWidget {
  const PasswordAccessWidget({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PasswordAccessWidgetState createState() => _PasswordAccessWidgetState();
}

class _PasswordAccessWidgetState extends State<PasswordAccessWidget> {
  final List<TextEditingController> _passwordControllers =
      List.generate(5, (index) => TextEditingController());
  final String _correctPassword = '12345'; // Replace with your correct password

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
          "صفحة التحقق",
          style: TextStyle(
            fontFamily: 'Cario',
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        toolbarHeight: 50,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(500),
            bottomLeft: Radius.circular(40),
          ),
        ),
        elevation: 2.00,
        backgroundColor: Colors.cyan,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.teal,
                Color(0xFF00CCFF),
              ],
              begin: FractionalOffset(0.0, 0.0),
              end: FractionalOffset(1.0, 0.0),
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Lottie.asset('assets/animation/userLog.json', height: 300),
            const Text(
              'PasswordAccessWidget',
              style: TextStyle(
                fontFamily: 'Cario',
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(5, (index) {
                return SizedBox(
                  width: 50,
                  child: TextField(
                    cursorColor: Colors.teal,
                    style: const TextStyle(
                      fontFamily: 'Cario',
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal,
                    ),
                    controller: _passwordControllers[index],
                    maxLength: 1,
                    obscureText: true, // Hide entered characters
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: Colors.teal,
                          width: 2.0,
                        ),
                      ),
                      filled: true,
                      fillColor: Colors.grey[200],
                      counterText: '',
                      border: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.teal),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            const BorderSide(color: Colors.teal, width: 2.0),
                      ),
                    ),
                    onChanged: (value) {
                      if (value.isNotEmpty && index < 4) {
                        FocusScope.of(context)
                            .nextFocus(); // Move focus to the next text field
                      }
                    },
                  ),
                );
              }),
            ),
            const SizedBox(height: 90),
            ElevatedButton(
              onPressed: () {
                // Combine the input from all text fields to form the password
                String enteredPassword = '';
                for (var controller in _passwordControllers) {
                  enteredPassword += controller.text;
                }

                // Check if the entered password is correct
                if (enteredPassword == _correctPassword) {
                  // Password is correct, perform action
                  // For example, navigate to a new page
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const RegisterDevice()),
                  );
                } else {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(32.0),
                          ),
                        ),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Lottie.asset(
                                'assets/animation/WOR.json', //! importint Change The Animaiton pls
                                height: 200),
                            const SizedBox(height: 10),
                            const Center(
                              child: Text(
                                'كلمة السر غير صحيحة',
                                style: TextStyle(
                                    fontFamily: 'Cario',
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.red),
                              ),
                            ),
                          ],
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Fluttertoast.showToast(
                                backgroundColor: Colors.red,
                                msg: "كلمة السر غير صحيحة",
                                toastLength: Toast.LENGTH_LONG,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 4,
                                textColor: Colors.white,
                                fontSize: 16.0,
                              );
                              Navigator.of(context).pop();
                            },
                            child: const Text(
                              'موافق',
                              style: TextStyle(
                                  fontFamily: 'Cario',
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.teal),
                            ),
                          ),
                        ],
                      );
                    },
                  );

                  for (var controller in _passwordControllers) {
                    controller.clear();
                  }
                }
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 65.0),
                backgroundColor: Colors.teal,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: const Text(
                'تحقق',
                style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.white,
                    fontFamily: 'Cario',
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    // Dispose the controllers when done
    for (var controller in _passwordControllers) {
      controller.dispose();
    }
    super.dispose();
  }
}
