import 'package:flutter/material.dart';
import 'package:uicapstone/score_container.dart';

class LiveScore extends StatefulWidget {
  const LiveScore({super.key});

  @override
  State<LiveScore> createState() => _LiveScoreState();
}
class _LiveScoreState extends State<LiveScore> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(30)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 20,),
          const ScoreContainer(),
          const SizedBox(height: 20,),
          Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 30,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.1),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'BATTERS',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.grey),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'R',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.grey),
                    ),
                    Text(
                      'B',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.grey),
                    ),
                    Text(
                      '4s',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.grey),
                    ),
                    Text(
                      '6s',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.grey),
                    ),
                    Text(
                      'Sr',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.grey),
                    )
                  ],
                ),
              )
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height*0.1,
            child:  const Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: [
                    Text(
                          'Joshua Da Silva ',
                          style: TextStyle(color: Colors.black,fontSize: 15),
                        ),
                    Text(
                      '17 ',
                      style: TextStyle(color: Colors.black,fontSize: 15),
                    ),
                    Text(
                      '31',
                      style: TextStyle(color: Colors.black,fontSize: 15),
                    ),
                    Text(
                      '3',
                      style: TextStyle(color: Colors.black,fontSize: 15),
                    ),
                    Text(
                      '1',
                      style: TextStyle(color: Colors.black,fontSize: 15),
                    ),
                    Text(
                      '57.88',
                      style: TextStyle(color: Colors.black,fontSize: 15),
                    ),
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: [
                    Text(
                      'Tag Chanderpaul',
                      style: TextStyle(color: Colors.black,fontSize: 15),
                    ),
                    Text(
                      '44',
                      style: TextStyle(color: Colors.black,fontSize: 15),
                    ),
                    Text(
                      '108',
                      style: TextStyle(color: Colors.black,fontSize: 15),
                    ),
                    Text(
                      '3',
                      style: TextStyle(color: Colors.black,fontSize: 15),
                    ),
                    Text(
                      '1',
                      style: TextStyle(color: Colors.black,fontSize: 15),
                    ),
                    Text(
                      '57.88',
                      style: TextStyle(color: Colors.black,fontSize: 15),
                    ),
                  ],
                ),
              ],
            ),
          ),

          Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 30,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.1),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'BOWLERS',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.grey),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'O',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.grey),
                    ),
                    Text(
                      'M',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.grey),
                    ),
                    Text(
                      'R',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.grey),
                    ),
                    Text(
                      'W',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.grey),
                    ),
                    Text(
                      'E',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.grey),
                    )
                  ],
                ),
              )
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height*0.1,
            child:  const Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: [
                    Text(
                      'Nathan Lyon  ',
                      style: TextStyle(color: Colors.black,fontSize: 15),
                    ),
                    Text(
                      '2.5',
                      style: TextStyle(color: Colors.black,fontSize: 15),
                    ),
                    Text(
                      '0',
                      style: TextStyle(color: Colors.black,fontSize: 15),
                    ),
                    Text(
                      '4',
                      style: TextStyle(color: Colors.black,fontSize: 15),
                    ),
                    Text(
                      '1',
                      style: TextStyle(color: Colors.black,fontSize: 15),
                    ),
                    Text(
                      '1.41',
                      style: TextStyle(color: Colors.black,fontSize: 15),
                    ),
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: [
                    Text(
                      'Mitchell Starc ',
                      style: TextStyle(color: Colors.black,fontSize: 15),
                    ),
                    Text(
                      '2.5',
                      style: TextStyle(color: Colors.black,fontSize: 15),
                    ),
                    Text(
                      '0',
                      style: TextStyle(color: Colors.black,fontSize: 15),
                    ),
                    Text(
                      '4',
                      style: TextStyle(color: Colors.black,fontSize: 15),
                    ),
                    Text(
                      '1',
                      style: TextStyle(color: Colors.black,fontSize: 15),
                    ),
                    Text(
                      '1.41',
                      style: TextStyle(color: Colors.black,fontSize: 15),
                    ),
                  ],
                ),

              ],
            ),
          ),

        ],
      ),
    );
  }
}
