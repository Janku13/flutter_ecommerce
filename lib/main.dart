import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/src/screens/base/base_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.green,
          scaffoldBackgroundColor: const Color.fromARGB(255, 231, 229, 229)),
      debugShowCheckedModeBanner: false,
      home: const SafeArea(
        // child: BaseScreen(),
        child: BaseScreen(),
      ),
    );
  }
}
