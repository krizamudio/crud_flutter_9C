import 'package:crud_app_2/db/operaciones.dart';
import 'package:crud_app_2/paginas/guardar_pagina.dart';
import 'package:flutter/material.dart';

class ListPages extends StatelessWidget {
  const ListPages({super.key});

  @override
  Widget build(BuildContext context) {
    Operaciones.obtenerNotas(); //Obtener todas las notas
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => guardarPagina()));
      }),
      appBar: AppBar(
        title: const Text('Material App Bar'),
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            ListTile(title: Text("Nota 1"),)
          ],)
      ),
    );
  }
}