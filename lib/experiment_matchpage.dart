import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:uicapstone/chat%20interface/flask_code_qa.dart';
import 'package:uicapstone/scorecard.dart';
import 'package:uicapstone/statistics/batting_stats.dart';
import 'package:uicapstone/statistics/bowling_stats.dart';
import 'package:uicapstone/statistics/team_stats.dart';
import 'package:uicapstone/styles/AppStyles.dart';
import 'package:http/http.dart';
import 'classes/meta_data.dart';
import 'livescores/stats.dart';
import 'package:http/http.dart' as http;
import 'package:html/dom.dart' as dom;

class MatchPage extends StatefulWidget {
  const MatchPage({Key? key}) : super(key: key);

  @override
  State<MatchPage> createState() => _MatchPageState();
}

class _MatchPageState extends State<MatchPage> {
  List<MatchInfo> matches = [];

  @override
  void initState() {
    super.initState();
    getScoreSlider();
  }

  Future<List<MatchInfo>> getScoreSlider() async {
    final url = Uri.parse('https://api.cricapi.com/v1/currentMatches?apikey=5861d245-db56-4f75-bb02-54d8502aca0a&offset=0');
    final response = await http.get(url);
    var json = jsonDecode(response.body);

    var jsonMatchesData = json['data'];
    List<MatchInfo> matches = [];

    for (var x in jsonMatchesData) {
      MatchInfo match = MatchInfo(
        x['name'],
        x['matchTitle'],
        x['matchType'],
        x['teamInfo'][0]['shortname'],
        x['teamInfo'][1]['shortname'],
        x['teamInfo'][0]['img'],
        x['teamInfo'][1]['img'],
        x['score'].length > 0 ? x['score'][0]['r'] : "0",
        x['score'].length > 0 ? x['score'][0]['w'] : "0",
        x['score'].length > 0 ? x['score'][0]['o'] : "0.0",
        x['score'].length == 2 ? x['score'][1]['r'] : "0",
        x['score'].length == 2 ? x['score'][1]['w'] : "0",
        x['score'].length == 2 ? x['score'][1]['o'] : "0.0",
        x['status'],
      );
      matches.add(match);
    }

    print(matches);
    return matches;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 40,
              ),
              const Text(
                "Live Scores",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
              ),
              CarouselScorecard(),
              const SizedBox(
                height: 40,
              ),
              const Text(
                "Explore Stats",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
              ),
              ExploreStats(),
            ],
          ),
        ),
      ),
    );
  }
}

class CarouselScorecard extends StatefulWidget {
  const CarouselScorecard({Key? key}) : super(key: key);

  @override
  State<CarouselScorecard> createState() => _CarouselScorecardState();
}

