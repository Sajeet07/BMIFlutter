import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var wghtcontroller = TextEditingController();
  var ftcontroller = TextEditingController();
  var inchcontroller = TextEditingController();
  var result = ''; //it us used for set state
  var bgColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: const Text('YourBMI'),
          ),
          body: Container(
            color: bgColor,
            child: Center(
              child: Container(
                width: 300,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'BMI',
                      style:
                          TextStyle(fontSize: 34, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 21,
                    ),
                    TextField(
                      controller: wghtcontroller,
                      decoration: InputDecoration(
                          label: Text('Enter your weight (in kgs)'),
                          prefixIcon: Icon(Icons.line_weight)),
                      keyboardType: TextInputType.number,
                    ),
                    SizedBox(
                      height: 11,
                    ),
                    TextField(
                      controller: ftcontroller,
                      decoration: InputDecoration(
                          label: Text('Enter your height (in feet)'),
                          prefixIcon: Icon(Icons.height)),
                      keyboardType: TextInputType.number,
                    ),
                    SizedBox(
                      height: 11,
                    ),
                    TextField(
                      controller: inchcontroller,
                      decoration: InputDecoration(
                          label: Text('Enter your Height(in inch)'),
                          prefixIcon: Icon(Icons.height)),
                      keyboardType: TextInputType.number,
                    ),
                    SizedBox(
                      height: 11,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          var wght = wghtcontroller.text.toString();
                          var ft = ftcontroller.text.toString();
                          var inch = inchcontroller.text.toString();

                          if (wght != "" && ft != "" && inch != "") {
                            //BMI CALCULATION
                            var iwght = int.parse(wght); //var integerwght = ---
                            var ift = int.parse(ft);
                            var iinch = int.parse(inch);

                            var tinch =
                                (ift * 12) * iinch; // var totalinch = ---
                            var tcm = tinch * 2.54;
                            var tm = tcm / 100; //var total meter = --

                            var bmi = iwght / (tm * tm);
                            var msg =
                                ''; // declaring msg variable to use in conditional stmt
                            if (bmi > 25) {
                              msg = 'You are Overweight.Need to go GYM';
                              bgColor = Colors.red;
                            } else if (bmi < 18) {
                              msg =
                                  'You are underweight.Need to eat more balanced diet food';
                              bgColor = Colors.yellow;
                            } else {
                              msg = 'You are Healthy.Keep it up';

                              bgColor = Colors.green;
                            }
                            setState(() {
                              result =
                                  '$msg \n Your BMI is ${bmi.toStringAsFixed(2)}';
                            });
                          } else {
                            setState(() {
                              result = 'Please fill all the required details';
                            });
                          }
                        },
                        child: Text('Calculate')),
                    SizedBox(height: 11),
                    Text(
                      result,
                      style: TextStyle(fontSize: 19),
                    ) //calling result
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
