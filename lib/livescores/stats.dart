import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';
import 'package:uicapstone/chat%20interface/simplestats.dart';
import 'package:wagon_wheel/models/ball.dart';
import 'package:wagon_wheel/wagon_wheel.dart';

import '../styles/AppStyles.dart';

class WagonWheelExample extends StatefulWidget {
  const WagonWheelExample({Key? key}) : super(key: key);

  @override
  State<WagonWheelExample> createState() => _WagonWheelExampleState();
}

class _WagonWheelExampleState extends State<WagonWheelExample> {
  List<Ball> balls = [];

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < 12; i++) {
      balls.add(
        Ball(
          angle: (16 * i).toDouble(),
          runs: i % 4 == 0 ? 4 : 6,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          floatingActionButton: SizedBox(
            width: 60,
            height: 60,
            child: FloatingActionButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>SimpleStats()));
              },
              backgroundColor: Colors.blue,
              elevation: 30,
              child: Icon(Icons.arrow_forward),

            ),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
          body: Container(
            width: double.infinity,
            height:double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Scaffold(
                body: Column(
                  children: [
                    const Row(
                      children: [
                        Text(
                          'Best Performances',
                          style: AppStyles.blackBold24,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const Row(
                      children: [
                        Text(
                          'Batters',
                          style: AppStyles.blackBold24,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.17,
                      width: MediaQuery.of(context).size.width,
                      child: const Row(
                        children: [
                          Column(
                            children: [
                              CircleAvatar(
                                backgroundImage: NetworkImage(
                                    'https://img1.hscicdn.com/image/upload/f_auto,t_h_100_2x/lsci/db/PICTURES/CMS/309500/309571.1.jpg'),
                                maxRadius: 60,
                              )
                            ],
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "SPD Smith",
                                    style: AppStyles.blackBold24,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    '(Aus)',
                                    style: AppStyles.blackRegular20,
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    ' 91* ',
                                    style: AppStyles.blackBold20,
                                  ),
                                  Text(
                                    ' (146)',
                                    style: AppStyles.blackRegular20,
                                  ),
                                  SizedBox(width: 10,),
                                  Text('9 fours ',style: AppStyles.blackRegular14,),
                                  Icon(Icons.circle,size: 10,color: Colors.grey,),
                                  Text(' 1 Six ',style: AppStyles.blackRegular14,),

                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    WagonWheel(
                      balls: balls,
                      fourColor: Colors.blue,
                      sixColor: Colors.yellow,
                      background: Stack(
                        children: [
                          Container(
                            color: Colors.green,
                            width: MediaQuery.of(context).size.width
                          ),
                          Center(
                            child: Container(
                              width: 10,
                              height: 60,
                              color: Colors.amberAccent,
                            ),
                          ),
                        ],
                      ),
                    ),















                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
