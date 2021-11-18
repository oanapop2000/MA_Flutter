import 'package:flutter/material.dart';
import 'package:tema/main.dart';
import 'package:tema/navigation/players_screen.dart';
import 'package:tema/players/domain/player.dart';
import 'package:tema/players/repo/players_repository.dart';

class PlayerScreen extends StatelessWidget {
  Player player;
  Repository repository;
  PlayerScreen(this.player, this.repository);
  final formGlobalKey = GlobalKey < FormState > ();
  final TextEditingController _textControllerId = new TextEditingController();
  final TextEditingController _textControllerUsername = new TextEditingController();
  final TextEditingController _textControllerNume = new TextEditingController();
  final TextEditingController _textControllerEmail = new TextEditingController();
  final TextEditingController _textControllerDataNasterii = new TextEditingController();
  final TextEditingController _textControllerGrad = new TextEditingController();
  final TextEditingController _textControllerNrMeciuri = new TextEditingController();


  @override
  Widget build(BuildContext context) {
    _textControllerId.text = player.id.toString();
    _textControllerUsername.text = player.username;
    _textControllerNume.text = player.nume;
    _textControllerEmail.text = player.email;
    _textControllerDataNasterii.text = player.dataNasterii;
    _textControllerGrad.text = player.grad;
    _textControllerNrMeciuri.text = player.nrMeciuriCastigate.toString();

    return Scaffold(
        appBar: AppBar(
          title: const Text('Detalii jucator'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Form(
            key: formGlobalKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 12),
                  TextFormField(
                    readOnly: true,
                    decoration: const InputDecoration(
                      labelText: "Id",
                      contentPadding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                      labelStyle: TextStyle(fontSize: 25),

                    ),
                    controller: _textControllerId,
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    readOnly: true,
                    decoration: const InputDecoration(
                      labelText: "Username",
                      contentPadding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                      labelStyle: TextStyle(fontSize: 25),
                    ),
                    controller: _textControllerUsername,
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: "Nume",
                      contentPadding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                      labelStyle: TextStyle(fontSize: 25),
                    ),
                    controller: _textControllerNume,
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: "Email",
                      contentPadding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                      labelStyle: TextStyle(fontSize: 25),
                    ),
                    controller: _textControllerEmail,
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: "Data nasterii (DD-MM-YYYY)",
                      contentPadding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                      labelStyle: TextStyle(fontSize: 25),
                    ),
                    controller: _textControllerDataNasterii,
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: "Grad",
                      contentPadding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                      labelStyle: TextStyle(fontSize: 25),
                    ),
                    controller: _textControllerGrad,
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: "Nr meciuri castigate",
                      contentPadding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                      labelStyle: TextStyle(fontSize: 25),
                    ),
                    controller: _textControllerNrMeciuri,
                  ),
                  Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(30),
                            child: ButtonBar(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                ButtonTheme(
                                  textTheme: ButtonTextTheme.primary,
                                  minWidth: 100.0,
                                  height: 50.0,
                                  child: RaisedButton(
                                    child: const Text('Modify'),
                                    color: Colors.blue,
                                    onPressed: () {
                                      String message = repository.modifyPlayer(int.parse(_textControllerId.text), _textControllerUsername.text, _textControllerNume.text, _textControllerEmail.text, _textControllerDataNasterii.text, _textControllerGrad.text, int.parse(_textControllerNrMeciuri.text));
                                      if(message == "Ok"){
                                        Navigator.push(context, MaterialPageRoute(builder: (context) => MainScreen(repository)));
                                      }
                                      else{
                                        showDialog<String>(
                                          context: context,
                                          builder: (BuildContext context) => AlertDialog(
                                            title: const Text('Eroare'),
                                            content: Text(message),
                                            actions: <Widget>[
                                              TextButton(
                                                onPressed: () => Navigator.pop(context, 'OK'),
                                                child: const Text('OK'),
                                              ),
                                            ],
                                          ),
                                        );
                                      }
                                    },
                                  ),
                                ),
                                ButtonTheme(
                                  textTheme: ButtonTextTheme.primary,
                                  minWidth: 100.0,
                                  height: 50.0,
                                  child: FlatButton(
                                    child: const Text("Delete"),
                                    color: Colors.blue,
                                    onPressed: () {
                                      repository.deletePlayer(int.parse(_textControllerId.text));
                                      showDialog<String>(
                                        context: context,
                                        builder: (BuildContext context) => AlertDialog(
                                          title: const Text('Info'),
                                          content: const Text('Jucatorul a fost sters cu succes!'),
                                          actions: <Widget>[
                                            TextButton(
                                              onPressed: () {
                                                Navigator.push(context, MaterialPageRoute(builder: (context) => MainScreen(repository)));
                                            },
                                              child: const Text('OK'),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                )

                              ],
                            ),
                          ),
                        ],
                      )
                  )


                ],
              ),
            ),
          ),
        ));
  }
}
