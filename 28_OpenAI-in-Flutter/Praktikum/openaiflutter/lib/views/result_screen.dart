import 'package:openaiflutter/models/open_ai.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final GPTData gptResponseData;
  const ResultScreen({super.key, required this.gptResponseData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("AI Results"),
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(67, 176, 255, 1),
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "AI Smartphone Recommendation:",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                gptResponseData.choices[0].text,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}