import 'dart:convert';
import 'package:csv/csv.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as htmlParser;
import 'package:flutter/services.dart' show rootBundle;

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:csv/csv.dart';
import 'dart:math';



class Player {
  final String name;
  final Map<String, double> stats;

  Player(this.name, this.stats);
}
class PlayerSimilarityPage extends StatefulWidget {
  @override
  _PlayerSimilarityPageState createState() => _PlayerSimilarityPageState();
}

class _PlayerSimilarityPageState extends State<PlayerSimilarityPage> {
  TextEditingController _controller = TextEditingController();
  List<Player> players = [];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    String csvData = await rootBundle.loadString('assets/test.csv');
    List<List<dynamic>> csvPlayers = CsvToListConverter().convert(csvData);
    List<dynamic> headers = csvPlayers.removeAt(0);
    setState(() {
      players = csvPlayers.take(5).map((row) {
        String name = row[0];
        Map<String, double> stats = {};
        for (int i = 0; i < headers.length; i++) {
          if (headers[i] != "Span" && headers[i] != "HS") {
            stats[headers[i]] = double.parse(row[i].toString());
          }
        }
        return Player(name, stats);
      }).toList();
    });
  }

  List<Player> findSimilarPlayers(String playerName) {
    print('Finding similar players...');
    Player inputPlayer = players.firstWhere(
          (player) => player.name.toLowerCase() == playerName.toLowerCase(),

    );
    print(inputPlayer);

    if (inputPlayer == null) {
      return [];
    }

    // Compute cosine similarity with all players
    List<Map<Player, double>> similarities = [];
    for (Player player in players) {
      double similarity = cosineSimilarity(inputPlayer.stats.values.toList(), player.stats.values.toList());
      similarities.add({player: similarity});
    }

    // Sort by similarity and get top 3 similar players
    similarities.sort((a, b) => b.values.first.compareTo(a.values.first));
    List<Player> similarPlayers = similarities.take(4).map((e) => e.keys.first).toList();
    return similarPlayers.sublist(1);
  }

  double cosineSimilarity(List<double> vector1, List<double> vector2) {
    double dot = dotProduct(vector1, vector2);
    double mag1 = magnitude(vector1);
    double mag2 = magnitude(vector2);

    if (mag1 == 0 || mag2 == 0) {
      return 0; // Handle division by zero
    }

    return dot / (mag1 * mag2);
  }

  double dotProduct(List<double> vector1, List<double> vector2) {
    double product = 0;
    for (int i = 0; i < vector1.length; i++) {
      product += vector1[i] * vector2[i];
    }
    return product;
  }

  double magnitude(List<double> vector) {
    double sum = 0;
    for (int i = 0; i < vector.length; i++) {
      sum += pow(vector[i], 2);
    }
    return sqrt(sum);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Player Similarity Finder'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(labelText: 'Enter player name'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                String playerName = _controller.text.trim();
                print('Button pressed with player name: $playerName');
                List<Player> similarPlayers = findSimilarPlayers(playerName);
                print('Similar players: $similarPlayers');
                if (similarPlayers.isNotEmpty) {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('Top 3 Similar Players'),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: similarPlayers.map((player) {
                            return ListTile(
                              title: Text(player.name),
                              subtitle: Text('Similarity: ${cosineSimilarity(players.firstWhere((element) => element.name == playerName).stats.values.toList(), player.stats.values.toList()).toStringAsFixed(2)}'),
                            );
                          }).toList(),
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                } else {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('Player Not Found'),
                        content: Text('Player with the given name was not found.'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                }
              },
              child: Text('Find Similar Players'),
            ),
          ],
        ),
      ),
    );
  }
}