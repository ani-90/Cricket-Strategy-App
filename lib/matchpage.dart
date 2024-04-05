// import 'dart:convert';
//
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';
// import 'package:uicapstone/scorecard.dart';
// import 'package:uicapstone/statistics/batting_stats.dart';
// import 'package:uicapstone/statistics/bowling_stats.dart';
// import 'package:uicapstone/statistics/team_stats.dart';
// import 'package:uicapstone/styles/AppStyles.dart';
// import 'package:http/http.dart';
// import 'classes/meta_data.dart';
// import 'livescores/stats.dart';
// import 'package:http/http.dart' as http;
// import 'package:html/dom.dart' as dom;
//
// class MatchPage extends StatefulWidget {
//   const MatchPage({super.key});
//
//   @override
//   State<MatchPage> createState() => _MatchPageState();
// }
//
// class _MatchPageState extends State<MatchPage> {
//   List<MatchInfo> matches = [];
//   @override
//   void initState() {
//     super.initState();
//     getScoreSlider();
//   }
//
//   Future getScoreSlider() async {
//
//     //await Future.delayed(Duration(seconds: 3));
//     final url=Uri.parse('https://api.cricapi.com/v1/currentMatches?apikey=5861d245-db56-4f75-bb02-54d8502aca0a&offset=0');
//     final response=await http.get(url);
//     var json = jsonDecode(response.body);
//
//     var jsonMatchesData = json['data'];
//
//     for (var x in jsonMatchesData) {
//       MatchInfo match = MatchInfo(
//         x['name'],
//         x['matchTitle'],
//         x['matchType'],
//         x['teamInfo'][0]['shortname'],
//         x['teamInfo'][1]['shortname'],
//         x['teamInfo'][0]['img'],
//         x['teamInfo'][1]['img'],
//         x['score'].length > 0 ? x['score'][0]['r'] : "0",
//         x['score'].length > 0 ? x['score'][0]['w'] : "0",
//         x['score'].length > 0 ? x['score'][0]['o'] : "0.0",
//         x['score'].length == 2 ? x['score'][1]['r'] : "0",
//         x['score'].length == 2 ? x['score'][1]['w'] : "0",
//         x['score'].length == 2 ? x['score'][1]['o'] : "0.0",
//         x['status'],
//
//       );
//       matches.add(match);
//     }
//
//     print(matches);
//     return matches;
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return   MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: SafeArea(
//         child: Scaffold(
//           backgroundColor: Colors.white,
//           body: SingleChildScrollView(
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const SizedBox(
//                     height: 40,
//                   ),
//                   const Text(
//                     "Live Scores",
//                     style: AppStyles.blackBold24,
//                   ),
//
//                  CarouselScorecard(matches: matches,),
//                   // CarouselSlider(
//                   //
//                   //     items:  [CarouselScorecard(matches: matches,)],
//                   //     options: CarouselOptions(
//                   //         reverse: false,
//                   //         viewportFraction: 0.8,
//                   //         aspectRatio: 16 / 9,
//                   //         enlargeCenterPage: true,
//                   //         height: 200,
//                   //     ),
//                   // ),
//                   const SizedBox(
//                     height: 40,
//                   ),
//                   const Text(
//                     "Explore Stats",
//                     style: AppStyles.blackBold24,
//                   ),
//                   ExploreStats()
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class CarouselScorecard extends StatefulWidget {
//   final List<MatchInfo> matches;
//   CarouselScorecard({super.key,required this.matches});
//
//   @override
//   State<CarouselScorecard> createState() => _CarouselScorecardState(matches: matches);
// }
//
// class _CarouselScorecardState extends State<CarouselScorecard> {
//   List<MatchInfo> matches;
//
//   _CarouselScorecardState({required this.matches});
//   @override
//   void initState() {
//     super.initState();
//     check();
//
//   }
//
//   void check() {
//     print(matches);
//   }
//
//
//   Widget build(BuildContext context) {
//     return matches.length > 0
//         ? CarouselSlider.builder(
//
//       itemCount: matches.length,
//       itemBuilder: (BuildContext context, int index,int realIndex) {
//         return ListView.builder(
//           scrollDirection: Axis.horizontal,
//           itemCount: 1, // Only one item per slide
//           itemExtent: 480,
//           shrinkWrap: true,
//           physics: const AlwaysScrollableScrollPhysics(),
//           itemBuilder: (context, _) {
//             return InkWell(
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Container(
//                   alignment: Alignment.center,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(20),
//                     image: const DecorationImage(
//                       fit: BoxFit.fill,
//                       image: AssetImage('assets/adelaide_oval.jpeg'),
//                     ),
//                   ),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: [
//                       const SizedBox(
//                         height: 10,
//                       ),
//                       Text(
//                         '${matches[index].name}',
//                         style: AppStyles.whiteMedium16,
//                       ),
//                       const SizedBox(
//                         height: 30,
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           const SizedBox(
//                             width: 10,
//                           ),
//                           CircleAvatar(
//                             maxRadius: 25,
//                             child: Image.asset('assets/aussie.jpeg'),
//                           ),
//                           Column(
//                             children: [
//                               Text(
//                                 '${matches[index].status}',
//                                 style: AppStyles.whiteMedium14,
//                               ),
//                               Text(
//                                 '${matches[index].runs1}/${matches[index].wickets1} (${matches[index].overs1})',
//                                 style: AppStyles.whiteBold12,
//                               )
//                             ],
//                           ),
//                           CircleAvatar(
//                             maxRadius: 30,
//                             child: Image.asset('assets/windies.png'),
//                           ),
//                           const SizedBox(
//                             width: 10,
//                           )
//                         ],
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => const ScoreCard()),
//                 );
//               },
//             );
//           },
//         );
//       },
//       options: CarouselOptions(
//         height: 400, // Example height of the CarouselSlider
//         enableInfiniteScroll: true, // Example options
//         enlargeCenterPage: true,
//
//       ),
//     )
//         : ListView.builder(
//         itemExtent: 480,
//         scrollDirection: Axis.horizontal,
//       itemCount: 3,
//           itemBuilder: (context,index) {
//             return Center(child: Container(child: CircularProgressIndicator(),));
//           }
//         );
//   }
//
//
// // @override
//   // Widget build(BuildContext context) {
//   //      if(matches.length>0)
//   //        {return ListView.builder(
//   //         scrollDirection: Axis.horizontal,
//   //         itemCount: matches.length,
//   //            itemExtent: 480,
//   //         shrinkWrap: true,
//   //         physics: const AlwaysScrollableScrollPhysics(),
//   //         itemBuilder: (context,index) {
//   //           return InkWell(
//   //             child: Padding(
//   //               padding: const EdgeInsets.all(8.0),
//   //               child: Container(
//   //                   alignment: Alignment.center,
//   //                   decoration: BoxDecoration(
//   //                       borderRadius: BorderRadius.circular(20),
//   //                       image: const DecorationImage(
//   //                           fit: BoxFit.fill,
//   //                           image: AssetImage('assets/adelaide_oval.jpeg'))),
//   //                   child: Column(
//   //                     mainAxisAlignment: MainAxisAlignment.start,
//   //                     children: [
//   //                       const SizedBox(
//   //                         height: 10,
//   //                       ),
//   //                        Text(
//   //                         '${matches[index].name}',
//   //                         style: AppStyles.whiteMedium16,
//   //                       ),
//   //                       const SizedBox(
//   //                         height: 30,
//   //                       ),
//   //                       Row(
//   //                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//   //                         children: [
//   //                           const SizedBox(
//   //                             width: 10,
//   //                           ),
//   //                           CircleAvatar(
//   //                             maxRadius: 25,
//   //                             child: Image.asset('assets/aussie.jpeg'),
//   //                           ),
//   //                            Column(
//   //                             children: [
//   //                               Text(
//   //                                 '${matches[index].status}',
//   //                                 style: AppStyles.whiteMedium14,
//   //                               ),
//   //                               Text(
//   //                                 '${matches[index].runs1}/${matches[index].wickets1} (${matches[index].overs1})',
//   //                                 style: AppStyles.whiteBold12,
//   //                               )
//   //                             ],
//   //                           ),
//   //                           CircleAvatar(
//   //                             maxRadius: 30,
//   //                             child: Image.asset('assets/windies.png'),
//   //                           ),
//   //                           const SizedBox(
//   //                             width: 10,
//   //                           )
//   //                         ],
//   //                       )
//   //                     ],
//   //                   )),
//   //             ),
//   //             onTap: () {
//   //               Navigator.push(context,
//   //                   MaterialPageRoute(builder: (context) => const ScoreCard()));
//   //             },
//   //           );
//   //         }
//   //                );}
//   //      return Center(child: CircularProgressIndicator());
//   //
//   // }
// }
//
// class ExploreStats extends StatelessWidget {
//   const ExploreStats({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: [
//             InkWell(
//               child: Container(
//                   width: 150,
//                   height: 150,
//                   alignment: Alignment.center,
//                   decoration: BoxDecoration(
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.grey.withOpacity(0.6),
//                           spreadRadius: 3,
//                           blurRadius: 7,
//                           offset: Offset(0, 3), // changes position of shadow
//                         ),
//                       ],
//                       borderRadius: BorderRadius.circular(20),
//                       image: const DecorationImage(
//                           fit: BoxFit.fill,
//                           image: AssetImage('assets/batting.jpg'))),
//                   child: const Column(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: [
//                       Text(
//                         'Batting',
//                         style: AppStyles.whiteBold16,
//                       )
//                     ],
//                   )),
//               onTap: () {
//                 Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                         builder: (context) => const BattingStats()));
//               },
//             ),
//             InkWell(
//               child: Container(
//                   width: 150,
//                   height: 150,
//                   alignment: Alignment.bottomCenter,
//                   decoration: BoxDecoration(
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.grey.withOpacity(0.6),
//                           spreadRadius: 3,
//                           blurRadius: 7,
//                           offset: Offset(0, 3), // changes position of shadow
//                         ),
//                       ],
//                       borderRadius: BorderRadius.circular(20),
//                       image: const DecorationImage(
//                           fit: BoxFit.fill,
//                           image: AssetImage('assets/bowling.jpeg'))),
//                   child: const Column(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: [
//                       Text(
//                         'Bowling',
//                         style: AppStyles.whiteBold16,
//                       )
//                     ],
//                   )),
//               onTap: () {
//                 Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                         builder: (context) => const BowlingStats()));
//               },
//             )
//           ],
//         ),
//         const SizedBox(
//           height: 30,
//         ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: [
//             InkWell(
//               child: Container(
//                   width: 150,
//                   height: 150,
//                   alignment: Alignment.center,
//                   decoration: BoxDecoration(
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.grey.withOpacity(0.6),
//                           spreadRadius: 3,
//                           blurRadius: 7,
//                           offset: Offset(0, 3), // changes position of shadow
//                         ),
//                       ],
//                       borderRadius: BorderRadius.circular(20),
//                       image: const DecorationImage(
//                           fit: BoxFit.fill,
//                           image: AssetImage('assets/teams.jpeg'))),
//                   child: const Column(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: [
//                       Text(
//                         'ICC Teams',
//                         style: AppStyles.whiteBold16,
//                       )
//                     ],
//                   )),
//               // onTap: () {
//               //   Navigator.push(context,
//               //       MaterialPageRoute(builder: (context) => const TeamStandings()));
//               // },
//             )
//           ],
//         ),
//       ],
//     );
//   }
// }
