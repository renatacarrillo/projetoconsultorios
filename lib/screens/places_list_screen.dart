import 'package:flutter/material.dart';
import 'package:projetoconsultorios/providers/projetoconsultorios.dart';
import 'package:projetoconsultorios/utils/app_routes.dart';
import 'package:provider/provider.dart';

class PlacesListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meus Consultórios'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(AppRoutes.PLACE_FORM);
            },
          )
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
                  child: Text(
                      'Por enquanto não tem nenhum consultório cadastrado!'),
                ),
                builder: (ctx, projetoConsultorios, ch) => projetoConsultorios
                            .itemsCount ==
                        0
                    ? ch
                    : ListView.builder(
                        itemCount: projetoConsultorios.itemsCount,
                        itemBuilder: (ctx, i) => ListTile(
                          leading: CircleAvatar(
                            //pegando a imagem
                            backgroundImage: FileImage(
                                projetoConsultorios.itemByIndex(i).image),
                          ),
                          //pegando o título
                          title: Text(projetoConsultorios.itemByIndex(i).title),
                          onTap: () {},
                        ),
                      ),
              ),
      ),
    );
  }
}
