// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $NotasProductoTable extends NotasProducto
    with TableInfo<$NotasProductoTable, NotaProductoFila> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $NotasProductoTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _productoIdMeta = const VerificationMeta(
    'productoId',
  );
  @override
  late final GeneratedColumn<int> productoId = GeneratedColumn<int>(
    'producto_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _notaMeta = const VerificationMeta('nota');
  @override
  late final GeneratedColumn<String> nota = GeneratedColumn<String>(
    'nota',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _prioridadMeta = const VerificationMeta(
    'prioridad',
  );
  @override
  late final GeneratedColumn<int> prioridad = GeneratedColumn<int>(
    'prioridad',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _actualizadoEnMeta = const VerificationMeta(
    'actualizadoEn',
  );
  @override
  late final GeneratedColumn<DateTime> actualizadoEn =
      GeneratedColumn<DateTime>(
        'actualizado_en',
        aliasedName,
        false,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _pendienteSyncMeta = const VerificationMeta(
    'pendienteSync',
  );
  @override
  late final GeneratedColumn<bool> pendienteSync = GeneratedColumn<bool>(
    'pendiente_sync',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("pendiente_sync" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  @override
  List<GeneratedColumn> get $columns => [
    productoId,
    nota,
    prioridad,
    actualizadoEn,
    pendienteSync,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'notas_producto';
  @override
  VerificationContext validateIntegrity(
    Insertable<NotaProductoFila> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('producto_id')) {
      context.handle(
        _productoIdMeta,
        productoId.isAcceptableOrUnknown(data['producto_id']!, _productoIdMeta),
      );
    }
    if (data.containsKey('nota')) {
      context.handle(
        _notaMeta,
        nota.isAcceptableOrUnknown(data['nota']!, _notaMeta),
      );
    } else if (isInserting) {
      context.missing(_notaMeta);
    }
    if (data.containsKey('prioridad')) {
      context.handle(
        _prioridadMeta,
        prioridad.isAcceptableOrUnknown(data['prioridad']!, _prioridadMeta),
      );
    } else if (isInserting) {
      context.missing(_prioridadMeta);
    }
    if (data.containsKey('actualizado_en')) {
      context.handle(
        _actualizadoEnMeta,
        actualizadoEn.isAcceptableOrUnknown(
          data['actualizado_en']!,
          _actualizadoEnMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_actualizadoEnMeta);
    }
    if (data.containsKey('pendiente_sync')) {
      context.handle(
        _pendienteSyncMeta,
        pendienteSync.isAcceptableOrUnknown(
          data['pendiente_sync']!,
          _pendienteSyncMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {productoId};
  @override
  NotaProductoFila map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return NotaProductoFila(
      productoId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}producto_id'],
      )!,
      nota: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}nota'],
      )!,
      prioridad: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}prioridad'],
      )!,
      actualizadoEn: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}actualizado_en'],
      )!,
      pendienteSync: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}pendiente_sync'],
      )!,
    );
  }

  @override
  $NotasProductoTable createAlias(String alias) {
    return $NotasProductoTable(attachedDatabase, alias);
  }
}

