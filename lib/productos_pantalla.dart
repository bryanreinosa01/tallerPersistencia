import 'package:flutter/material.dart';

import 'producto.dart';
import 'services/producto_service.dart';
import 'detalle_producto_pantalla.dart';
import 'repositories/nota_producto_repository.dart';

class ProductosPantalla extends StatefulWidget {
  final NotaProductoRepository repository;

  const ProductosPantalla({super.key, required this.repository});

  @override
  State<ProductosPantalla> createState() => _ProductosPantallaState();
}

class _ProductosPantallaState extends State<ProductosPantalla> {
  late final ProductoService _service;
  late Future<List<Producto>> _futureProductos;

  void reintentarProductos() {
    setState(() {
      _futureProductos = _service.getProductos();
    });
  }

  @override
  void initState() {
    super.initState();

    _service = ProductoService('https://dummyjson.com/products');
    _futureProductos = _service.getProductos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Catálogo de productos'),
        actions: [
          IconButton(
            onPressed: () async {
              await widget.repository.sincronizarPendientes();
            },
            icon: const Icon(Icons.sync),
            tooltip: 'Sincronizar notas pendientes',
          ),
        ],
      ),
      body: FutureBuilder<List<Producto>>(
        future: _futureProductos,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text('No se pudieron cargar los productos'),
                  Text('${snapshot.error}'),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: reintentarProductos,
                    child: const Text('Reintentar'),
                  ),
                ],
              ),
            );
          }

          final productos = snapshot.data ?? [];

          if (productos.isEmpty) {
            return const Center(child: Text('No hay productos disponibles'));
          }

          return ListView.builder(
            itemCount: productos.length,
            itemBuilder: (context, index) {
              final producto = productos[index];

              return ListTile(
                leading: Image.network(producto.imagen, width: 50, height: 50),
                title: Text(producto.nombre),
                subtitle: Text(producto.categoria),
                trailing: Text('\$${producto.precio}'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetalleProductoPantalla(
                        producto: producto,
                        repository: widget.repository,
                      ),
                    ),
                  );
                },
              );
            }, // Cierra itemBuilder
          ); // Cierra ListView.builder
        }, // Cierra builder de FutureBuilder
      ), // Cierra FutureBuilder
    ); // Cierra Scaffold
  } // Cierra build
} // Cierra la clase
