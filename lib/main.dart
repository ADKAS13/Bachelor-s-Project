import 'dart:math';

import 'package:bachelors_project/firebase_options.dart';
import 'package:bachelors_project/questions.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import './pages/pages.dart';

// var ID = Random().nextInt(2147483647);
List<TextEditingController> controllers = [
  TextEditingController(),
  TextEditingController(),
  TextEditingController(),
  TextEditingController(),
  TextEditingController(),
  TextEditingController(),
  TextEditingController(),
];

final questions = <Question>[];
bool isDynamic = false;
final correctlyAnswered = <int>[];

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

void setQuestions() {
  questions.clear();
  var numQuestions = 7;
  Question newQuestion;
  if (isDynamic) {
    // for (var i = 0; i < 4; i++) {
    // var i = 2;
    // questions.add(staticQuestions.last);
    // questions.add(dynamicQuestions.last);
    var i = 0;
    while (i < numQuestions) {
      if (i < numQuestions * 0.7) {
        newQuestion = dynamicQuestions
            .elementAt(Random().nextInt(dynamicQuestions.length));
        if (!questions.contains(newQuestion)) {
          questions.add(newQuestion);
          i++;
        }
      } else {
        newQuestion =
            staticQuestions.elementAt(Random().nextInt(staticQuestions.length));
        if (!questions.contains(newQuestion)) {
          questions.add(newQuestion);
          i++;
        }
      }
    }
  } else {
    var i = 0;
    while (i < numQuestions) {
      if (i < numQuestions * 0.7) {
        newQuestion =
            staticQuestions.elementAt(Random().nextInt(staticQuestions.length));
        if (!questions.contains(newQuestion)) {
          questions.add(newQuestion);
          i++;
        }
      } else {
        newQuestion = dynamicQuestions
            .elementAt(Random().nextInt(dynamicQuestions.length));
        if (!questions.contains(newQuestion)) {
          questions.add(newQuestion);
          i++;
        }
      }
    }
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: './',
      title: "Bachelor's Project Quiz",
      routes: {
        '/': (context) => const MainPage(),
        '/1': (context) => const Question1(),
        '/2': (context) => const Question2(),
        '/3': (context) => const Question3(),
        '/4': (context) => const Question4(),
        '/5': (context) => const Question5(),
        '/6': (context) => const Question6(),
        '/7': (context) => const Question7(),
        '/final': (context) => const FinalPage(),
        '/thankyou': (context) => const ThankYouPage(),
      },
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text("Coding Quiz Natural Language",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 100,
                  fontWeight: FontWeight.bold)),
          Padding(
            padding: const EdgeInsets.only(top: 100.0),
            child: ButtonTheme(
              minWidth: 200,
              height: 100,
              child: SizedBox(
                child: ElevatedButton(
                    child: const Text("Start Quiz"),
                    onPressed: () {
                      setQuestions();
                      Navigator.pushNamed(context, '/1');
                    }),
              ),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          const Text(
            "Dynamic questions?",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Checkbox(
            value: isDynamic,
            onChanged: (bool? newValue) {
              setState(() {
                if (isDynamic == false) {
                  isDynamic = true;
                } else {
                  isDynamic = false;
                }
              });
            },
          ),
        ],
      ),
    ));
  }
}
