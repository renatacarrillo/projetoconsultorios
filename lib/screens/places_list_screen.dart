import 'package:flutter/material.dart';
import 'package:projetoconsultorios/providers/projetoconsultorios.dart';
import 'package:projetoconsultorios/utils/app_routes.dart';
import 'package:provider/provider.dart';

class PlacesListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'MEUS CONSULTÓRIOS',
          style: TextStyle(color: Color(0xFF00FFFF)),
        ),
        titleSpacing: 20,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.add_location,
              color: Colors.lightGreenAccent[400],
            ),
            iconSize: 40,
            onPressed: () {
              Navigator.of(context).pushNamed(AppRoutes.PLACE_FORM);
            },
          ),
        ],
      ),
      body: FutureBuilder(
        future: Provider.of<ProjetoConsultorios>(context, listen: false)
            .loadPlaces(),
        builder: (ctx, snapshot) => snapshot.connectionState ==
                ConnectionState.waiting
            ? Center(child: CircularProgressIndicator())
            : Consumer<ProjetoConsultorios>(
                child: Center(
                  child: Text('Nenhum local cadastrado!'),
                ),
                builder: (ctx, greatPlaces, ch) => greatPlaces.itemsCount == 0
                    ? ch
                    : ListView.builder(
                        itemCount: greatPlaces.itemsCount,
                        itemBuilder: (ctx, i) => ListTile(
                          leading: CircleAvatar(
                            backgroundImage: FileImage(
                              greatPlaces.itemByIndex(i).image,
                            ),
                          ),
                          title: Text(
                            greatPlaces.itemByIndex(i).title,
                            // textAlign: TextAlign.start,
                          ),
                          subtitle:
                              Text(greatPlaces.itemByIndex(i).location.address),
                          onTap: () {
                            Navigator.of(context).pushNamed(
                              AppRoutes.PLACE_DETAIL,
                              arguments: greatPlaces.itemByIndex(i),
                            );
                          },
                        ),
                      ),
              ),
      ),
    );
  }
}
