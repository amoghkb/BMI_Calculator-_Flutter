import 'package:flutter/material.dart';

void main() => runApp(Amogh());

class Amogh extends StatefulWidget {
  const Amogh({super.key});

  @override
  State<Amogh> createState() => _AmoghState();
}

class _AmoghState extends State<Amogh> {
  TextEditingController ammu1 = TextEditingController();
  TextEditingController ammu2 = TextEditingController();

  double? one;
  double? two;
  String? results;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'BMI Calculator',
            style: TextStyle(
                fontSize: 29,
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontFamily: 'newpop'),
          ),
          elevation: 11,
          centerTitle: true,
          backgroundColor: Colors.brown,
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 380,
                  height: 500,
                  child: Card(
                    color: Colors.white30,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 50, left: 20, right: 20, bottom: 5),
                      child: Column(
                        children: [
                          TextField(
                            keyboardType: TextInputType.number,
                            controller: ammu1,
                            decoration: InputDecoration(
                                labelText: "Enter Your Height In Ft",
                                labelStyle: TextStyle(color: Colors.brown),
                                prefixIcon: Icon(Icons.height),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.brown),
                                    borderRadius: BorderRadius.circular(20)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.brown),
                                    borderRadius: BorderRadius.circular(20))),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextField(
                            keyboardType: TextInputType.number,
                            controller: ammu2,
                            decoration: InputDecoration(
                                labelText: "Enter Your Weight In KGs",
                                labelStyle: TextStyle(color: Colors.brown),
                                prefixIcon: Icon(Icons.sell_rounded),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.brown),
                                    borderRadius: BorderRadius.circular(20)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.brown),
                                    borderRadius: BorderRadius.circular(20))),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  // Parse input values
                                  one = double.tryParse(ammu1.text);
                                  two = double.tryParse(ammu2.text);

                                  if (one != null && two != null) {
                                    double finalsheight =
                                        0.3048 * one!; // Convert ft to meters
                                    double total =
                                        two! / (finalsheight * finalsheight);

                                    // Determine BMI category
                                    if (total < 18.5) {
                                      results = 'Underweight';
                                    } else if (total >= 18.5 && total <= 24.9) {
                                      results = 'Normal weight';
                                    } else if (total >= 25 && total <= 29.9) {
                                      results = 'Overweight';
                                    } else if (total >= 30) {
                                      results = 'Obesity';
                                    } else {
                                      results = 'Invalid BMI';
                                    }
                                  } else {
                                    results = 'Invalid input';
                                  }
                                });
                              },
                              child: Text(
                                "        Click Here to Check Your BMI        ",
                                style: TextStyle(color: Colors.brown),
                              ),
                              style: ButtonStyle(
                                  elevation: MaterialStateProperty.all(4))),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            results != null ? "$results" : "",
                            style: TextStyle(fontSize: 22, color: Colors.brown),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 60,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
