import 'package:flutter/material.dart';

const tournamentDetailsEndPoint =
    "https://tournaments-dot-game-tv-prod.uc.r.appspot.com/tournament/api/tournaments_list_v2?limit=10&status=all";

const profileDetailsEndPoint = "https://simondetails.free.beeceptor.com";

const headerStyle = TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 15,
  letterSpacing: 0.2,
);

const titleStyle = TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 20,
  letterSpacing: 0.2,
);

const subtitleStyle = TextStyle(
  fontSize: 15,
  color: Colors.grey,
  letterSpacing: 0.2,
);

const secondaryTitleStyle = TextStyle(
  color: Colors.white,
  fontSize: 20,
);

const secondaryTextStyle = TextStyle(
  color: Colors.white,
  fontSize: 15,
);

const validUsers = [
  {"user": "9898989898", "pass": "password123"},
  {"user": "9876543210", "pass": "password123"}
];

const homeRoute = "/home";
const loginRoute = "/login";
const loaderRoute = "/loader";
