import 'dart:convert';
import 'package:http/http.dart' as http;

import '../producto.dart';

class ProductoService {

    final String baseUrl;

ProductoService(this.baseUrl);

  Future<List<Producto>> getProductos() async {
    final response = await http
        .get(Uri.parse(baseUrl))
        .timeout(const Duration(seconds: 10));

    if (response.statusCode != 200) {
      throw Exception('Error HTTP ${response.statusCode}');
    }

    final data = jsonDecode(response.body);
    final List<dynamic> productos = data['products'];

    return productos.map((item) => Producto.fromJson(item)).toList();
  }
}