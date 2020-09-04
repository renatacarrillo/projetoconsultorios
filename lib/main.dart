import 'package:flutter/material.dart';
import 'package:projetoconsultorios/providers/projetoconsultorios.dart';
import 'package:projetoconsultorios/screens/place_form_screen.dart';
import 'package:projetoconsultorios/screens/places_list_screen.dart';
import 'package:projetoconsultorios/utils/app_routes.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => ProjetoConsultorios(),
      child: MaterialApp(
        title: 'Consultórios Médicos',
        theme: ThemeData(
          primarySwatch: Colors.teal,
          accentColor: Colors.deepOrange,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: PlacesListScreen(),
        routes: {
          AppRoutes.PLACE_FORM: (ctx) => PlaceFormScreen(),
        },
      ),
    );
  }
}
