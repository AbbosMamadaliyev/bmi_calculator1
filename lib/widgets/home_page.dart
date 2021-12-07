// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:bmi_calculator/models/operation.dart';
import 'package:bmi_calculator/models/person.dart';
import 'package:flutter/material.dart';

import 'info_dialog_widget.dart';
import 'male_or_female.dart';
import 'weight_and_height.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final weightController = TextEditingController();
  var heightController = TextEditingController();

  var weight = 1;
  var height = 1;

  double bmiIndex = 0;

  SnackBar errorText = SnackBar(
    content: Text('Iltimos, maydonlarga e\'tiborli bo\'ling!'),
    backgroundColor: Colors.red,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(context),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 4),
        child: SingleChildScrollView(
          child: Column(
            children: [
              MaleOrFemale(),
              SizedBox(height: 50),
              WeightAndHeight(
                  weightController: weightController,
                  heightController: heightController),
              SizedBox(height: 80),
              buildCalculateButton(context),
            ],
          ),
        ),
      ),
    );
  }

  SizedBox buildCalculateButton(BuildContext context) {
    return SizedBox(
      height: 60,
      width: 300,
      child: ElevatedButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
        onPressed: () {
          if (weightController.text.trim().isNotEmpty &&
              heightController.text.trim().isNotEmpty &&
              heightController.text != 0.toString() &&
              weightController.text != 0.toString()) {
            showResult();
          } else {
            ScaffoldMessenger.of(context).showSnackBar(errorText);
          }
        },
        child: Text(
          'Calculate your BMI',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      title: const Text(
        'BMI Calculate',
        style: TextStyle(
            color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
      ),
      actions: [
        InfoDialogWidget(),
      ],
    );
  }

  Future<void> showResult() async {
    weight = int.parse(weightController.text);
    height = int.parse(heightController.text);
    Person person = Person(weight, height);
    Calculate calculate = Calculate(person);

    bmiIndex = calculate.calc();

    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            title: Text(
              'Your BMI index',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                    bmiIndex.toStringAsFixed(2),
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 28,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    calculate.text(),
                    style: TextStyle(color: Colors.black),
                  ),
                  SizedBox(height: 5),
                  TextButton(
                    onPressed: () {
                      heightController.clear();
                      weightController.clear();
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      'Qayta hisoblash',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
