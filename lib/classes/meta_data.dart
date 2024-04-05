import 'package:flutter/material.dart';


class Batsman {
  final String name;
  final String runs;
  final String innings;
  final String avg;

  const Batsman({
    required this.name,
    required this.avg,
    required this.runs,
    required this.innings
  });

}


class Bowler {
  final String name;
  final String wickets;
  final String innings;
  final String avg;

  const Bowler({
    required this.name,
    required this.avg,
    required this.innings,
    required this.wickets
  });
}


class MatchInfo {
  final matchTitle, matchType, team1, team2, flag1, flag2;
  final runs1, wickets1, overs1;
  final runs2, wickets2, overs2;
  final status;
  final name;

  MatchInfo(
      this.name,
      this.matchTitle,
      this.matchType,
      this.team1,
      this.team2,
      this.flag1,
      this.flag2,
      this.runs1,
      this.wickets1,
      this.overs1,
      this.runs2,
      this.wickets2,
      this.overs2,
      this.status
      );
}

class PlayerStats
{
  final String? name;
  final String? country;
  final List<T20StatsBatting>? t20batting;
  final List<OdiStatsBatting>? odibatting;
  final List<TestMatchStatsBatting>? testbatting;

  const PlayerStats({
    this.name,
    this.country,
    this.odibatting,
    this.t20batting,
    this.testbatting
});

}
class T20StatsBatting
{
  final String? matches;
  final String? innings;
  final String? runs;
  final String? avg;
  final String? centuries;
  const T20StatsBatting({
     this.matches,
    this.innings,
    this.runs,
    this.avg,
    this.centuries
});
}

class OdiStatsBatting
{
  final String? matches;
  final String? innings;
  final String? runs;
  final String? avg;
  final String? centuries;
  const OdiStatsBatting({
    this.matches,
    this.innings,
    this.runs,
    this.avg,
    this.centuries
  });
}

class TestMatchStatsBatting
{
  final String? matches;
  final String? innings;
  final String? runs;
  final String? avg;
  final String? centuries;

  const TestMatchStatsBatting({
    this.matches,
    this.innings,
    this.runs,
    this.avg,
    this.centuries
  });
}