import 'dart:math';

import 'package:bmi_app/Screen/resultScrean.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isMale = true;
  int age = 18;
  int weight = 55;
  double Height = 170;

  @override
  Widget build(BuildContext context) {
    var resultt = weight / pow(Height / 100, 2);
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.teal,
          title: const Text(
            "Body Mass Index",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
        ),
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    children: [
                      m1Expanded(context, "male"),
                      const SizedBox(
                        width: 10,
                      ),
                      m1Expanded(context, "female"),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.blueGrey
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Height' , style: Theme.of(context).textTheme.bodyMedium,),
                        SizedBox(height: 15,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text('${Height.toStringAsFixed(2)}' ,  style: Theme.of(context).textTheme.displayLarge ),
                            Text('CM' ,style: Theme.of(context).textTheme.displaySmall,),
                          ],
                        ),
                        Slider(
                            min: 90,
                            max: 220,
                            value: Height,
                            onChanged: (newvalue) {
                              setState(() {
                                Height= newvalue;
                              });
                            })
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    children: [
                      m2Expanded(context, "Age"),
                      const SizedBox(
                        width: 10,
                      ),
                      m2Expanded(context, "Weight"),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                color: Colors.teal,
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 20,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ResultScreen(
                                  Age: age,
                                  isMale: isMale,
                                  result: resultt,
                                )));
                  },
                  child: Text("Calculate",
                      style: Theme.of(context).textTheme.bodyMedium),
                ),
              )
            ],
          ),
        ));
  }

  Expanded m1Expanded(BuildContext context, String type) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            isMale = type == 'male' ? true : false;
          });
        },
        child: Container(
          decoration: BoxDecoration(
              color: isMale && type == "male" || (!isMale && type == "female")
                  ? Colors.teal
                  : Colors.blueGrey,
              borderRadius: BorderRadius.circular(10)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(type == "male" ? Icons.male : Icons.female, size: 90),
              const SizedBox(
                height: 15,
              ),
              Text(type == "male" ? 'Male' : 'Female',
                  style: Theme.of(context).textTheme.bodyMedium)
            ],
          ),
        ),
      ),
    );
  }

  Expanded m2Expanded(BuildContext context, String type) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
            color: Colors.blueGrey, borderRadius: BorderRadius.circular(10)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(type == "Age" ? 'Age' : 'Weight',
                style: Theme.of(context).textTheme.bodyMedium),
            const SizedBox(
              height: 20,
            ),
            Text(type == "Age" ? '$age' : '$weight',
                style: Theme.of(context).textTheme.displayMedium),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      type == "Age" ? ++age : ++weight;
                    });
                  },
                  child: const Icon(
                    Icons.add,
                    size: 24,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      type == "Age" ? --age : --weight;
                    });
                  },
                  child: const Icon(
                    Icons.remove,
                    size: 24,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
