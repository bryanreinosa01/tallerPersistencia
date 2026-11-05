import 'package:drift/drift.dart';

@DataClassName('NotaProductoFila')
class NotasProducto extends Table {
  IntColumn get productoId => integer()();

  TextColumn get nota => text()();

  IntColumn get prioridad => integer()();

  DateTimeColumn get actualizadoEn => dateTime()();

  BoolColumn get pendienteSync => boolean().withDefault(const Constant(true))();
  @override
  Set<Column> get primaryKey => {productoId};
}
