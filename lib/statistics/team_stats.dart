import 'package:flutter/material.dart';

import '../styles/AppStyles.dart';

class TeamStandings extends StatefulWidget {
  const TeamStandings({super.key});

  @override
  State<TeamStandings> createState() => _TeamStandingsState();
}

class _TeamStandingsState extends State<TeamStandings> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Team Standings',
            style: AppStyles.blackBold16,
          ),
        ),
        body: Column(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Rank',
                  style: AppStyles.blackBold16,
                ),
                Text(
                  'Team',
                  style: AppStyles.blackBold16,
                ),
                Text('Score', style: AppStyles.blackBold16)
              ],
            ),
            const Divider(thickness: 2,color: Colors.grey,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text(
                  '1',
                  style: AppStyles.blackBold16,
                ),
                Row(
                  children: [
                    Image.asset(
                      'assets/newzealand.png',
                      width: 30,
                    ),
                    const Text(
                      'New Zealand',
                      style: AppStyles.blackBold16,
                    ),

                  ],
                ),

                const Text('66.66', style: AppStyles.blackBold16)
              ],
            ),
            const Divider(thickness: 2,color: Colors.grey,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text(
                  '2',
                  style: AppStyles.blackBold16,
                ),
                Row(
                  children: [
                    Image.asset(
                      'assets/aussie.jpeg',
                      width: 30,
                    ),
                    const Text(
                      'Australia',
                      style: AppStyles.blackBold16,
                    ),
                  ],
                ),

                const Text('55.0', style: AppStyles.blackBold16)
              ],
            ),
            const Divider(thickness: 2,color: Colors.grey,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text(
                  '3',
                  style: AppStyles.blackBold16,
                ),
                Row(
                  children: [
                    Image.asset(
                      'assets/india.jpg',
                      width: 30,
                    ),
                    const Text(
                      'India',
                      style: AppStyles.blackBold16,
                    ),
                  ],
                ),

                const Text('52.77', style: AppStyles.blackBold16)
              ],
            ),
            const Divider(thickness: 2,color: Colors.grey,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text(
                  '4',
                  style: AppStyles.blackBold16,
                ),
                Row(
                  children: [
                    Image.asset(
                      'assets/bangladesh.jpg',
                      width: 30,
                    ),
                    const Text(
                      'Bangladesh',
                      style: AppStyles.blackBold16,
                    ),
                  ],
                ),

                const Text('50.0', style: AppStyles.blackBold16)
              ],
            ),
            const Divider(thickness: 2,color: Colors.grey,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text(
                  '5',
                  style: AppStyles.blackBold16,
                ),
                Row(
                  children: [
                    Image.asset(
                      'assets/pakistan.jpg',
                      width: 30,
                    ),
                    const Text(
                      'Pakistan',
                      style: AppStyles.blackBold16,
                    ),
                  ],
                ),

                const Text('36.66', style: AppStyles.blackBold16)
              ],
            ),
            const Divider(thickness: 2,color: Colors.grey,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text(
                  '5',
                  style: AppStyles.blackBold16,
                ),
                Row(
                  children: [
                    Image.asset(
                      'assets/westindies.png',
                      width: 30,
                    ),
                    const Text(
                      'West Indies',
                      style: AppStyles.blackBold16,
                    ),
                  ],
                ),

                const Text('33.33', style: AppStyles.blackBold16)
              ],
            ),
            const Divider(thickness: 2,color: Colors.grey,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text(
                  '6',
                  style: AppStyles.blackBold16,
                ),
                Row(
                  children: [
                    Image.asset(
                      'assets/southafrica.png',
                      width: 30,
                    ),
                    const Text(
                      'South Africa',
                      style: AppStyles.blackBold16,
                    ),
                  ],
                ),

                const Text('33.33', style: AppStyles.blackBold16)
              ],
            ),
            const Divider(thickness: 2,color: Colors.grey,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text(
                  '7',
                  style: AppStyles.blackBold16,
                ),
                Row(
                  children: [
                    Image.asset(
                      'assets/england.png',
                      width: 30,
                    ),
                    const Text(
                      'England',
                      style: AppStyles.blackBold16,
                    ),
                  ],
                ),

                const Text('25.0', style: AppStyles.blackBold16)
              ],
            ),
            const Divider(thickness: 2,color: Colors.grey,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text(
                  '8',
                  style: AppStyles.blackBold16,
                ),
                Row(
                  children: [
                    Image.asset(
                      'assets/srilanka.png',
                      width: 30,
                    ),
                    const Text(
                      'Sri Lanka',
                      style: AppStyles.blackBold16,
                    ),
                  ],
                ),

                const Text('0.0', style: AppStyles.blackBold16)
              ],
            )
          ],
        ),
      ),
    );
  }
}
