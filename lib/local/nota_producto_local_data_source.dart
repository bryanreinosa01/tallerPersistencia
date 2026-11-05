import 'app_database.dart';
import '../nota_producto.dart';
import 'package:drift/drift.dart';

class NotaProductoLocalDataSource {
  final AppDatabase db;

  NotaProductoLocalDataSource(this.db);


    NotaProducto _convertirNota(NotaProductoFila fila) {
  return NotaProducto(
    productoId: fila.productoId,
    nota: fila.nota,
    prioridad: fila.prioridad,
    actualizadoEn: fila.actualizadoEn,
    pendienteSync: fila.pendienteSync,
  );
}

    Future<NotaProducto?> obtenerNota(int productoId) async {
    final consulta = db.select(db.notasProducto)
      ..where((tabla) => tabla.productoId.equals(productoId));

    final fila = await consulta.getSingleOrNull();

    return fila == null ? null : _convertirNota(fila);
  }
    Future<void> guardarNota(NotaProducto notaProducto) async {
    await db.into(db.notasProducto).insertOnConflictUpdate(
      NotasProductoCompanion.insert(
        productoId: Value(notaProducto.productoId),
        nota: notaProducto.nota,
        prioridad: notaProducto.prioridad,
        actualizadoEn: notaProducto.actualizadoEn,
        pendienteSync: const Value(true),
      ),
    );
  }
    Future<List<NotaProducto>> obtenerPendientes() async {
    final filas = await (db.select(db.notasProducto)
          ..where((tabla) => tabla.pendienteSync.equals(true)))
        .get();

    return filas.map((fila) => _convertirNota(fila)).toList();
  }
    Future<void> marcarSincronizada(int productoId) async {
    await (db.update(db.notasProducto)
          ..where((tabla) => tabla.productoId.equals(productoId)))
        .write(
      const NotasProductoCompanion(
        pendienteSync: Value(false),
      ),
    );
  }
}

