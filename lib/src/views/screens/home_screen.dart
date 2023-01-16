import 'package:flutter/material.dart';
import 'package:hello_world/src/views/screens/random_number_screen.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String? minimumNumber;
  String? maximumNumber;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                "Choose a range of number",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              TextField(
                onChanged: (value) => setState(() {
                  minimumNumber = value;
                }),
                decoration: const InputDecoration(
                  labelText: "Minimum number",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              TextField(
                onChanged: (value) => setState(() {
                  maximumNumber = value;
                }),
                decoration: const InputDecoration(
                  labelText: "Maximum number",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    textStyle: const TextStyle(fontSize: 16),
                    minimumSize: const Size(double.infinity, 64),
                    foregroundColor: Colors.white),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => RandomNumberPage(
                        minimumNumber: int.parse(minimumNumber!),
                        maximumNumber: int.parse(maximumNumber!),
                      ),
                    ),
                  );
                },
                child: const Text("Validate"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
