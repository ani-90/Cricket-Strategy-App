import 'package:flutter/material.dart';


class ScoreContainer extends StatefulWidget {
  const ScoreContainer({super.key});

  @override
  State<ScoreContainer> createState() => _ScoreContainerState();
}

class _ScoreContainerState extends State<ScoreContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      
      child:  Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Column(
          children: [
            Row(
              children: [
              Image.asset('assets/windies.png',width: 40,),
              const SizedBox(width: 5,),
              const Text('WI',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
              const SizedBox(width: 60,),
              const Text('300 & 193',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),)
            ],),
            const SizedBox(height: 20,),
            Row(children: [
              Image.asset('assets/aussie.jpeg',width: 40,),
              const SizedBox(width: 5,),
              const Text('AUS',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
              const SizedBox(width: 50,),
              const Text('289/9 d & 207',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),)
            ],),

          ],
        ),
      ),
    );
  }
}
