import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tema/navigation/add_player_screen.dart';
import 'package:tema/navigation/player_details_screen.dart';
import 'package:tema/players/domain/player.dart';
import 'package:tema/players/repo/players_repository.dart';

class MainScreen extends StatelessWidget {
  Repository repository;
  MainScreen(this.repository, {Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      // home: Builder(builder
      //   Scaffold(
      //   appBar: AppBar(title: const Text('Lista jucatori')),
      //   body: MainList(repository.getAllPlayers(), repository),
      //   floatingActionButton: FloatingActionButton(
      //     child: const Icon(Icons.add),
      //     onPressed: () {
      //       Navigator.push(context,
      //           MaterialPageRoute(builder: (context) => AddScreen(repository)));
      //     },
      //   ),
      // ),
      // ),
      home: Builder(
        builder: (context) => Center(
          child:
          Scaffold(
            appBar: AppBar(title: const Text('Lista jucatori')),
            body: MainList(repository.getAllPlayers(), repository),
            floatingActionButton: FloatingActionButton(
              child: const Icon(Icons.add),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AddScreen(repository)));
              },
            ),
          ),
        ),
      ),
    );
  }
}

class MainList extends StatelessWidget {
  List<Player> players;
  Repository repository;
  MainList(this.players, this.repository);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: players.length,
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PlayerScreen(players[index],repository)));
              },
              title: Text(players[index].username, style: const TextStyle(fontSize: 25.0),),
              subtitle: Text(players[index].grad, style: const TextStyle(fontSize: 17.5)),
          ),
        );
      },
    );
  }
}


