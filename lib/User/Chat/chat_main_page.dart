import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter/services.dart';

import 'package:first_time/User/api/chatgpt_api.dart';
import 'package:http/http.dart' as http;
import 'package:typewritertext/typewritertext.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final List<Message> _messages = [];
  final TextEditingController _textEditingController = TextEditingController();
  bool _userSentMessage = false;
  String fullName = ''; // Variable to store the user's full name
  Future<void> fetchNameFromFirestore() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        String uid = user.uid;

        QuerySnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore
            .instance
            .collection('Users_Normal')
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
  void initState() {
    super.initState();
    fetchNameFromFirestore();
  }

  void onSendMessage() {
    String trimmedText = _textEditingController.text.trim();
    if (trimmedText.isEmpty) {
      // هنا يمكنك عرض رسالة تنبيه للمستخدم أو تجاهل العملية
      return; // توقف عن تنفيذ باقي الكود في هذه الدالة إذا كان الحقل فارغ
    }

    setState(() {
      _userSentMessage = true;
      Message message = Message(text: trimmedText, isMe: true);
      _messages.insert(0, message);
      _textEditingController.clear();
    });

    sendMessageToChatGpt(trimmedText).then((response) {
      Message chatGptMessage = Message(text: response, isMe: false);
      setState(() {
        _messages.insert(0, chatGptMessage);
      });
    }).catchError((error) {
      // يمكنك التعامل مع الخطأ هنا
      // print('Error sending message to ChatGPT: $error');
    });
  }

  Future<String> sendMessageToChatGpt(String message) async {
    Uri uri = Uri.parse("https://api.openai.com/v1/chat/completions");

    Map<String, dynamic> body = {
      "model": "gpt-3.5-turbo",
      "messages": [
        {"role": "user", "content": message}
      ],
      "max_tokens": 250,
    };

    try {
      final response = await http.post(
        uri,
        headers: {
          "Content-Type": "application/json; charset=UTF-8",
          "Authorization": "Bearer ${APIKey.apikey}",
        },
        body: json.encode(body),
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> parsedResponse =
            json.decode(utf8.decode(response.bodyBytes));
        if (parsedResponse.containsKey('choices') &&
            parsedResponse['choices'].isNotEmpty &&
            parsedResponse['choices'][0].containsKey('message')) {
          return parsedResponse['choices'][0]['message']['content'] ??
              "No reply found.";
        } else {
          return "Error: Invalid response format.";
        }
      } else {
        return "Error: ${response.statusCode} - ${response.reasonPhrase}";
      }
    } catch (e) {
      // print("Error sending message to ChatGPT: $e");
      return "Error: Exception during API call.";
    }
  }

  Widget _buildMessage(Message message) {
    // تحديد مسار صورة المتحدث
    String imagePath =
        message.isMe ? 'assets/images/chat.png' : 'assets/images/robot.png';

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      child: Row(
        mainAxisAlignment:
            message.isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          if (!message.isMe) // لعرض صورة الـ AI قبل الرسالة
            CircleAvatar(
              backgroundImage: AssetImage(imagePath),
            ),
          const SizedBox(width: 10),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.all(15),
              child: message.isMe
                  ? SelectableText(
                      message.text,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 17,
                        fontFamily: 'Cario', // استخدام الخط Cario هنا
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  : TypeWriterText(
                      text: Text(
                        message.text,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                          fontFamily: 'Cario', // استخدام الخط Cario هنا
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      duration: const Duration(
                          milliseconds: 5), // تحديد سرعة الكتابة هنا
                    ),
            ),
          ),
          if (message.isMe) // لعرض صورة المستخدم بعد الرسالة
            const SizedBox(width: 6),
          if (message.isMe)
            CircleAvatar(
              backgroundColor: Colors.teal,
              backgroundImage: AssetImage(imagePath),
            ),
        ],
      ),
    );
  }

//! KEYBOARD STYLE HERE //!
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            Color(0xFFFFFFFF),
            Colors.teal,
          ], begin: Alignment.topLeft, end: Alignment.bottomRight),
        ),
        child: Column(
          children: <Widget>[
            if (!_userSentMessage) _buildWelcomeMessage(),
            Expanded(
              child: ListView.builder(
                reverse: true,
                itemCount: _messages.length,
                itemBuilder: (BuildContext context, int index) {
                  return _buildMessage(_messages[index]);
                },
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFFB6FFEE),
                    Color(0xFFB6FFEE),
                    Colors.white,
                  ],
                  begin: Alignment.topRight,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: const Divider(height: 4.0),
            ),
            Container(
              decoration: BoxDecoration(color: Theme.of(context).cardColor),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      style: const TextStyle(color: Colors.teal),
                      controller: _textEditingController,
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.all(10.0),
                        hintText: 'مرحبا.....',
                        hintTextDirection: TextDirection.rtl,
                        border: InputBorder.none,
                      ),
                      textDirection: TextDirection.rtl,
                      inputFormatters: [
                        TextInputFormatter.withFunction((oldValue, newValue) {
                          // Allow newValue if it's empty or doesn't start with a space
                          if (newValue.text.isEmpty ||
                              newValue.text[0] != ' ') {
                            return newValue;
                          }
                          // Otherwise, return oldValue to prevent adding the space at the beginning
                          return oldValue;
                        }),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: onSendMessage,
                    icon: const Icon(
                      Icons.rocket_launch,
                      color: Colors.teal,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWelcomeMessage() {
    if (!_userSentMessage && _textEditingController.text.isEmpty) {
      return Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Colors.teal[100],
          border: Border.all(color: Colors.teal),
        ),
        child: Row(
          children: [
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                ' مرحباً $fullName ! أنا مساعدك الذكي  يرجى وصف مشكلتك، وسأحاول مساعدتك',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.teal[900],
                  fontSize: 14,
                  fontFamily: 'Cario', // استخدام الخط Cario هنا
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Lottie.asset(
              'assets/animation/like1.json',
              fit: BoxFit.fitWidth,
              height: 80,
            ),
          ],
        ),
      );
    } else {
      return const SizedBox(); // يعود بعرض مربع فارغ بدون أي شيء
    }
  }
}

class Message {
  final String text;
  final bool isMe;
  Message({required this.text, required this.isMe});
}
