import 'package:first_time/controller/routes/it_or_user.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:lottie/lottie.dart';
// import 'package:first_time/Auth/login_page.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  OnBoardingPageState createState() => OnBoardingPageState();
}

class OnBoardingPageState extends State<OnBoardingPage> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => const ItOrUser()),
    );
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 20.0);

    const pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(fontSize: 35.0, fontWeight: FontWeight.bold),
      bodyTextStyle: bodyStyle,
      titlePadding: EdgeInsets.only(top: 50),
      bodyPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 20),
      imagePadding: EdgeInsets.only(top: 20),
    );

    return IntroductionScreen(
      allowImplicitScrolling: true,
      autoScrollDuration: 6500,
      infiniteAutoScroll: false,
      globalHeader: const Align(
        alignment: Alignment.center,
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(top: 0, right: 0),
          ),
        ),
      ),
      globalFooter: SizedBox(
        width: double.infinity,
        height: 60,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.cyan, // Set the background color to cyan
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.zero, // Set border radius to zero
            ),
          ),
          child: const Text(
            'هيا بنا لتجربة مختلفة',
            style: TextStyle(
                fontFamily: 'Cario',
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Colors.white),
          ),
          onPressed: () => _onIntroEnd(context),
        ),
      ),

      pages: [
        PageViewModel(
          title: " من نحن؟",
          body: "نحن طلاب من جامعة ام القرى و نهدف لمساعدة المنشات عبر تطبيقنا",
          image: Lottie.asset(
            'assets/animation/ppmana.json',
            fit: BoxFit.cover,
          ),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: " ماذا سنضيف؟ ",
          body:
              " يبسط إدارة مؤسستك ويزيد من كفائتها مع واجهة سهلة وأدوات متطورة لتحسين الأداء وتوفير الكثير من الوقت",
          image: Lottie.asset(
            'assets/animation/aichat.json',
            fit: BoxFit.cover,
          ),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "كيف سيؤثر؟",
          body:
              "  يعزز التواصل والتعاون،وايضا يساعد في اتخاذ قرارات أفضل، ويزيد من الكفاءة في إدارة مؤسستك بشكل افضل",
          image: Lottie.asset(
            'assets/animation/data.json',
            fit: BoxFit.fitWidth,
          ),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "جرد أجهزة المنشاة؟",
          body:
              "  جرد الأجهزة يسهل توثيق وتتبع أجهزة مؤسستك لتحقيق إدارة فعّالة و خدمة افضل للعميل وصيانة سهلة",
          image: Lottie.asset(
            'assets/animation/p2p.json',
            fit: BoxFit.fitWidth,
          ),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "!تواصل افضل ",
          body:
              "تواصل يجمع بين مزايا التواصل الفعّال وسهولة الاستخدام لتحسين التفاهم وتنسيق الجهود لزيادة الانتاجية  ",
          image: Lottie.asset(
            'assets/animation/reportsman.json',
            fit: BoxFit.fitWidth,
          ),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "تسجيل الدخول  ",
          body:
              "سجّل دخولك إلى التطبيق  للاستفادة من التواصل الجيد ومزايا إدارة الممتلكات التقنية",
          image: Lottie.asset(
            'assets/animation/signup1.json',
            fit: BoxFit.contain,
          ),
          decoration: pageDecoration,
        ),
      ],
      onDone: () => _onIntroEnd(context),
      onSkip: () => _onIntroEnd(context), // You can override onSkip callback
      showSkipButton: true,
      skipOrBackFlex: 0,
      nextFlex: 0,
      showBackButton: false,
      //rtl: true, // Display as right-to-left
      back: const Icon(
        Icons.rocket_launch_rounded,
        color: Colors.cyan,
      ),
      skip: const Text(
        'تخطي',
        style: TextStyle(
            fontFamily: 'Cario',
            fontWeight: FontWeight.w600,
            color: Colors.cyan),
      ),
      next: const Icon(
        Icons.rocket_launch_rounded,
        color: Colors.cyan,
      ),
      done: const Text(
        'حسنا',
        style: TextStyle(
            fontFamily: 'Cario',
            fontWeight: FontWeight.w600,
            color: Colors.cyan),
      ),
      curve: Curves.fastLinearToSlowEaseIn,
      controlsMargin: const EdgeInsets.all(16),
      controlsPadding: kIsWeb
          ? const EdgeInsets.all(12.0)
          : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Colors.cyan,
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
          side:
              BorderSide(color: Colors.cyan), // Set the border color to orange
        ),
        activeColor: Colors.cyan, // Set the active color to orange
      ),

      dotsContainerDecorator: const ShapeDecoration(
        color: Colors.black87,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          side: BorderSide(color: Colors.cyan), //حواف
        ),
      ),
    );
  }
}
