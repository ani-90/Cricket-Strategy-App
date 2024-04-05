import 'package:flutter/material.dart';

import '../chat interface/flask_code_qa.dart';
import '../classes/meta_data.dart';
import '../styles/AppStyles.dart';
import 'package:http/http.dart' as http;
import 'package:html/dom.dart' as dom;

import 'chatinterface.dart';

class BowlingStats extends StatefulWidget {
  const BowlingStats({super.key});

  @override
  State<BowlingStats> createState() => _BowlingStatsState();
}

class _BowlingStatsState extends State<BowlingStats> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text(
            'Top Wicket Takers',
            style: AppStyles.blackBold24,
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>QuestionAnswerPage()));},
          backgroundColor: Colors.indigo,
          child: Icon(Icons.arrow_forward,color: Colors.white,),
        ),
        body: const Padding(padding: EdgeInsets.all(8.0), child: Bowlers()),
      ),
    );
  }
}

class Bowlers extends StatefulWidget {
  const Bowlers({super.key});

  @override
  State<Bowlers> createState() => _BowlersState();
}

class _BowlersState extends State<Bowlers> {
  List<Bowler> bowlers = [];
  bool isfetchingdata = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getBowlerData();
  }

  Future getBowlerData() async {
    setState(() {
      isfetchingdata = true;
    });
    final url = Uri.parse(
        'https://www.espncricinfo.com/records/tournament/bowling-most-wickets-career/icc-world-test-championship-2023-2025-15144');
    final response = await http.get(url);
    dom.Document html = dom.Document.html(response.body);

    var element = html.querySelectorAll('table>tbody')[0];
    var data = element.querySelectorAll('tr');


    setState(() {
      isfetchingdata = false;
    });

    setState(() {
      bowlers = List.generate(
          10,
          (index) => Bowler(
              name: data[index].children[0].text.toString().trim(),
              avg: data[index].children[10].text.toString().trim(),
              wickets: data[index].children[8].text.toString().trim(),
              innings: data[index].children[3].text.toString().trim()));
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isfetchingdata == false) {
      return ListView.builder(
          itemCount: bowlers.length,
          itemBuilder: (context, index) {
            return SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.2,
              child: Padding(
                padding: const EdgeInsets.only(left: 2),
                child: Row(
                  children: [
                    const Stack(
                      children: [
                        CircleAvatar(
                          backgroundImage: NetworkImage(
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSQzPYLl1NCRj1JmlflN-rQHLcVUvIQZsIQAA&s'
                            // 'https://img1.hscicdn.com/image/upload/f_auto,t_h_100_2x/lsci/db/PICTURES/CMS/263500/263529.1.jpg',
                          ),
                          maxRadius: 60,
                        ),
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
                              bowlers[index].name,
                              style: AppStyles.blackBold18,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            // Image.asset('assets/aussie.jpeg',width: 25,)
                          ],
                        ),
                        Text(
                          'Wickets: ${bowlers[index].wickets}',
                          style: AppStyles.blackBold16,
                        ),
                        Text(
                          'Innings: ${bowlers[index].innings}',
                          style: AppStyles.blackMedium14,
                        ),
                        Text('Average: ${bowlers[index].avg}',
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