class NotaProductoFila extends DataClass
    implements Insertable<NotaProductoFila> {
  final int productoId;
  final String nota;
  final int prioridad;
  final DateTime actualizadoEn;
  final bool pendienteSync;
  const NotaProductoFila({
    required this.productoId,
    required this.nota,
    required this.prioridad,
    required this.actualizadoEn,
    required this.pendienteSync,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['producto_id'] = Variable<int>(productoId);
    map['nota'] = Variable<String>(nota);
    map['prioridad'] = Variable<int>(prioridad);
    map['actualizado_en'] = Variable<DateTime>(actualizadoEn);
    map['pendiente_sync'] = Variable<bool>(pendienteSync);
    return map;
  }

  NotasProductoCompanion toCompanion(bool nullToAbsent) {
    return NotasProductoCompanion(
      productoId: Value(productoId),
      nota: Value(nota),
      prioridad: Value(prioridad),
      actualizadoEn: Value(actualizadoEn),
      pendienteSync: Value(pendienteSync),
    );
  }

  factory NotaProductoFila.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return NotaProductoFila(
      productoId: serializer.fromJson<int>(json['productoId']),
      nota: serializer.fromJson<String>(json['nota']),
      prioridad: serializer.fromJson<int>(json['prioridad']),
      actualizadoEn: serializer.fromJson<DateTime>(json['actualizadoEn']),
      pendienteSync: serializer.fromJson<bool>(json['pendienteSync']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'productoId': serializer.toJson<int>(productoId),
      'nota': serializer.toJson<String>(nota),
      'prioridad': serializer.toJson<int>(prioridad),
      'actualizadoEn': serializer.toJson<DateTime>(actualizadoEn),
      'pendienteSync': serializer.toJson<bool>(pendienteSync),
    };
  }

  NotaProductoFila copyWith({
    int? productoId,
    String? nota,
    int? prioridad,
    DateTime? actualizadoEn,
    bool? pendienteSync,
  }) => NotaProductoFila(
    productoId: productoId ?? this.productoId,
    nota: nota ?? this.nota,
    prioridad: prioridad ?? this.prioridad,
    actualizadoEn: actualizadoEn ?? this.actualizadoEn,
    pendienteSync: pendienteSync ?? this.pendienteSync,
  );
  NotaProductoFila copyWithCompanion(NotasProductoCompanion data) {
    return NotaProductoFila(
      productoId: data.productoId.present
          ? data.productoId.value
          : this.productoId,
      nota: data.nota.present ? data.nota.value : this.nota,
      prioridad: data.prioridad.present ? data.prioridad.value : this.prioridad,
      actualizadoEn: data.actualizadoEn.present
          ? data.actualizadoEn.value
          : this.actualizadoEn,
      pendienteSync: data.pendienteSync.present
          ? data.pendienteSync.value
          : this.pendienteSync,
    );
  }

  @override
  String toString() {
    return (StringBuffer('NotaProductoFila(')
          ..write('productoId: $productoId, ')
          ..write('nota: $nota, ')
          ..write('prioridad: $prioridad, ')
          ..write('actualizadoEn: $actualizadoEn, ')
          ..write('pendienteSync: $pendienteSync')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(productoId, nota, prioridad, actualizadoEn, pendienteSync);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is NotaProductoFila &&
          other.productoId == this.productoId &&
          other.nota == this.nota &&
          other.prioridad == this.prioridad &&
          other.actualizadoEn == this.actualizadoEn &&
          other.pendienteSync == this.pendienteSync);
}

class NotasProductoCompanion extends UpdateCompanion<NotaProductoFila> {
  final Value<int> productoId;
  final Value<String> nota;
  final Value<int> prioridad;
  final Value<DateTime> actualizadoEn;
  final Value<bool> pendienteSync;
  const NotasProductoCompanion({
    this.productoId = const Value.absent(),
    this.nota = const Value.absent(),
    this.prioridad = const Value.absent(),
    this.actualizadoEn = const Value.absent(),
    this.pendienteSync = const Value.absent(),
  });
  NotasProductoCompanion.insert({
    this.productoId = const Value.absent(),
    required String nota,
    required int prioridad,
    required DateTime actualizadoEn,
    this.pendienteSync = const Value.absent(),
  }) : nota = Value(nota),
       prioridad = Value(prioridad),
       actualizadoEn = Value(actualizadoEn);
  static Insertable<NotaProductoFila> custom({
    Expression<int>? productoId,
    Expression<String>? nota,
    Expression<int>? prioridad,
    Expression<DateTime>? actualizadoEn,
    Expression<bool>? pendienteSync,
  }) {
    return RawValuesInsertable({
      if (productoId != null) 'producto_id': productoId,
      if (nota != null) 'nota': nota,
      if (prioridad != null) 'prioridad': prioridad,
      if (actualizadoEn != null) 'actualizado_en': actualizadoEn,
      if (pendienteSync != null) 'pendiente_sync': pendienteSync,
    });
  }

  NotasProductoCompanion copyWith({
    Value<int>? productoId,
    Value<String>? nota,
    Value<int>? prioridad,
    Value<DateTime>? actualizadoEn,
    Value<bool>? pendienteSync,
  }) {
    return NotasProductoCompanion(
      productoId: productoId ?? this.productoId,
      nota: nota ?? this.nota,
      prioridad: prioridad ?? this.prioridad,
      actualizadoEn: actualizadoEn ?? this.actualizadoEn,
      pendienteSync: pendienteSync ?? this.pendienteSync,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (productoId.present) {
      map['producto_id'] = Variable<int>(productoId.value);
    }
    if (nota.present) {
      map['nota'] = Variable<String>(nota.value);
    }
    if (prioridad.present) {
      map['prioridad'] = Variable<int>(prioridad.value);
    }
    if (actualizadoEn.present) {
      map['actualizado_en'] = Variable<DateTime>(actualizadoEn.value);
    }
    if (pendienteSync.present) {
      map['pendiente_sync'] = Variable<bool>(pendienteSync.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NotasProductoCompanion(')
          ..write('productoId: $productoId, ')
          ..write('nota: $nota, ')
          ..write('prioridad: $prioridad, ')
          ..write('actualizadoEn: $actualizadoEn, ')
          ..write('pendienteSync: $pendienteSync')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $NotasProductoTable notasProducto = $NotasProductoTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [notasProducto];
}

typedef $$NotasProductoTableCreateCompanionBuilder =
    NotasProductoCompanion Function({
      Value<int> productoId,
      required String nota,
      required int prioridad,
      required DateTime actualizadoEn,
      Value<bool> pendienteSync,
    });
typedef $$NotasProductoTableUpdateCompanionBuilder =
    NotasProductoCompanion Function({
      Value<int> productoId,
      Value<String> nota,
      Value<int> prioridad,
      Value<DateTime> actualizadoEn,
      Value<bool> pendienteSync,
    });

class $$NotasProductoTableFilterComposer
    extends Composer<_$AppDatabase, $NotasProductoTable> {
  $$NotasProductoTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get productoId => $composableBuilder(
    column: $table.productoId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nota => $composableBuilder(
    column: $table.nota,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get prioridad => $composableBuilder(
    column: $table.prioridad,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get actualizadoEn => $composableBuilder(
    column: $table.actualizadoEn,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get pendienteSync => $composableBuilder(
    column: $table.pendienteSync,
    builder: (column) => ColumnFilters(column),
  );
}

class $$NotasProductoTableOrderingComposer
    extends Composer<_$AppDatabase, $NotasProductoTable> {
  $$NotasProductoTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get productoId => $composableBuilder(
    column: $table.productoId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nota => $composableBuilder(
    column: $table.nota,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get prioridad => $composableBuilder(
    column: $table.prioridad,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get actualizadoEn => $composableBuilder(
    column: $table.actualizadoEn,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get pendienteSync => $composableBuilder(
    column: $table.pendienteSync,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$NotasProductoTableAnnotationComposer
    extends Composer<_$AppDatabase, $NotasProductoTable> {
  $$NotasProductoTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get productoId => $composableBuilder(
    column: $table.productoId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get nota =>
      $composableBuilder(column: $table.nota, builder: (column) => column);

  GeneratedColumn<int> get prioridad =>
      $composableBuilder(column: $table.prioridad, builder: (column) => column);

  GeneratedColumn<DateTime> get actualizadoEn => $composableBuilder(
    column: $table.actualizadoEn,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get pendienteSync => $composableBuilder(
    column: $table.pendienteSync,
    builder: (column) => column,
  );
}

class $$NotasProductoTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $NotasProductoTable,
          NotaProductoFila,
          $$NotasProductoTableFilterComposer,
          $$NotasProductoTableOrderingComposer,
          $$NotasProductoTableAnnotationComposer,
          $$NotasProductoTableCreateCompanionBuilder,
          $$NotasProductoTableUpdateCompanionBuilder,
          (
            NotaProductoFila,
            BaseReferences<
              _$AppDatabase,
              $NotasProductoTable,
              NotaProductoFila
            >,
          ),
          NotaProductoFila,
          PrefetchHooks Function()
        > {
  $$NotasProductoTableTableManager(_$AppDatabase db, $NotasProductoTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$NotasProductoTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$NotasProductoTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$NotasProductoTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> productoId = const Value.absent(),
                Value<String> nota = const Value.absent(),
                Value<int> prioridad = const Value.absent(),
                Value<DateTime> actualizadoEn = const Value.absent(),
                Value<bool> pendienteSync = const Value.absent(),
              }) => NotasProductoCompanion(
                productoId: productoId,
                nota: nota,
                prioridad: prioridad,
                actualizadoEn: actualizadoEn,
                pendienteSync: pendienteSync,
              ),
          createCompanionCallback:
              ({
                Value<int> productoId = const Value.absent(),
                required String nota,
                required int prioridad,
                required DateTime actualizadoEn,
                Value<bool> pendienteSync = const Value.absent(),
              }) => NotasProductoCompanion.insert(
                productoId: productoId,
                nota: nota,
                prioridad: prioridad,
                actualizadoEn: actualizadoEn,
                pendienteSync: pendienteSync,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$NotasProductoTable, NotaProductoFila>(table),
                  BaseReferences<
                    _$AppDatabase,
                    $NotasProductoTable,
                    NotaProductoFila
                  >(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$NotasProductoTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $NotasProductoTable,
      NotaProductoFila,
      $$NotasProductoTableFilterComposer,
      $$NotasProductoTableOrderingComposer,
      $$NotasProductoTableAnnotationComposer,
      $$NotasProductoTableCreateCompanionBuilder,
      $$NotasProductoTableUpdateCompanionBuilder,
      (
        NotaProductoFila,
        BaseReferences<_$AppDatabase, $NotasProductoTable, NotaProductoFila>,
      ),
      NotaProductoFila,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$NotasProductoTableTableManager get notasProducto =>
      $$NotasProductoTableTableManager(_db, _db.notasProducto);
}
