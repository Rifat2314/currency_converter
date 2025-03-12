import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final double usdAmount;
  final double bdtAmount;

  const ResultScreen(
      {super.key, required this.usdAmount, required this.bdtAmount});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Converted Amount")),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.blue.shade200,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            "$usdAmount USD = Tk $bdtAmount",
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
