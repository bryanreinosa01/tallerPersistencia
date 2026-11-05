class Producto {
  final int id;
  final String nombre;
  final String categoria;
  final double precio;
  final String imagen;



    Producto({
    required this.id,
    required this.nombre,
    required this.categoria,
    required this.precio,
    required this.imagen,
  });

    factory Producto.fromJson(Map<String, dynamic> json) {
    return Producto(
      id: json['id'],
      nombre: json['title'],
      categoria: json['category'],
      precio: (json['price'] as num).toDouble(),
      imagen: json['thumbnail'],
    );
  }
}