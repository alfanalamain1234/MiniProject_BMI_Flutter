import 'package:bmi_calculator/height_provider.dart';
import 'package:bmi_calculator/weight_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<HeightProvider>(
          create: (context) => HeightProvider(),
        ),
        ChangeNotifierProvider<WeightProvider>(
          create: (context) => WeightProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );

    // return ChangeNotifierProvider<WeightProvider>(
    //   create: (context) => WeightProvider(),
    //   child: ChangeNotifierProvider<HeightProvider>(
    //     create: (context) => HeightProvider(),
    //     child: MaterialApp(
    //       debugShowCheckedModeBanner: false,
    // //       home: HomePage(),
    //     ),
    //   ),
    // );
  }
}
