import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:html/dom.dart' as dom;
import 'package:uicapstone/chat%20interface/flask_code_qa.dart';
import '../Comparisons/player_comparison.dart';
import '../classes/meta_data.dart';
import '../styles/AppStyles.dart';

class BattingStats extends StatefulWidget {
  const BattingStats({super.key});

  @override
  State<BattingStats> createState() => _BattingStatsState();
}

class _BattingStatsState extends State<BattingStats> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: FloatingActionButton(
          onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>QuestionAnswerPage()));},
          backgroundColor: Colors.indigo,
          child: Icon(Icons.arrow_forward,color: Colors.white,),
        ),
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text(
            'Top Run Scorers',
            style: AppStyles.blackBold24,
          ),
        ),
        body: const Padding(padding: EdgeInsets.all(8.0), child: Batsmen()),
      ),
    );
  }
}

class Batsmen extends StatefulWidget {
  const Batsmen({super.key});

  @override
  State<Batsmen> createState() => _BatsmenState();
}

class _BatsmenState extends State<Batsmen> {
  List<Batsman> batsmen = [];

  bool isfetchingdata = false;

  @override
  void initState() {
    super.initState();
    getBatsmanData();
  }

  Future getBatsmanData() async {
    setState(() {
      isfetchingdata = true;
    });

    final url = Uri.parse(
        'https://cricpulse.in/cricket/icc-world-test-championship-2023-2025-a-complete-list-of-top-run-scorers/');
    final response = await http.get(url);
    dom.Document html = dom.Document.html(response.body);

    var element = html.querySelectorAll('table>tbody')[0];
    var data = element.querySelectorAll('tr');

    setState(() {
      isfetchingdata = false;
    });

    setState(() {
      batsmen = List.generate(
          10,
          (index) => Batsman(
              name: data[index].children[0].text.toString().trim(),
              avg: data[index].children[7].text.toString().trim(),
              runs: data[index].children[5].text.toString().trim(),
              innings: data[index].children[2].text.toString().trim()));
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isfetchingdata == false) {
      return ListView.builder(
          itemCount: batsmen.length,
          itemBuilder: (context, index) {
            return SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.2,
              child: Padding(
                padding: EdgeInsets.only(left: 12.0),
                child: Row(
                  children: [
                    Stack(
                      children: [
                        const CircleAvatar(
                          // backgroundImage: NetworkImage(
                          //     'https://img1.hscicdn.com/image/upload/f_auto,t_ds_square_w_640,q_50/lsci/db/PICTURES/CMS/319700/319716.png'),
                          // maxRadius: 60,
                          backgroundImage: NetworkImage(
                            'https://media.istockphoto.com/id/177491473/photo/cricket-bat-and-ball.jpg?s=612x612&w=0&k=20&c=QqX5lbsHBUi7VZc4yLyeW52LVttKtZQ5e-LXEG-uKMI='
                            // 'https://img1.hscicdn.com/image/upload/f_auto,t_ds_square_w_640,q_50/lsci/db/PICTURES/CMS/319700/319716.png',
                          ),
                          maxRadius: 60,
                        ),
                        // Positioned(
                        //   top: 80,
                        //   left: 70,
                        //   child: Image.asset(
                        //     'assets/aussie.jpeg',
                        //     width: 30,
                        //   ),
                        // )
                      ],
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 35,
                          width: 35,
                        ),
                        Row(
                          children: [
                            Text(
                              '${batsmen[index].name}',
                              style: AppStyles.blackBold20,
                            ),
                          ],
                        ),
                        Text(
                          'Runs: ${batsmen[index].runs}',
                          style: AppStyles.blackBold20,
                        ),
                        Text(
                          'Innings: ${batsmen[index].innings}',
                          style: AppStyles.blackMedium14,
                        ),
                        Text('Average: ${batsmen[index].avg}',
                            style: AppStyles.blackMedium14)
                      ],
                    ),
                    const SizedBox(
                      height: 35,
                      width: 35,
                    ),
                  ],
                ),
              ),
            );
          });
    }
    if (isfetchingdata == true) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    return Container();
  }
}
