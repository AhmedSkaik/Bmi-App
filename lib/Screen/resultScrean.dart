import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({Key? key , required this.isMale , required this.result , required this.Age}) : super(key: key);
  final double result;
  final bool isMale;
  final int Age;

  String get ResultPhrase {
    String resultText = "";
    if (result >= 30) {
      resultText = "Obese";
    } else if (result > 25 && result < 30) {
      resultText = "Over Weight";
    } else if (result > 20 && result < 25) {
      resultText = "Normal";
    } else if (result > 15 && result < 20) {
      resultText = "Under Weight";
    } else {
      resultText = "Thin";
    }

    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.teal,
          title: const Text(
            "Result",
            style: TextStyle(fontSize: 28),
          ),
        ),
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("Gender:  ${isMale ? "Male" : "Female"}",
                    style: Theme.of(context).textTheme.displayMedium),
                Text("Result:  ${result.toStringAsFixed(2)}",
                    style: Theme.of(context).textTheme.displayMedium),
                Text("Healthiness:  $ResultPhrase",
                    style: Theme.of(context).textTheme.displayMedium),
                Text("Age:  $Age",
                    style: Theme.of(context).textTheme.displayMedium),
              ],
            ),
          ),
        ));
  }
}
