class Nota{
  int? id;
  String titulo;
  String descripcion;

  Nota({this.id, required this.titulo, required this.descripcion});

  Map<String, dynamic> toMap(){
    return {
      'id': id,
      'titulo': titulo,
      'descripcion': descripcion,
    };
  }
}