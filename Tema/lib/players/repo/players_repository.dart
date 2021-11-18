import 'package:tema/players/domain/player.dart';

class Repository {

  List<Player> listOfPlayers = [
    Player(
        1,
        'ana_rusu',
        "b",
        "b@gmail.com",
        "12-12-2000",
        "Incepator",
        5),
    Player(
        2,
        "bianca.manolescu",
        "c",
        "c@gmail.com",
        "12-11-2000",
        "Incepator",
        8)
  ];

  List<Player> getAllPlayers() {
    return listOfPlayers;
  }

  bool validareInt(String nr) {
    return num.tryParse(nr) != null;
  }

  String modifyPlayer(int id, String username, String nume, String email,
      String data, String grad, int nrMeciuri) {
    var message = "Ok";
    if (nume == "") {
      message = "Campul pt nume e gol!";
    }
    else if (email == "") {
      message = "Campul pt email e gol!";
    }
    else {
      List<String> list = data.split("-");
      if (list[0].length == 2 && list[1].length == 2 && list[2].length == 4 &&
          validareInt(list[0]) == true && validareInt(list[1]) == true &&
          validareInt(list[2]) == true) {
        if (grad == "Incepator" || grad == "Mediu" || grad == "Avansat") {
          if (message == "Ok") {
            if (nrMeciuri < 0) {
              message = "Nr meciurilor trebuie sa fie pozitiv!";
            }
            else {
              for (Player player in listOfPlayers) {
                if (player.id == id) {
                  player.email = email;
                  player.nume = nume;
                  player.dataNasterii = data;
                  player.grad = grad;
                  player.nrMeciuriCastigate = nrMeciuri;
                }
              }
            }
          }
        } else {
          message = "Gradul trebuie sa fie Incepator, Mediu sau Avansat";
        }
      } else {
        message = "Data nu este in formatul cerut!";
      }
    }
    return message;
  }

  void deletePlayer(int id) {
    int i = 0;
    for (Player player in listOfPlayers) {
      if (player.id == id) {
        listOfPlayers.removeAt(i);
        break;
      }
      i++;
    }
  }

  String addPlayer(String id, String username, String nume, String email,
      String data, String grad, String nrMeciuri) {
    var message = "Ok";
    if (username == "") {
      message = "Campul pt username e gol!";
    }
    else if (nume == "") {
      message = "Campul pt nume e gol!";
    }
    else if (email == "") {
      message = "Campul pt email e gol!";
    }
    else {
      if (validareInt(id) == true) {
        var idBun = int.tryParse(id);
        if (validareInt(nrMeciuri) == true) {
          var nrMeciuriBun = int.tryParse(nrMeciuri);
          List<String> list = data.split("-");
          if (list[0].length == 2 && list[1].length == 2 &&
              list[2].length == 4 && validareInt(list[0]) == true &&
              validareInt(list[1]) == true && validareInt(list[2]) == true) {
            if (grad == "Incepator" || grad == "Mediu" || grad == "Avansat") {
              for (Player player in listOfPlayers) {
                if (player.id == idBun) {
                  message = "Id-ul trebuie sa fie unic";
                }
                else if (player.username == username) {
                  message = "Username-ul trebuie sa fie unic!";
                }
              }
              if (message == "Ok") {
                if (idBun! < 0) {
                  message = "Id ul trebuie sa fie pozitiv!";
                }
                else {
                  if (nrMeciuriBun! < 0) {
                    message = "Nr meciurilor trebuie sa fie pozitiv!";
                  }
                  else {
                    Player player = Player(
                        idBun,
                        username,
                        nume,
                        email,
                        data,
                        grad,
                        nrMeciuriBun);
                    listOfPlayers.add(player);
                  }
                }
              }
            } else {
              message = "Gradul trebuie sa fie Incepator, Mediu sau Avansat";
            }
          } else {
            message = "Data nu este in formatul cerut!";
          }
        } else {
          message = "Numarul meciurilor nu e numeric!";
        }
      } else {
        message = "Id-ul nu e numeric!";
      }

    }
    return message;
  }
}