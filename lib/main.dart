import 'package:flutter/material.dart';
import 'package:uicapstone/matchpage.dart';

import 'experiment_matchpage.dart';

void main() {
  runApp(const MaterialApp(
      home: MatchPage(),
    debugShowCheckedModeBanner:false,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height*0.3,),
              Center(
                child: Image.asset(
                  'assets/img.png',
                ),
              ),
              SizedBox(height: 30,),
              SizedBox(
                width: MediaQuery.of(context).size.width*0.5,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const MatchPage()),
                      );
                    },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue.withOpacity(0.6)),
                  child: Text('Start'),
                ),
              )
            ],
          ),
      ),
    );
  }
}
