import 'package:flutter/material.dart';
import 'package:location/location.dart';

class LocationInput extends StatefulWidget {
  @override
  __LocationInputState createState() => __LocationInputState();
}

class __LocationInputState extends State<LocationInput> {
  String _previewImageUrl;

  Future<void> _getCurrentUserLocation() async {
    //instanciando o Location e pegar dentro dele o getLocation
    final locData = await Location().getLocation();
    print(locData.latitude);
    print(locData.longitude);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 170,
          width: double.infinity,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.deepOrange),
          ),
          child: _previewImageUrl == null
              ? Text('Nenhuma Localização foi Informada!')
              : Image.network(
                  _previewImageUrl,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //botão 1
            FlatButton.icon(
              icon: Icon(Icons.location_on),
              label: Text('Localização Atual'),
              textColor: Theme.of(context).primaryColor,
              //_getCurrentUserLocation = passando apenas a referência da função
              onPressed: _getCurrentUserLocation,
            ),
            //botão 2
            FlatButton.icon(
              icon: Icon(Icons.map),
              label: Text('Selecione no Mapa'),
              textColor: Theme.of(context).primaryColor,
              onPressed: () {},
            )
          ],
        )
      ],
    );
  }
}
