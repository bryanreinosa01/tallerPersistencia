import 'package:flutter/material.dart';

import 'producto.dart';
import 'repositories/nota_producto_repository.dart';
import 'nota_producto.dart';

class DetalleProductoPantalla extends StatefulWidget {
  final NotaProductoRepository repository;
  final Producto producto;

  const DetalleProductoPantalla({
    super.key,
    required this.producto,
    required this.repository,
  });

  @override
  State<DetalleProductoPantalla> createState() =>
      _DetalleProductoPantallaState();
}

class _DetalleProductoPantallaState extends State<DetalleProductoPantalla> {
  String nota = '';
  int prioridad = 1;

  // Guarda el estado de la nota consultada en Drift.
  String estadoSincronizacion = 'No hay información guardada';

  final TextEditingController notaController = TextEditingController();

  @override
  void initState() {
    super.initState();
    cargarNota();
  }

  @override
  void dispose() {
    notaController.dispose();
    super.dispose();
  }

  Future<void> cargarNota() async {
    final notaGuardada = await widget.repository.obtenerNota(
      widget.producto.id,
    );

    if (!mounted) return;

    setState(() {
      if (notaGuardada == null) {
        estadoSincronizacion = 'No hay información guardada';
      } else {
        nota = notaGuardada.nota;
        notaController.text = notaGuardada.nota;
        prioridad = notaGuardada.prioridad;

        estadoSincronizacion = notaGuardada.pendienteSync
            ? 'Pendiente'
            : 'Sincronizado';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.producto.nombre)),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.network(widget.producto.imagen, width: 150, height: 150),
            const SizedBox(height: 16),
            Text('Categoría: ${widget.producto.categoria}'),
            const SizedBox(height: 8),
            Text('Precio: \$${widget.producto.precio}'),
            const SizedBox(height: 16),
            TextField(
              controller: notaController,
              onChanged: (valor) {
                nota = valor;
              },
              decoration: const InputDecoration(
                labelText: 'Nota personal',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            const Text('Prioridad'),
            DropdownButton<int>(
              value: prioridad,
              items: const [
                DropdownMenuItem(value: 1, child: Text('1')),
                DropdownMenuItem(value: 2, child: Text('2')),
                DropdownMenuItem(value: 3, child: Text('3')),
                DropdownMenuItem(value: 4, child: Text('4')),
                DropdownMenuItem(value: 5, child: Text('5')),
              ],
              onChanged: (valor) {
                if (valor != null) {
                  setState(() {
                    prioridad = valor;
                  });
                }
              },
            ),
            const SizedBox(height: 16),
            Text('Estado: $estadoSincronizacion'),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                if (prioridad < 2) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('La prioridad debe ser 2 o mayor'),
                    ),
                  );
                  return;
                }

                final notaProducto = NotaProducto(
                  productoId: widget.producto.id,
                  nota: nota,
                  prioridad: prioridad,
                  actualizadoEn: DateTime.now(),
                );

                await widget.repository.guardarNota(notaProducto);

                if (!mounted) return;

                // Vuelve a consultar Drift para mostrar el estado actualizado.
                await cargarNota();

                if (!mounted) return;

                ScaffoldMessenger.of(this.context).showSnackBar(
                  const SnackBar(
                    content: Text('Nota guardada en el dispositivo'),
                  ),
                );
              },
              child: const Text('Guardar'),
            ),
          ],
        ),
      ),
    );
  }
}
