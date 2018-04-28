import 'package:flutter/material.dart';
import 'GitHubRanking.dart';


class Location extends StatefulWidget{
  final String path;
  final String name;

  Location({this.name, this.path});

  @override
  createState() => new LocationState(name: this.name, path: this.path);
}


class LocationState extends State<Location> {
  final String path;
  final String name;

  LocationState({this.name, this.path});

  void showRanking(){
    Navigator.of(context).push(
      new MaterialPageRoute(
        builder: (context) {
            var ranking = new GitHubRanking();
            return new Scaffold(
              appBar: new AppBar(
                title: new Text("GitHubRankings - " + this.name),
              ),
              body: ranking.getGitHubRanking(this.path),
            );
            }
          )
        );
  }

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
              child: new ListTile(title: new Text(this.name)),
              onTap: showRanking
            );
    }
}

  Widget getLocations(){
    List <Location> locations = new List<Location>();

    locations.add(new Location(name: "Spain", path: "spain-region"));

    // Andalucia
    locations.add(new Location(name: "Andalucía", path: "andalucia/andalucia"));
    locations.add(new Location(name: "Almería", path: "andalucia/almeria"));
    locations.add(new Location(name: "Cádiz", path: "andalucia/cadiz"));
    locations.add(new Location(name: "Córdoba", path: "andalucia/cordoba"));
    locations.add(new Location(name: "Granada", path: "andalucia/granada"));
    locations.add(new Location(name: "Huelva", path: "andalucia/huelva"));
    locations.add(new Location(name: "Jaén", path: "andalucia/jaen"));
    locations.add(new Location(name: "Málaga", path: "andalucia/malaga"));
    locations.add(new Location(name: "Sevilla", path: "andalucia/sevilla"));

    // Aragon
    locations.add(new Location(name: "Aragón", path: "aragon/aragon"));
    locations.add(new Location(name: "Huesca", path: "aragon/huesca"));
    locations.add(new Location(name: "Teruel", path: "aragon/teruel"));
    locations.add(new Location(name: "Zaragoza", path: "aragon/zaragoza"));

    // Castilla y Leon
    locations.add(new Location(name: "Castilla y León", path: "castillayleon/castillayleon"));
    locations.add(new Location(name: "Ávila", path: "castillayleon/avila"));
    locations.add(new Location(name: "Burgos", path: "castillayleon/burgos"));
    locations.add(new Location(name: "León", path: "castillayleon/leon"));
    locations.add(new Location(name: "Palencia", path: "castillayleon/palencia"));
    locations.add(new Location(name: "Salamanca", path: "castillayleon/salamanca"));
    locations.add(new Location(name: "Segovia", path: "castillayleon/segovia"));
    locations.add(new Location(name: "Soria", path: "castillayleon/soria"));
    locations.add(new Location(name: "Valladolid", path: "castillayleon/valladolid"));
    locations.add(new Location(name: "Zamora", path: "castillayleon/zamora"));

    // Catalonia
    locations.add(new Location(name: "Catalonia", path: "catalonia/catalonia"));
    locations.add(new Location(name: "Barcelona", path: "catalonia/barcelona"));
    locations.add(new Location(name: "Girona", path: "catalonia/girona"));
    locations.add(new Location(name: "Lleida", path: "catalonia/lleida"));
    locations.add(new Location(name: "Tarragona", path: "catalonia/tarragona"));

    // C. Valenciana
    locations.add(new Location(name: "C. Valenciana", path: "cvalenciana/cvalenciana"));
    locations.add(new Location(name: "Alicante", path: "cvalenciana/alicante"));
    locations.add(new Location(name: "Castellon", path: "cvalenciana/castellon"));
    locations.add(new Location(name: "Castellon", path: "cvalenciana/castellon"));

    // Euskadi
    locations.add(new Location(name: "Euskadi", path: "euskadi/euskadi"));
    locations.add(new Location(name: "Álava", path: "euskadi/alava"));
    locations.add(new Location(name: "Guipuzcoa", path: "euskadi/guipuzcoa"));
    locations.add(new Location(name: "Vizcaya", path: "euskadi/vizcaya"));

    // Extremadura
    locations.add(new Location(name: "Extremadura", path: "extremadura/extremadura"));
    locations.add(new Location(name: "Cáceres", path: "extremadura/caceres"));
    locations.add(new Location(name: "Badajoz", path: "extremadura/badajoz"));

    // Galicia
    locations.add(new Location(name: "Galicia", path: "galicia/galicia"));
    locations.add(new Location(name: "Coruna", path: "galicia/coruna"));
    locations.add(new Location(name: "Lugo", path: "galicia/lugo"));
    locations.add(new Location(name: "Orense", path: "galicia/orense"));
    locations.add(new Location(name: "Pontevedra", path: "galicia/pontevedra"));

    // Castilla la Mancha
    locations.add(new Location(name: "Castilla la Mancha", path: "mancha/mancha"));
    locations.add(new Location(name: "Albacete", path: "mancha/albacete"));
    locations.add(new Location(name: "Ciudad Real", path: "mancha/ciudadreal"));
    locations.add(new Location(name: "Cuenca", path: "mancha/cuenca"));
    locations.add(new Location(name: "Guadalajara", path: "mancha/guadalajara"));
    locations.add(new Location(name: "Toledo", path: "mancha/toledo"));

    // Asturias
    locations.add(new Location(name: "Asturias", path: "asturias"));

    // Baleares
    locations.add(new Location(name: "Baleares", path: "baleares"));

    // Canarias
    locations.add(new Location(name: "Canarias", path: "canarias"));

    // Cantabria
    locations.add(new Location(name: "Cantabria", path: "cantabria"));

    // Ceuta
    locations.add(new Location(name: "Ceuta", path: "ceuta"));

    // Madrid
    locations.add(new Location(name: "Madrid", path: "madrid"));

    // Melilla
    locations.add(new Location(name: "Melilla", path: "melilla"));

    // Murcia
    locations.add(new Location(name: "Murcia", path: "Murcia"));

    // Navarra
    locations.add(new Location(name: "Navarra", path: "navarra"));

    // La Rioja
    locations.add(new Location(name: "La Rioja", path: "rioja"));

    return new ListView(children: locations,);
  }