import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_time/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter/services.dart';
import '../api/api.dart';
import 'package:http/http.dart' as http;
import 'package:typewritertext/typewritertext.dart';

class AdminAiChatPage extends StatefulWidget {
  const AdminAiChatPage({super.key});

  @override
  State<AdminAiChatPage> createState() => _MainPageState();
}

class _MainPageState extends State<AdminAiChatPage> {
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
            .collection('Users_IT')
            .where('uid', isEqualTo: uid)
            .limit(1)
            .get();

        if (snapshot.docs.isNotEmpty) {
          DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
              snapshot.docs.first;
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

  // void onSendMessage() async {
  //   Message message = Message(text: _textEditingController.text, isMe: true);

  //   _textEditingController.clear();

  //   setState(() {
  //     _messages.insert(0, message);
  //   });

  //   String response = await sendMessageToChatGpt(message.text);

  //   Message chatGpt = Message(text: response, isMe: false);
  //   setState(() {
  //     _messages.insert(0, chatGpt);
  //   });
  // }

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
    String imagePath =
        message.isMe ? 'assets/images/chat.png' : 'assets/images/robot.png';

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      child: Row(
        mainAxisAlignment:
            message.isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          if (!message.isMe)
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
                        fontSize: 15,
                        fontFamily: 'Cario',
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  : TypeWriterText(
                      text: Text(
                        message.text,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontFamily: 'Cario',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      duration: const Duration(milliseconds: 5),
                    ),
            ),
          ),
          if (message.isMe) const SizedBox(width: 6),
          if (message.isMe)
            CircleAvatar(
              backgroundColor: Colors.teal,
              backgroundImage: AssetImage(imagePath),
            ),
        ],
      ),
    );
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
        centerTitle: true,
        title: Text(
          S.of(context).ai_chat_pageSmartAssistant,
          style: const TextStyle(
            fontFamily: 'Cario',
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
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
                tileMode: TileMode.clamp),
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        elevation: 4,
        toolbarHeight: 50,
      ),
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
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(10.0),
                        hintText: S.of(context).ai_chat_pageHello,
                        hintTextDirection: TextDirection.rtl,
                        border: InputBorder.none,
                      ),
                      textDirection: TextDirection.rtl,
                      inputFormatters: [
                        TextInputFormatter.withFunction((oldValue, newValue) {
                          if (newValue.text.isEmpty ||
                              newValue.text[0] != ' ') {
                            return newValue;
                          }
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
                "${S.of(context).chat_main_Hello} $fullName ${S.of(context).chat_main_IamSmartAssistant}",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.teal[900],
                  fontSize: 14,
                  fontFamily: 'Cario',
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
      return const SizedBox();
    }
  }
}

class Message {
  final String text;
  final bool isMe;
  Message({required this.text, required this.isMe});
}
