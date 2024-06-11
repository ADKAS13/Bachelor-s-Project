import 'dart:math';

import 'package:bachelors_project/pages/main.dart';
import 'package:bachelors_project/questions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_code_editor/flutter_code_editor.dart';
import 'package:highlight/languages/java.dart';

import '../pagelayout.dart';



class Question6 extends StatelessWidget {
  const Question6({super.key});

  @override
  Widget build(BuildContext context) {
    final int rng = Random().nextInt(staticQuestions.length);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            children: [
              PageLayout(
                controller: controllers[5],
                question: questions[5],
                questionNumber: 6,
                nextPage: '/final',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
