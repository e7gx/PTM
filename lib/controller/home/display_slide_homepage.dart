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
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Card(
          color: Colors.white,
          elevation: 6,
          shadowColor: Colors.cyan,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0), // إضافة BorderRadius هنا
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 10.0, left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Image.asset(
                      image,
                      width: 90,
                      height: 90,
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 50.0, right: 50, top: 50),
                      child: Center(
                        child: Text(
                          title,
                          style: const TextStyle(
                            fontFamily: 'Cario',
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 5),

                // const SizedBox(height: 4),
                Row(
                  children: [
                    Expanded(
                      child: Center(
                        child: Text(
                          content,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontFamily: 'Cario',
                            color: Colors.black,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
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

//!/HOME PAGE CARD NUMBER TWO IN THE SCREEN 22222222222222222222222222222222222222222222222222222222222222222222222222222222
class SlideWidgetTwo extends StatelessWidget {
  final String image;
  final String title;
  // final String content;

  const SlideWidgetTwo({
    super.key,
    required this.image,
    required this.title,
    // required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Card(
          color: Colors.white,
          elevation: 6,
          shadowColor: Colors.cyan,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0), // إضافة BorderRadius هنا
          ),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10, top: 10),
                    child: Image.asset(
                      image,
                      height: 90,
                      width: 90,
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Center(
                    child: Text(
                      textAlign: TextAlign.right,
                      title,
                      style: const TextStyle(
                        fontFamily: 'Cario',
                        fontSize: 28,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    // Text(
                    //   // content,
                    //   style: const TextStyle(
                    //     fontFamily: 'Cario',
                    //     fontSize: 15,
                    //   ),
                    // ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SlideDatas {
  final String image;
  final String title;
  // final String content;

  SlideDatas({
    required this.image,
    required this.title,
    // required this.content,
  });
}

//! 3333333333333333333333333333333333333333333333333333333333333333333333333
class SlideWidgetThree extends StatelessWidget {
  final String image;
  final String title;
  // final String content;

  const SlideWidgetThree({
    super.key,
    required this.image,
    required this.title,
    // required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Card(
          color: Colors.white,
          elevation: 6,
          shadowColor: Colors.cyan,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0), // إضافة BorderRadius هنا
          ),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10, top: 10),
                    child: Image.asset(
                      image,
                      height: 90,
                      width: 90,
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Center(
                    child: Text(
                      textAlign: TextAlign.right,
                      title,
                      style: const TextStyle(
                        fontFamily: 'Cario',
                        fontSize: 28,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    // Text(
                    //   // content,
                    //   style: const TextStyle(
                    //     fontFamily: 'Cario',
                    //     fontSize: 15,
                    //   ),
                    // ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SlideDatas3 {
  final String image;
  final String title;
  // final String content;

  SlideDatas3({
    required this.image,
    required this.title,
    // required this.content,
  });
}
