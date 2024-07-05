import 'package:crud_app_2/db/operaciones.dart';
import 'package:crud_app_2/modelos/notas.dart';
import 'package:flutter/material.dart';

class actualizarPagina extends StatelessWidget {
 
  final Nota nota;
  final TextEditingController _tituloController;
  final TextEditingController _descripcionController;
  final _formKey = GlobalKey<FormState>();

  actualizarPagina({super.key, required this.nota})
  :
       _tituloController = TextEditingController(text: nota.titulo),
        _descripcionController = TextEditingController(text: nota.descripcion);
  
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Actualizar Nota'),
      ),
      body: Container(
        child: Container(
      padding: EdgeInsets.all(10),
      child: Form(
        key: _formKey,
        child: Column(children: [
        TextFormField(
          controller: _tituloController, //Controlador para el campo de texto
          validator: (value) {
            if(value!.isEmpty){ //Validar que el campo no este vacio
              return 'Por favor ingrese un titulo';
            } else {
              return null;
            }
          },
          decoration: 
            InputDecoration(border: OutlineInputBorder(),
            labelText: 'Titulo de la Nota'),
            ),
            SizedBox(height: 10),
        TextFormField( //Campo de texto
          controller: _descripcionController, //Controlador para el campo de texto
          maxLength: 1000,
          maxLines: 4,
          validator: (value) {
            if(value!.isEmpty){
              return 'Por favor ingrese descripcion';
            } else {
              return null;
            }
          },
          decoration: 
            const InputDecoration(border: OutlineInputBorder(),
            labelText: 'Descripcion de la Nota'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(child: const Text('Actualizar Nota'), 
            onPressed: () { //Funcion para guardar la nota
              if(_formKey.currentState!.validate()){ //Validar el formulario
                nota.titulo = _tituloController.text;
                nota.descripcion = _descripcionController.text;
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Actualizando Nota'))); //Mostrar mensaje

                Operaciones.actualizarOperacion(nota);
              }
            })
        ],
      ),
      ),
    )));
  }
}