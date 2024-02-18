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
          elevation: 10,
          shadowColor: Colors.cyan,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0), // إضافة BorderRadius هنا
          ),
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  image,
                  width: 100,
                  height: 50,
                ),
                const SizedBox(height: 5),
                Center(
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontFamily: 'Cario',
                      color: Colors.black,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 4),
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
                            fontSize: 16,
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

//!/22222222222222222222222222222222222222222222222222222222222222222222222222222222
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
          elevation: 8,
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
                      height: 50,
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(50.0),
                child: Center(
                  child: Text(
                    textAlign: TextAlign.right,
                    title,
                    style: const TextStyle(
                      fontFamily: 'Cario',
                      fontSize: 33,
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
// class SlideData3 extends StatelessWidget {
//   final String image;
//   final String title;
//   final String content;

//   const SlideData3({
//     super.key,
//     required this.image,
//     required this.title,
//     required this.content,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Padding(
//         padding: const EdgeInsets.all(6.0),
//         child: Card(
//           color: Colors.white,
//           elevation: 4,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(25.0), // إضافة BorderRadius هنا
//           ),
//           child: Padding(
//             padding: const EdgeInsets.all(2.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 Image.asset(
//                   image,
//                   width: 100,
//                   height: 50,
//                 ),
//                 const SizedBox(height: 5),
//                 Center(
//                   child: Text(
//                     title,
//                     style: const TextStyle(
//                       fontFamily: 'Cario',
//                       color: Colors.black,
//                       fontSize: 28,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 4),
//                 Row(
//                   children: [
//                     Expanded(
//                       child: Center(
//                         child: Text(
//                           content,
//                           textAlign: TextAlign.center,
//                           style: const TextStyle(
//                             fontFamily: 'Cario',
//                             color: Colors.black,
//                             fontSize: 16,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class SlideData3E {
//   final String image;
//   final String title;
//   final String content;

//   SlideData3E({
//     required this.image,
//     required this.title,
//     required this.content,
//   });
// }
