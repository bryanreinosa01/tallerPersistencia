import '../local/nota_producto_local_data_source.dart';
import '../nota_producto.dart';
import '../remote/nota_producto_remote_data_source.dart';

class NotaProductoRepository {
    final NotaProductoLocalDataSource local;
  final NotaProductoRemoteDataSource? remote;

  NotaProductoRepository(this.local, {this.remote});
    Future<NotaProducto?> obtenerNota(int productoId) {
    return local.obtenerNota(productoId);
  }
      Future<void> guardarNota(NotaProducto nota) async {
    await local.guardarNota(nota);

    final remoto = remote;
    if (remoto == null) return;

    try {
      await remoto.guardarNota(nota);
      await local.marcarSincronizada(nota.productoId);
    } catch (error) {
      // La nota permanece guardada localmente y pendiente de sincronizar.
    }
  }
    Future<void> sincronizarPendientes() async {
    final remoto = remote;
    if (remoto == null) return;

    final pendientes = await local.obtenerPendientes();

    for (final nota in pendientes) {
      try {
        await remoto.guardarNota(nota);
        await local.marcarSincronizada(nota.productoId);
      } catch (error) {
        // Esta nota sigue pendiente para otro intento.
      }
    }
  }
}