import 'package:flutter/material.dart';
import 'package:uicapstone/livescores/innings/team1_first_innings.dart';

class DetailedScoreCard extends StatefulWidget {
  const DetailedScoreCard({super.key});

  @override
  State<DetailedScoreCard> createState() => _DetailedScoreCardState();
}

class _DetailedScoreCardState extends State<DetailedScoreCard> {
  bool i1 = true;
  bool i2 = false;
  bool i3 = false;
  bool i4 = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //   children: [
        //     SizedBox(
        //         width: MediaQuery.of(context).size.width * 0.25,
        //         height: MediaQuery.of(context).size.height * 0.04,
        //         child: ElevatedButton(
        //             onPressed: () {
        //               setState(() {
        //                 i1 = true;
        //                 i2 = false;
        //                 i3 = false;
        //                 i4 = false;
        //               });
        //             },
        //             child: const Text(
        //               '1st innings',
        //               style: TextStyle(
        //                   fontSize: 12,
        //                   fontWeight: FontWeight.bold,
        //                   color: Colors.black),
        //             ))),
        //     SizedBox(
        //         width: MediaQuery.of(context).size.width * 0.25,
        //         height: MediaQuery.of(context).size.height * 0.04,
        //         child: ElevatedButton(
        //             onPressed: () {
        //               setState(() {
        //                 i1 = true;
        //                 i2 = false;
        //                 i3 = false;
        //                 i4 = false;
        //               });
        //             },
        //             child: const Text(
        //               '2nd innings',
        //               style: TextStyle(
        //                   fontSize: 12,
        //                   fontWeight: FontWeight.bold,
        //                   color: Colors.black),
        //             ))),
        //     SizedBox(
        //         width: MediaQuery.of(context).size.width * 0.25,
        //         height: MediaQuery.of(context).size.height * 0.04,
        //         child: ElevatedButton(
        //             onPressed: () {
        //               setState(() {
        //                 i1 = true;
        //                 i2 = false;
        //                 i3 = false;
        //                 i4 = false;
        //               });
        //             },
        //             child: const Text(
        //               '3rd innings',
        //               style: TextStyle(
        //                   fontSize: 12,
        //                   fontWeight: FontWeight.bold,
        //                   color: Colors.black),
        //             ))),
        //     SizedBox(
        //         width: MediaQuery.of(context).size.width * 0.25,
        //         height: MediaQuery.of(context).size.height * 0.04,
        //         child: ElevatedButton(
        //             onPressed: () {
        //               setState(() {
        //                 i1 = true;
        //                 i2 = false;
        //                 i3 = false;
        //                 i4 = false;
        //               });
        //             },
        //             child: const Text(
        //               '4th innings',
        //               style: TextStyle(
        //                   fontSize: 12,
        //                   fontWeight: FontWeight.bold,
        //                   color: Colors.black),
        //             ))),
        //
        //
        //
        //   ],
        // ),
         i1 == true ? const Team1FirstInnings() : Container()
      ],
    );
  }
}
