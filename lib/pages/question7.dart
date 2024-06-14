import 'package:bachelors_project/main.dart';
import 'package:flutter/material.dart';

import '../pagelayout.dart';

class Question7 extends StatelessWidget {
  const Question7({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            children: [
              PageLayout(
                controller: controllers[6],
                question: questions[6],
                questionNumber: 7,
                nextPage: '/final',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
