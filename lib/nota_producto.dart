class NotaProducto {
  final int productoId;
  final String nota;
  final int prioridad;
  final DateTime actualizadoEn;
  final bool pendienteSync;

  const NotaProducto({
    required this.productoId,
    required this.nota,
    required this.prioridad,
    required this.actualizadoEn,
    this.pendienteSync = true,
  });

  Map<String, dynamic> toJson() {
    return {
      'productoId': productoId,
      'nota': nota,
      'prioridad': prioridad,
      'actualizadoEn': actualizadoEn.toIso8601String(),
    };
  }
}