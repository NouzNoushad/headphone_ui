import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'earphone_home.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const EarphoneHome(),
    );
  }
}
