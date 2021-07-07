
import 'package:basicverification/pages/signup.dart';
import 'package:flutter/material.dart';

void main() async {
 

  runApp(MyApp());
}
class MyApp extends StatefulWidget {
  

  @override
  __MyAppStateState createState() => __MyAppStateState();
}

class __MyAppStateState extends State<MyApp> {
  
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        home: SignUpPage(),
    );
  }
}

