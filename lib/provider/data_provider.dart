import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rishabh_app_developer_assignment/globals.dart';
import 'package:rishabh_app_developer_assignment/model/profile.dart';
import 'package:rishabh_app_developer_assignment/model/tournament.dart';

class DataProvider extends ChangeNotifier {
  // ignore: prefer_final_fields
  List<Tournament> tournaments = [];
  Profile profile = Profile.empty();

  Future<void> getTournamentsList() async {
    tournaments = [];
    var url = Uri.parse(tournamentDetailsEndPoint);
    var response = await http.get(url);
    var decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
    List tournamentsResponse = decodedResponse["data"]["tournaments"];
    for (var t in tournamentsResponse) {
      tournaments.add(Tournament(t["name"], t["cover_url"], t["game_name"]));
    }
    notifyListeners();
  }

  Future<void> getProfileData() async {
    var url = Uri.parse(profileDetailsEndPoint);
    var response = await http.get(url);
    var decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
    profile = Profile(
      decodedResponse["menuTitle"],
      decodedResponse["name"],
      decodedResponse["rating"],
      decodedResponse["won"],
      decodedResponse["played"],
      decodedResponse["percent"],
      decodedResponse["avatarUrl"],
    );
    notifyListeners();
  }
}
