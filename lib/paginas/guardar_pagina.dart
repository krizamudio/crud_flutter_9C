import 'package:crud_app_2/db/operaciones.dart';
import 'package:crud_app_2/modelos/notas.dart';
import 'package:flutter/material.dart';

class guardarPagina extends StatelessWidget {
  const guardarPagina({super.key});

  @override
  Widget build(BuildContext context) {

    
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Guardar Nota'),
      ),
      body: guardarFormulario());
  }
}

class guardarFormulario extends StatefulWidget {
  const guardarFormulario({super.key});

  @override
  State<guardarFormulario> createState() => _guardarFormularioState();
}

class _guardarFormularioState extends State<guardarFormulario> {

  final _formKey = GlobalKey<FormState>();
  final _tituloController = TextEditingController(); 
  final _descripcionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
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
            InputDecoration(border: OutlineInputBorder(),
            labelText: 'Descripcion de la Nota'),
            ),
            SizedBox(height: 10),
            ElevatedButton(child: Text('Guardar Nota'), 
            onPressed: () { //Funcion para guardar la nota
              if(_formKey.currentState!.validate()){ //Validar el formulario
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Guardando Nota'))); //Mostrar mensaje

                Operaciones.insertarOperacion(Nota( //Insertar la nota
                  titulo: _tituloController.text,
                  descripcion: _descripcionController.text
                ));
              }
            })
        ],
      ),
      ),
    );
  }
}