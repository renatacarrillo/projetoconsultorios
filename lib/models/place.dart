import 'dart:io';
import 'package:flutter/foundation.dart';

//definindo a estrutura da localização
class PlaceLocation {
  final double latitude;
  final double longitude;
  final String address;

//atributos requeridos
  PlaceLocation({
    @required this.latitude,
    @required this.longitude,
    this.address,
  });
}

//definindo a estrutura do local
class Place {
  final String id;
  final String title;
  final String location;
  final File image;

  //atributos requeridos
  Place({
    @required this.id,
    @required this.title,
    @required this.location,
    @required this.image,
  });
}
