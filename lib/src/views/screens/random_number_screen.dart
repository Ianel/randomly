import 'dart:math';
import 'package:flutter/material.dart';
import 'package:hello_world/src/models/photo_model.dart';
import 'package:hello_world/src/services/photo_service.dart';

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
  PhotoService service = PhotoService();
  String url = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    service.getRandomPhoto().then((value) {
      url = value.imageUrl;
    });
  }

  int generateRandomNumber({required int minNumber, required int maxNumber}) {
    int max = maxNumber;
    int min = minNumber;
    int randomNumber = (Random().nextDouble() * (max - min + 1)).floor() + min;
    return randomNumber;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Random Number")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /*Image(
              image: NetworkImage(url),
            ),*/
            Text(
              "$number",
              style: const TextStyle(fontSize: 32, fontWeight: FontWeight.w700),
            ),
          ],
        ),
      ),
      floatingActionButton: ElevatedButton(
        onPressed: () {
          setState(() {
            number = generateRandomNumber(
              maxNumber: widget.maximumNumber,
              minNumber: widget.minimumNumber,
            );

            service.getRandomPhoto().then((value) {
              url = value.imageUrl;
            });
          });
        },
        style: ElevatedButton.styleFrom(minimumSize: const Size(80, 48)),
        child: const Text("Generate"),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
