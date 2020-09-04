import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as syspaths;

class ImageInput extends StatefulWidget {
  final Function onSelectImage;

  ImageInput(this.onSelectImage);

  @override
  _ImageInputState createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File _storedImage;

  //método
  _takePicture() async {
    //pegar a imagem a partir da câmera
    final ImagePicker _picker = ImagePicker();
    PickedFile imageFile = await _picker.getImage(
      source: ImageSource.camera,
      maxWidth: 600,
    );

    //testando, só passa para frente se for != null
    if (imageFile == null) return;

    //se entrar aqui é porque está funcionando
    setState(() {
      _storedImage = File(imageFile.path);
    });

    //criando o diretório para armazenar a imagem
    final appDir = await syspaths.getApplicationSupportDirectory();

    //pegar o nome da imagem
    String fileName = path.basename(_storedImage.path);

    //gerar uma cópia e salvar dentro do diretório
    final savedImage = await _storedImage.copy(
      '${appDir.path}/$fileName',
    );
    widget.onSelectImage(savedImage);
  }

  @override
  Widget build(BuildContext context) {
    //mostrar o preview da imagem
    return Row(
      children: <Widget>[
        Container(
          width: 200,
          height: 150,
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.teal),
          ),
          alignment: Alignment.center,

          //condicional para mostrar imagem se não mostrar a mensagem
          child: _storedImage != null
              ? Image.file(
                  //imagem a partir de um arquivo
                  _storedImage,
                  width: double.infinity,
                  fit: BoxFit.cover,
                )
              : Text('Nenhuma imagem!'),
        ),
        SizedBox(width: 10),
        Expanded(
          child: FlatButton.icon(
            icon: Icon(Icons.camera),
            label: Text('Tirar Foto'),
            textColor: Theme.of(context).primaryColor,
            onPressed: _takePicture,
          ),
        ),
      ],
    );
  }
}
