import 'package:flutter/material.dart';

class SlideWidget extends StatelessWidget {
  final String image;
  final String title;
  final String content;

  const SlideWidget({
    super.key,
    required this.image,
    required this.title,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: const EdgeInsets.all(40),
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25.0), // إضافة BorderRadius هنا
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            image,
            width: 250,
            height: 150,
          ),
          const SizedBox(height: 30),
          Text(
            title,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            content,
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}

class SlideData {
  final String image;
  final String title;
  final String content;

  SlideData({
    required this.image,
    required this.title,
    required this.content,
  });
}
