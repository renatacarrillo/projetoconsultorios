import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

//definindo a estrutura da localização
class PlaceLocation {
  final double latitude;
  final double longitude;
  final String address;

//atributos requeridos
  const PlaceLocation({
    @required this.latitude,
    @required this.longitude,
    this.address,
  });

  LatLng toLatLng() {
    return LatLng(this.latitude, this.longitude);
  }
}

//definindo a estrutura do local
class Place {
  final String id;
  final String title;
  final PlaceLocation location;
  final File image;

  //atributos requeridos
  Place({
    @required this.id,
    @required this.title,
    @required this.location,
    @required this.image,
  });
}
