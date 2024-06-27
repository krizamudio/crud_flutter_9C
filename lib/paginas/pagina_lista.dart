import 'package:crud_app_2/db/operaciones.dart';
import 'package:crud_app_2/paginas/guardar_pagina.dart';
import 'package:flutter/material.dart';
import 'package:crud_app_2/modelos/notas.dart';

class ListPages extends StatelessWidget {
  const ListPages({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => guardarPagina()));
      }),
      appBar: AppBar(
        title: const Text('CRUD'),
      ),
      body: Container(
        child: _MiLista()
      ),
    );
  }
}

class _MiLista extends StatefulWidget {
  // const _MiLista({
  //   super.key,
  // });

  @override
  State<_MiLista> createState() => _MiListaState();
}

class _MiListaState extends State<_MiLista> {
  List<Nota> notas = [];
   @override
   void initState() { 
    _cargarDatos(); 
     super.initState();
   }

  @override
  Widget build(BuildContext context) {
    
    return ListView.builder(
      itemCount: notas.length,
      itemBuilder: (_,i) => _crearTEm(i),
    );
  }

  _cargarDatos() async {
    List<Nota> auxNotas = await Operaciones.obtenerNotas();
    setState(() {
      notas = auxNotas;
    });
  }

  _crearTEm(int i) {
    return ListTile(
      title: Text(notas[i].titulo),
    );
  }
}

