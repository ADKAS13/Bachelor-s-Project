import 'package:flutter/material.dart';

import '../pagelayout.dart';

class Question1 extends StatelessWidget {
  const Question1({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(

      body: Padding(
        padding: EdgeInsets.all(32.0),
        child: PageLayout(pageTitle: 'Question 1', nextPage: '/2'),
      )
    );
  }
}
