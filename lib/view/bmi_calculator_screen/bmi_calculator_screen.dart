// ignore_for_file: prefer_const_constructors, sort_child_properties_last, avoid_print, unused_local_variable, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class BmiCalculatorScreen extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final heightController = useTextEditingController();
    final weightController = useTextEditingController();
    final bmiResult = useState<String?>(null);
    final bmiColor = useState<Color>(Colors.black);

    void calculateBMI() {
      final height = double.tryParse(heightController.text);
      final weight = double.tryParse(weightController.text);
      if (height != null && weight != null && height > 0) {
        final bmi = weight / (height * height);
        bmiResult.value = bmi.toStringAsFixed(2);

        if (bmi < 18.5) {
          bmiColor.value = Colors.blue; // Underweight
        } else if (bmi >= 18.5 && bmi <= 24.9) {
          bmiColor.value = Colors.green; // Normal
        } else {
          bmiColor.value = Colors.red; // Overweight
        }
      } else {
        bmiResult.value = 'Invalid input';
        bmiColor.value = Colors.black;
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: heightController,
              decoration: InputDecoration(
                labelText: 'Height (m)',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.numberWithOptions(decimal: true),
            ),
            SizedBox(height: 16),
            TextField(
              controller: weightController,
              decoration: InputDecoration(
                labelText: 'Weight (kg)',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.numberWithOptions(decimal: true),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: calculateBMI,
              child: Text('Calculate BMI'),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.teal,
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              ),
            ),
            SizedBox(height: 16),
            if (bmiResult.value != null)
              Text(
                'Your BMI: ${bmiResult.value}',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: bmiColor.value,
                ),
              ),
            SizedBox(
              height: 200,
            ),
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all()),
                  height: 30,
                  width: 30,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Under Weight",
                  style: TextStyle(
                      decoration: TextDecoration.underline,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all()),
                  height: 30,
                  width: 30,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Normal Weight",
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all()),
                  height: 30,
                  width: 30,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Over Weight",
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
