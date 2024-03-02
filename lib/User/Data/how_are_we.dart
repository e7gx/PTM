import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';

class HowAreWe extends StatelessWidget {
  const HowAreWe({super.key});

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
        title: const Text('طرق التواصل'),
        centerTitle: true,
        titleTextStyle: const TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
            fontFamily: 'Cario'),
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
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.black,
              Colors.teal,
              Colors.black,
            ],
            begin: Alignment.topRight,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Lottie.asset('assets/animation/Whatsapp.json',
                fit: BoxFit.fitWidth, height: 400),
            const Divider(
              color: Colors.white,
            ),
            ListTile(
              leading: const Icon(
                Icons.mark_email_read_rounded,
                color: Colors.tealAccent,
              ),
              title: const Text(
                'الايميل',
                style: TextStyle(
                    fontFamily: 'Cario',
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              trailing: const Text(
                'abalgabo@gmail.com',
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Colors.tealAccent,
                  fontSize: 18,
                ),
              ),
              onTap: () async {
                await launchUrl(Uri.parse('https://github.com/e7gx'));
              },
            ),
            const Divider(
              height: 2,
              color: Colors.white,
            ),
            ListTile(
              leading: const Icon(
                Icons.call,
                color: Colors.tealAccent,
              ),
              title: const Text(
                'أتصال',
                style: TextStyle(
                    fontFamily: 'Cario',
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              trailing: const Text(
                '+966549970539',
                textAlign: TextAlign.left,
                style: TextStyle(color: Colors.tealAccent, fontSize: 18),
              ),
              onTap: () {},
            ),
            const Divider(
              color: Colors.white,
            ),
            ListTile(
              leading: const Icon(
                Icons.bookmark_add_rounded,
                color: Colors.tealAccent,
              ),
              title: const Text(
                'تويتر',
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Cario',
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              trailing: const Text(
                '@ PTM ',
                textAlign: TextAlign.left,
                style: TextStyle(color: Colors.tealAccent, fontSize: 18),
              ),
              onTap: () async {
                await launchUrl(Uri.parse('https://twitter.com/abdu_algh'));
              },
            ),
            const Divider(
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}

class TextS extends StatelessWidget {
  const TextS(this.text, {super.key});

  final String text;

  @override
  Widget build(context) {
    return Text(
      text,
      textAlign: TextAlign.left,
      style: const TextStyle(
        fontSize: 20,
        fontStyle: FontStyle.normal,
        color: Colors.black54,
        fontWeight: FontWeight.w600,
        // fontFamily: AutofillHints.middleName,
      ),
    );
  }
}
