import 'package:flutter/material.dart';
import 'package:sample_bloc/services/repository.dart';

import 'screens/home_screen.dart';

void main() {
  PlayerRepository _repository = PlayerRepository();

  runApp(MyApp(playerRepository: _repository));
}

class MyApp extends StatelessWidget {
  final PlayerRepository playerRepository;

  MyApp({this.playerRepository});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bloc Sample',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: HomeScreen(playerRepository: playerRepository),
    );
  }
}
