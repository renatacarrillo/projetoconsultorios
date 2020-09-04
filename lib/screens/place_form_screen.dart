import 'dart:io';
import 'package:flutter/material.dart';
import 'package:projetoconsultorios/providers/projetoconsultorios.dart';
import 'package:projetoconsultorios/widgets/image_input.dart';
import 'package:projetoconsultorios/widgets/location_input.dart';
import 'package:provider/provider.dart';

class PlaceFormScreen extends StatefulWidget {
  @override
  _PlaceFormScreenState createState() => _PlaceFormScreenState();
}

class _PlaceFormScreenState extends State<PlaceFormScreen> {
  final _titleController = TextEditingController();
  File _pickedImage;

  void _selectImage(File pickedImage) {
    _pickedImage = pickedImage;
  }

  //método visível somente dentro dessa classe
  void _submitForm() {
    //verificar se realmente os dados vieram de forma correta
    if (_titleController.text.isEmpty || _pickedImage == null) {
      return; //se não foi, entra aqui
    }

    Provider.of<ProjetoConsultorios>(context, listen: false)
        .addPlace(_titleController.text, _pickedImage);

    //se foi entra aqui e volta para a tela anterior
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastrar Novo Consultório'),
      ),
      body: Column(
        //leva o botão para o final da tela
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: <Widget>[
                    TextField(
                      controller: _titleController,
                      decoration: InputDecoration(
                        labelText: 'Nome do Consultório',
                      ),
                    ),
                    SizedBox(height: 10),
                    ImageInput(this._selectImage),
                    SizedBox(height: 10),
                    LocationInput(),
                  ],
                ),
              ),
            ),
          ),
          RaisedButton.icon(
            icon: Icon(Icons.add),
            label: Text('Cadastrar Consultório'),
            color: Theme.of(context).accentColor,
            //ajustes para encostar o botão na parte inferior da tela
            elevation: 0,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            //vai chamar o método quando clicar no botão
            onPressed: _submitForm,
          ),
        ],
      ),
    );
  }
}
