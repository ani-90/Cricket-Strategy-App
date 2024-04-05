import 'package:flutter/material.dart';
import 'package:uicapstone/score_container.dart';
import 'package:uicapstone/scorecard.dart';

class Team1FirstInnings extends StatefulWidget {
  const Team1FirstInnings({super.key});

  @override
  State<Team1FirstInnings> createState() => _Team1FirstInningsState();
}

class _Team1FirstInningsState extends State<Team1FirstInnings> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.6,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            const Center(child: ScoreContainer()),
            const SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(color: Colors.grey.withOpacity(0.1)),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'BATTING',
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
            ),
           const  BattingI1(),
            const BowlerHeader(),
          ],
        ),
      ),
    );
  }
}

class BattingI1 extends StatelessWidget {
  const BattingI1({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.2,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 11,
          itemBuilder: (context, index) {
            return const Row(
              children: [
                Text('K Brathwaite',
                    style:
                        TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),
                SizedBox(
                  width: 7,
                ),
                // Text(
                //   'c Carey, b Cummins',
                //   style: TextStyle(fontSize: 8),
                // ),
                SizedBox(
                  width: 90,
                ),
                Text('4', style: TextStyle(fontSize: 10)),
                SizedBox(
                  width: 40,
                ),
                Text('25', style: TextStyle(fontSize: 10)),
                SizedBox(
                  width: 40,
                ),
                Text('0', style: TextStyle(fontSize: 10)),
                SizedBox(
                  width: 50,
                ),
                Text('0', style: TextStyle(fontSize: 10)),
                SizedBox(
                  width: 40,
                ),
                Text('16.00', style: TextStyle(fontSize: 10))
              ],
            );
          }),
    );
  }
}

class BowlerHeader extends StatelessWidget {
  const BowlerHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.13,
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(color: Colors.grey.withOpacity(0.1)),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'BOWLING',
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
            ),
            BowlingI1()
          ],
        ),
      ),
    );
  }
}

class BowlingI1 extends StatelessWidget {
  const BowlingI1({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.1,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 11,
          itemBuilder: (context, index) {
            return const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Mitchell Starc',
                    style:
                        TextStyle(fontSize: 11, fontWeight: FontWeight.bold)),
                SizedBox(width: 5),
                Text('24',
                    style:
                        TextStyle(fontSize: 10, fontWeight: FontWeight.normal)),
                Text('3', style: TextStyle(fontSize: 10)),
                Text('82', style: TextStyle(fontSize: 10)),
                Text('4', style: TextStyle(fontSize: 10)),
                Text(
                  '3.41',
                  style: TextStyle(fontSize: 10),
                )
              ],
            );
          }),
    );
  }
}
