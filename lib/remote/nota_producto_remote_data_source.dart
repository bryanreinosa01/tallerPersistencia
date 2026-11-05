import 'package:cloud_firestore/cloud_firestore.dart';

import '../nota_producto.dart';

class NotaProductoRemoteDataSource {
  final FirebaseFirestore firestore;

  NotaProductoRemoteDataSource(this.firestore);

    Future<void> guardarNota(NotaProducto nota) async {
    await firestore
        .collection('notas_producto')
        .doc(nota.productoId.toString())
        .set(nota.toJson());
  }
}