class _CarouselScorecardState extends State<CarouselScorecard> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<MatchInfo>>(
        future: getScoreSlider(),
    builder: (context, snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
    return const Center(child: CircularProgressIndicator());
    } else if (snapshot.hasError) {
    return Center(child: Text('Error: ${snapshot.error}'));
    } else {
    List<MatchInfo>? matches= snapshot.data;

    return matches != null && matches.isNotEmpty
        ? CarouselSlider.builder(
      itemCount: matches.length,
      itemBuilder: (BuildContext context, int index, int realIndex) {
        return ListView.builder(

          scrollDirection: Axis.horizontal,
          itemCount: 1, // Only one item per slide
          itemExtent: 630,
          shrinkWrap: false,
          physics: ClampingScrollPhysics(),
          // physics: NeverScrollableScrollPhysics(),
          //physics: const AlwaysScrollableScrollPhysics(),
          itemBuilder: (context, _) {
            return InkWell(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 700,
                  width: MediaQuery.of(context).size.width,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: const DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage('assets/adelaide_oval.jpeg'),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        '${matches![index].name}',
                        style: const TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const SizedBox(
                            width: 10,
                          ),
                          CircleAvatar(
                            maxRadius: 25,
                            child: Image.asset('assets/aussie.jpeg'),
                          ),
                          Column(

                            children: [

                              Row(
                                children: [
                                  Text('${matches![index].team1}  ',style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold)),
                                  Text(
                                    '${matches![index].runs1}/${matches![index].wickets1} (${matches![index].overs1})',
                                    style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              SizedBox(height: 15,),
                              Row(
                                children: [
                                  Text('${matches![index].team2}  ',style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold)),

                                  Text(
                                    '${matches![index].runs2}/${matches![index].wickets2} (${matches![index].overs2})',
                                    style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              SizedBox(height: 25,),
                              Text(
                                '${matches![index].status}',
                                style: const TextStyle(color: Colors.white, fontSize: 14),
                              ),
                            ],
                          ),
                          CircleAvatar(
                            maxRadius: 30,
                            child: Image.asset('assets/windies.png'),
                          ),
                          const SizedBox(
                            width: 10,
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  QuestionAnswerPage()),
                );
              },
            );
          },
        );
      },
      options: CarouselOptions(
        aspectRatio: 16/9,
        height: 200, // Example height of the CarouselSlider
        enableInfiniteScroll: true, // Example options
        enlargeCenterPage: true,
      ),
    )
        : ListView.builder(
      itemExtent: 480,
      scrollDirection: Axis.horizontal,
      itemCount: 3,
      itemBuilder: (context, index) {
        return Center(child: CircularProgressIndicator());
      },
    );
    }
    },
    );
  }

  Future<List<MatchInfo>> getScoreSlider() async {
    final url = Uri.parse('https://api.cricapi.com/v1/currentMatches?apikey=5861d245-db56-4f75-bb02-54d8502aca0a&offset=0');
    final response = await http.get(url);
    var json = jsonDecode(response.body);

    var jsonMatchesData = json['data'];
    List<MatchInfo> matches = [];

    for (var x in jsonMatchesData) {
      MatchInfo match = MatchInfo(
        x['name'],
        x['matchTitle'],
        x['matchType'],
        x['teamInfo'][0]['shortname'],
        x['teamInfo'][1]['shortname'],
        x['teamInfo'][0]['img'],
        x['teamInfo'][1]['img'],
        x['score'].length > 0 ? x['score'][0]['r'] : "0",
        x['score'].length > 0 ? x['score'][0]['w'] : "0",
        x['score'].length > 0 ? x['score'][0]['o'] : "0.0",
        x['score'].length == 2 ? x['score'][1]['r'] : "0",
        x['score'].length == 2 ? x['score'][1]['w'] : "0",
        x['score'].length == 2 ? x['score'][1]['o'] : "0.0",
        x['status'],
      );
      matches.add(match);
    }

    print(matches);
    return matches;
  }
}

class ExploreStats extends StatelessWidget {
  const ExploreStats({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
              child: Container(
                  width: 150,
                  height: 150,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.6),
                          spreadRadius: 3,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                      borderRadius: BorderRadius.circular(20),
                      image: const DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage('assets/batting.jpg'))),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Batting',
                        style: AppStyles.whiteBold16,
                      )
                    ],
                  )),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const BattingStats()));
              },
            ),
            InkWell(
              child: Container(
                  width: 150,
                  height: 150,
                  alignment: Alignment.bottomCenter,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.6),
                          spreadRadius: 3,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                      borderRadius: BorderRadius.circular(20),
                      image: const DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage('assets/bowling.jpeg'))),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Bowling',
                        style: AppStyles.whiteBold16,
                      )
                    ],
                  )),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const BowlingStats()));
              },
            )
          ],
        ),
        const SizedBox(
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
              child: Container(
                  width: 150,
                  height: 150,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.6),
                          spreadRadius: 3,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                      borderRadius: BorderRadius.circular(20),
                      image: const DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage('assets/teams.jpeg'))),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'ICC Teams',
                        style: AppStyles.whiteBold16,
                      )
                    ],
                  )),
              // onTap: () {
              //   Navigator.push(context,
              //       MaterialPageRoute(builder: (context) => const TeamStandings()));
              // },
            )
          ],
        ),
      ],
    );
  }
}
