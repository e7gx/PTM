import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:first_time/Chat/chatgpt_api.dart';
import 'package:http/http.dart' as http;
import 'package:typewritertext/typewritertext.dart';

class AiChatPage extends StatefulWidget {
  const AiChatPage({super.key});

  @override
  State<AiChatPage> createState() => _MainPageState();
}

class _MainPageState extends State<AiChatPage> {
  final List<Message> _messages = [];
  final TextEditingController _textEditingController = TextEditingController();

  void onSendMessage() async {
    String userMessage = _textEditingController.text;
    Message message = Message(text: userMessage, isMe: true);
    _textEditingController.clear();
    setState(() {
      _messages.insert(0, message);
    });

    if (userMessage.startsWith("PTM")) {
      // تحديد مجال PTM
      String response = await getResponseInPTMDomain(userMessage);
      Message chatGpt = Message(text: response, isMe: false);
      setState(() {
        _messages.insert(0, chatGpt);
      });
    } else {
      String response = await sendMessageToChatGpt(userMessage);
      Message chatGpt = Message(text: response, isMe: false);
      setState(() {
        _messages.insert(0, chatGpt);
      });
    }
  }

  Future<String> getResponseInPTMDomain(String message) async {
    // تحديد الردود المحددة في مجال PTM
    Map<String, String> domainQuestions = {
      "What does PTM stand for?":
          "PTM stands for \"Technology Management Project.\"",
      "What is the aim of PTM?":
          "PTM is aimed at revolutionizing the management of technological assets within companies and organizations.",
      "What aspects does PTM encompass?":
          "PTM encompasses various aspects, including asset tracking, inventory management, technical support provision, and employee performance evaluation.",
      "What is the goal of PTM?":
          "The goal of PTM is to enhance efficiency, streamline operations, and improve overall productivity in managing technological resources.",
    };

    // إرسال السؤال إلى ChatGPT
    if (domainQuestions.containsKey(message)) {
      return domainQuestions[message]!;
    } else {
      String response = await sendMessageToChatGpt(message);
      return response;
    }
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
          "Content-Type": "application/json",
          "Authorization": "Bearer ${APIKey.apikey}",
        },
        body: json.encode(body),
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> parsedResponse = json.decode(response.body);
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
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Text(
            'مساعدي الذكي',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Cario',
              color: Colors.white,
              fontSize: 24, //  تغيير هذه القيمة لتكون الحجم
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  Color(0xFF698EFF),
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
            Color(0xFF698EFF),
            Color(0xFF00CCFF),
          ], begin: Alignment.topLeft, end: Alignment.bottomRight),
        ),
        child: Column(
          children: <Widget>[
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
                    Color(0xFF698EFF),
                    Color(0xFF00CCFF),
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
                      style: const TextStyle(color: Colors.indigo),
                      controller: _textEditingController,
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.all(10.0),
                        hintText: 'مرحبا.....',
                        hintTextDirection: TextDirection.rtl,
                        border: InputBorder.none,
                      ),
                      textDirection:
                          TextDirection.rtl, // تحديد اتجاه النص للغة عربية
                    ),
                  ),
                  IconButton(
                    onPressed: onSendMessage,
                    icon: const Icon(
                      Icons.rocket_launch,
                      color: Colors.indigo,
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
}

class Message {
  final String text;
  final bool isMe;
  Message({required this.text, required this.isMe});
}
