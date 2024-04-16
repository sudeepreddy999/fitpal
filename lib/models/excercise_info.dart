import 'package:fit_pal/models/excercises.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExcerciseInfo extends StatelessWidget {
  const ExcerciseInfo({super.key, required this.excersise});
  final Excersise excersise;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      width: double.infinity,
      child: Padding(
        padding:
            const EdgeInsets.only(top: 10.0, left: 20, right: 20, bottom: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              excersise.name,
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 22,
                fontWeight: FontWeight.w900,
              ),
            ),
            SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(10),
              ),
              width: double.infinity,
              height: 200,
            ),
            SizedBox(height: 20),
            Text(
              'Instructions',
              style: TextStyle(color: Colors.blue, fontSize: 22),
            ),
            SizedBox(height: 10),
            Text(
              excersise.generateInst(),
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              'Focus Area',
              style: TextStyle(color: Colors.blue, fontSize: 22),
            ),
          ],
        ),
      ),
    );
  }
}
