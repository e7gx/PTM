import 'dart:ui';

import 'package:first_time/controller/routes/it_or_user.dart';
import 'package:first_time/generated/l10n.dart';
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
      globalBackgroundColor:
          Colors.teal, //! Background Color Ask Me Time aboute the Colors
      // showDoneButton: true,
      allowImplicitScrolling: true,
      autoScrollDuration: 6500,
      infiniteAutoScroll: true,
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
            backgroundColor: Colors.teal, //! Set the background color to cyan
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.zero, // Set border radius to zero
            ),
          ),
          child: Text(
            S.of(context).first,
            style: const TextStyle(
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
          title: S.of(context).aboutUs,
          body: S.of(context).aboutUsDescription,
          image: Lottie.asset(
            'assets/animation/reportGreen.json',
            fit: BoxFit.cover,
          ),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: S.of(context).whatWeOffer,
          body: S.of(context).whatWeOfferDescription,
          image: Lottie.asset(
            'assets/animation/userLog.json',
            fit: BoxFit.cover,
          ),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: S.of(context).howItWillAffect,
          body: S.of(context).howItWillAffectDescription,
          image: Lottie.asset(
            'assets/animation/reportGreen.json',
            fit: BoxFit.fitWidth,
          ),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: S.of(context).facilityInventory,
          body: S.of(context).facilityInventoryDescription,
          image: Lottie.asset(
            'assets/animation/green.json',
            fit: BoxFit.fitWidth,
          ),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: S.of(context).betterCommunication,
          body: S.of(context).howItWillAffectDescription,
          image: Lottie.asset(
            'assets/animation/green.json',
            fit: BoxFit.fitWidth,
          ),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: S.of(context).login,
          body: S.of(context).loginDescription,
          image: Lottie.asset(
            'assets/animation/userLog.json',
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
        color: Colors.teal,
      ),
      skip: Text(
        S.of(context).Skip,
        style: const TextStyle(
            fontFamily: 'Cario',
            fontWeight: FontWeight.w600,
            color: Colors.tealAccent),
      ),
      next: const Icon(
        Icons.rocket_launch_rounded,
        color: Colors.tealAccent,
      ),
      done: Text(
        S.of(context).Okay,
        style: const TextStyle(
            fontFamily: 'Cario',
            fontWeight: FontWeight.w600,
            color: Colors.tealAccent),
      ),
      curve: Curves.fastLinearToSlowEaseIn,
      controlsMargin: const EdgeInsets.all(16),
      controlsPadding: kIsWeb
          ? const EdgeInsets.all(12.0)
          : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Colors.teal,
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
          side:
              BorderSide(color: Colors.black), // Set the border color to orange
        ),
        activeColor: Colors.tealAccent, // Set the active color to orange
      ),

      dotsContainerDecorator: const ShapeDecoration(
        color: Colors.black87,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          side: BorderSide(color: Colors.tealAccent), //حواف
        ),
      ),
    );
  }

  Stack afterAfectSTACK() {
    return Stack(
      children: [
        Lottie.asset(
          'assets/animation/afterAfect.json',
          fit: BoxFit.fill,
          height: double.infinity,
          width: double.infinity,
        ),
        Lottie.asset(
          'assets/animation/green.json',
          fit: BoxFit.fill,
          height: MediaQuery.sizeOf(context).height,
          width: MediaQuery.sizeOf(context).width,
        ),
        Positioned.fill(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 40, sigmaY: 30),
            child: const SizedBox(),
          ),
        ),
      ],
    );
  }
}
