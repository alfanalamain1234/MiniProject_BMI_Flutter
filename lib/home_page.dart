import 'dart:math';
import 'package:bmi_calculator/hasil_page.dart';
import 'package:bmi_calculator/height_provider.dart';
import 'package:bmi_calculator/weight_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key});

  @override
  Widget build(BuildContext context) {
    var heightProvider = Provider.of<HeightProvider>(context);
    var weightProvider = Provider.of<WeightProvider>(context);
    double bmi = weightProvider.weight / pow(heightProvider.height / 100, 2);

    String bmiStatus = "";
    if (bmi < 18.5) {
      bmiStatus = "Berat badan kurang";
    } else if (bmi >= 18.5 && bmi < 25) {
      bmiStatus = "Normal";
    } else if (bmi >= 25 && bmi < 30) {
      bmiStatus = "Kegemukan";
    } else {
      bmiStatus = "Gendut";
    }

    return Scaffold(
      body: Container(
        child: DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.blue, Colors.purple],
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'BMI CALCULATOR',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Image.asset(
                  'assets/images/icon_body.png',
                  height: 150,
                  width: 150,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Weight (kg)',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
                Slider(
                  min: 1,
                  max: 100,
                  divisions: 100,
                  label: weightProvider.weight.round().toString(),
                  value: weightProvider.weight,
                  activeColor: Colors.pink,
                  inactiveColor: Colors.pink.withOpacity(0.2),
                  onChanged: (newValue) {
                    newValue = newValue.roundToDouble();
                    print('weight: $newValue');
                    weightProvider.weight = newValue;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Height (cm)',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
                Slider(
                  min: 1,
                  max: 200,
                  divisions: 200,
                  label: heightProvider.height.round().toString(),
                  value: heightProvider.height,
                  onChanged: (newValue) {
                    newValue = newValue.roundToDouble();
                    print('Height: $newValue');
                    heightProvider.height = newValue;
                  },
                ),
                SizedBox(
                  height: 50,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HasilPage(
                          bmi: bmi,
                          bmiStatus: bmiStatus,
                        ),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.amber,
                    onPrimary: Colors.white,
                    elevation: 5,
                    padding: EdgeInsets.symmetric(
                      horizontal: 50,
                      vertical: 15,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Text(
                    'Submit',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
