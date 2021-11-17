import 'package:flutter/material.dart';

class WeightAndHeight extends StatelessWidget {
  const WeightAndHeight({
    Key? key,
    required this.weightController,
    required this.heightController,
  }) : super(key: key);

  final TextEditingController weightController;
  final TextEditingController heightController;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: [
            RichText(
              text: TextSpan(children: [
                TextSpan(
                  text: 'Your weight ',
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
                TextSpan(
                  text: '(kg)',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                )
              ]),
            ),
            SizedBox(height: 12),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(left: 20, right: 5),
              height: 70,
              width: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(color: Colors.black12, blurRadius: 15),
                ],
              ),
              child: Align(
                alignment: Alignment.center,
                child: TextField(
                  maxLength: 3,
                  controller: weightController,
                  keyboardType: TextInputType.number,
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                  decoration: InputDecoration(
                      counterText: '',
                      border: InputBorder.none,
                      hintText: 'Weight',
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 15)),
                ),
              ),
            )
          ],
        ),
        SizedBox(width: 12),
        Column(
          children: [
            RichText(
              text: TextSpan(children: [
                TextSpan(
                  text: 'Your height ',
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
                TextSpan(
                  text: '(sm)',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                )
              ]),
            ),
            SizedBox(height: 12),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(left: 20, right: 5),
              height: 70,
              width: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(color: Colors.black12, blurRadius: 15),
                ],
              ),
              child: Align(
                alignment: Alignment.center,
                child: TextField(
                  maxLength: 3,
                  controller: heightController,
                  keyboardType: TextInputType.number,
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                  decoration: InputDecoration(
                      counterText: '',
                      border: InputBorder.none,
                      hintText: 'Height',
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 15)),
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
