import 'package:flutter/material.dart';
import 'package:flutter_application_2/widgets/animated_indicator.dart';
import 'package:flutter_svg/flutter_svg.dart';

const blue = Color.fromARGB(255, 97, 98, 95);
const kTitleStyle = TextStyle(
  fontSize: 30,
  color: Color(0xFF01002f),
  fontWeight: FontWeight.bold,
);
const kSubtitleStyle =
    TextStyle(fontSize: 22, color: Color.fromARGB(255, 11, 11, 11));

void main() {
  runApp(MyApp());
}

// ignore: use_key_in_widget_constructors
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: MainPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  PageController pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [
                Color(0xffFE612C),
                Color(0xffFF872C),
                Color(0xffFFA12C),
              ],
              stops: [
                0.0,
                0.5,
                0.9
              ],
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              tileMode: TileMode.repeated),
        ),
        child: PageView(
            controller: pageController,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              Slide(
                  hero: Image.asset("./assets/guy.png"),
                  title: "Heat up your Soul",
                  subtitle:
                      "Get Access to unlimited songs just in one click,listen to your favourite album/singer only on FLAME",
                  onNext: nextPage),
              Slide(
                  hero: Image.asset("./assets/girl.png"),
                  title: "No Advertisement",
                  subtitle:
                      "Listen to the uninterupted music anytime,anywhere.Just open it and play it",
                  onNext: nextPage),
              Slide(
                  hero: Image.asset("./assets/indian.png"),
                  title: "Voice Assistant",
                  subtitle:
                      "No worries when Alan's there to assist,so just speak and enjoy the beat",
                  onNext: nextPage),
              Scaffold(
                  body: Container(
                // ignore: prefer_const_constructors
                decoration: BoxDecoration(
                    // ignore: prefer_const_constructors, prefer_const_literals_to_create_immutables
                    gradient: LinearGradient(
                        colors: const [Colors.orange, Colors.yellow])),
                // ignore: prefer_const_constructors
                child: Center(
                  child: const Text(
                    "Let's Get Started",
                    style: kTitleStyle,
                  ),
                ),
              ))
            ]),
      ),
    ));
  }

  void nextPage() {
    pageController.nextPage(
        duration: const Duration(milliseconds: 200), curve: Curves.ease);
  }
}

class Slide extends StatelessWidget {
  final Widget hero;
  final String title;
  final String subtitle;
  final VoidCallback onNext;

  const Slide(
      {Key? key,
      required this.hero,
      required this.title,
      required this.subtitle,
      required this.onNext})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(child: hero),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Text(
                title,
                style: kTitleStyle,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                subtitle,
                style: kSubtitleStyle,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 35,
              ),
              ProgressButton(onNext: onNext),
            ],
          ),
        ),
        GestureDetector(
          onTap: onNext,
          child: const Text(
            "Skip",
            style: kSubtitleStyle,
          ),
        ),
        const SizedBox(
          height: 4,
        )
      ],
    );
  }
}

class ProgressButton extends StatelessWidget {
  final VoidCallback onNext;
  const ProgressButton({Key? key, required this.onNext}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 75,
      height: 75,
      child: Stack(children: [
        AnimatedIndicator(
          duration: const Duration(seconds: 10),
          size: 75,
          callback: onNext,
        ),
        Center(
          child: GestureDetector(
            child: Container(
              height: 60,
              width: 60,
              child: Center(
                child: SvgPicture.asset(
                  "./assets/arrow.svg",
                  width: 10,
                ),
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(99), color: blue),
            ),
            onTap: onNext,
          ),
        )
      ]),
    );
  }
}
