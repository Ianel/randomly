import 'dart:math';

import 'package:flutter/material.dart';

class RandomNumberPage extends StatefulWidget {
  const RandomNumberPage({
    super.key,
    required this.minimumNumber,
    required this.maximumNumber,
  });

  final int minimumNumber;
  final int maximumNumber;

  @override
  State<RandomNumberPage> createState() => _RandomNumberPageState();
}

class _RandomNumberPageState extends State<RandomNumberPage> {
  int number = 0;

  int generateRandomNumber({required int minNumber, required int maxNumber}) {
    int max = maxNumber;
    int min = minNumber;
    int seed = Random().nextInt(max);
    int randomNumber = seed >= min ? seed : seed + min;
    return randomNumber;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Random Number")),
      body: Center(
        child: Text(
          "$number",
          style: const TextStyle(fontSize: 32, fontWeight: FontWeight.w700),
        ),
      ),
      floatingActionButton: ElevatedButton(
        onPressed: () {
          setState(() {
            number = generateRandomNumber(
                maxNumber: widget.maximumNumber,
                minNumber: widget.minimumNumber);
          });
        },
        style: ElevatedButton.styleFrom(minimumSize: const Size(80, 48)),
        child: const Text("Generate"),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
