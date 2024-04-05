import 'package:flutter/material.dart';
import 'package:uicapstone/livescores/detailed_scorecard.dart';
import 'package:uicapstone/livescores/live.dart';

import 'livescores/stats.dart';

class ScoreCard extends StatelessWidget {
  const ScoreCard({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text(
            'Aus vs WI',
            style: TextStyle(
                color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
          ),
          bottom: const TabBar(
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white60,
            tabs: [
              Tab(
                text: 'Live',
              ),
              Tab(
                text: 'Scorecard',
              ),
              Tab(
                text: 'Stats',
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [LiveScore(), DetailedScoreCard(), WagonWheelExample()],
        ),
      ),
    );
  }
}
