import 'package:flutter/material.dart';

import '../pagelayout.dart';

class Question2 extends StatelessWidget {
  const Question2({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.all(32),
        child: PageLayout(pageTitle: 'Question 2', nextPage: '',)
      ),
    );
  }
}
