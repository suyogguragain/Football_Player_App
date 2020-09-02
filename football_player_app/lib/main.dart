import 'package:flutter/material.dart';
import 'package:football_player_app/pages/homepage.dart';
import 'package:football_player_app/services/repository.dart';
import 'package:football_player_app/themes/themes.dart';

void main() {
  PlayerRepository _repository = PlayerRepository();

  runApp(MyApp(playerRepository: _repository,));
}

class MyApp extends StatelessWidget {

  final PlayerRepository playerRepository;

  MyApp({this.playerRepository});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bloc Implementation',
      theme: ThemeData(
        canvasColor: Colors.white,
        appBarTheme: AppBarTheme(
          color: Colors.white,
          elevation: 0.0,
          textTheme: TextTheme(
            title: appBarTextStyle
          ),
          iconTheme: IconThemeData(
            color: Colors.black
          )
        )
      ),
      home: HomePage(playerRepository: playerRepository),
    );
  }
}
