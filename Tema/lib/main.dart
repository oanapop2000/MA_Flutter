import 'package:flutter/material.dart';
import 'package:tema/players/repo/players_repository.dart';

import 'navigation/players_screen.dart';

void main() {
  Repository repository = Repository();
  runApp(MainScreen(repository));
}






