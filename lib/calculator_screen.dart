import 'package:flutter/material.dart';
import 'result_screen.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  final TextEditingController _controller = TextEditingController();

  void _convertCurrency() {
    double? usdAmount = double.tryParse(_controller.text);
    if (usdAmount != null) {
      double bdtAmount = usdAmount * 121.0; // Conversion rate: 1 USD = 121 BDT
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              ResultScreen(usdAmount: usdAmount, bdtAmount: bdtAmount),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please enter a valid number")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("USD to BDT Converter")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Enter Amount in USD", style: TextStyle(fontSize: 18)),
            TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: "Enter amount"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _convertCurrency,
              child: const Text("Convert"),
            ),
          ],
        ),
      ),
    );
  }
}
