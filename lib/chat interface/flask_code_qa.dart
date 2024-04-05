import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class QuestionAnswerPage extends StatefulWidget {
  @override
  _QuestionAnswerPageState createState() => _QuestionAnswerPageState();
}

class _QuestionAnswerPageState extends State<QuestionAnswerPage> {
  final TextEditingController contextController = TextEditingController();
  final TextEditingController questionController = TextEditingController();
  final _formkey=GlobalKey<FormState>();




  // Future<void> fetchAnswer() async {
  //   final Uri uri = Uri.parse('https://9a74-34-125-161-154.ngrok-free.app');
  //   final Map<String, String> body = {
  //     'context': contextController.text,
  //     'question': questionController.text,
  //   };
  //   final  response =
  //   await http.post(uri, body: jsonEncode(body), headers: {
  //     'Content-Type': 'application/json',
  //   });
  //
  //   // answer=response.body;
  //   print(response.body);
  //   if (response.statusCode == 200) {
  //     setState(() {
  //       answer = jsonDecode(response.body)['answer'];
  //     });
  //   } else {
  //     throw Exception('Failed to fetch answer');
  //   }
  // }
  String answer='';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child:  Form(
          key: _formkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: contextController,
                decoration: InputDecoration(labelText: 'Context'),
              ),
              TextField(
                controller: questionController,
                decoration: InputDecoration(labelText: 'Question'),
              ),
              ElevatedButton(
                onPressed: () async{

                    final Uri uri = Uri.parse('https://d135-34-125-240-100.ngrok-free.app');
                    final Map<String, String> body = {
                      'context': contextController.text,
                      'question': questionController.text,

                    };

                    final  response =
                        await http.post(uri, body: jsonEncode(body), headers: {
                      'Content-Type': 'application/json',
                    });
                    String jsonString=response.body;
                    Map<String, dynamic> jsonMap = jsonDecode(jsonString);
                    setState(() {

                      answer=jsonMap['answer'];
                      print(answer);

                    });


                },
                child: Text('solution'),
              ),
              SizedBox(height: 20),
             answer.length>0? Text(
                '${answer}',
                style: TextStyle(fontSize: 18),
              ):Container(),
            ],
          ),
        ),
      ),
    );
  }
}