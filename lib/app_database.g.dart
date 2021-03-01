// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Item extends DataClass implements Insertable<Item> {
  final int id;
  final String descricao;
  final double valor;
  final int quantidade;
  Item(
      {@required this.id,
      @required this.descricao,
      @required this.valor,
      @required this.quantidade});
  factory Item.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final doubleType = db.typeSystem.forDartType<double>();
    return Item(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      descricao: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}descricao']),
      valor:
          doubleType.mapFromDatabaseResponse(data['${effectivePrefix}valor']),
      quantidade:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}quantidade']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || descricao != null) {
      map['descricao'] = Variable<String>(descricao);
    }
    if (!nullToAbsent || valor != null) {
      map['valor'] = Variable<double>(valor);
    }
    if (!nullToAbsent || quantidade != null) {
      map['quantidade'] = Variable<int>(quantidade);
    }
    return map;
  }

  ItemsCompanion toCompanion(bool nullToAbsent) {
    return ItemsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      descricao: descricao == null && nullToAbsent
          ? const Value.absent()
          : Value(descricao),
      valor:
          valor == null && nullToAbsent ? const Value.absent() : Value(valor),
      quantidade: quantidade == null && nullToAbsent
          ? const Value.absent()
          : Value(quantidade),
    );
  }

  factory Item.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Item(
      id: serializer.fromJson<int>(json['id']),
      descricao: serializer.fromJson<String>(json['descricao']),
      valor: serializer.fromJson<double>(json['valor']),
      quantidade: serializer.fromJson<int>(json['quantidade']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'descricao': serializer.toJson<String>(descricao),
      'valor': serializer.toJson<double>(valor),
      'quantidade': serializer.toJson<int>(quantidade),
    };
  }

  Item copyWith({int id, String descricao, double valor, int quantidade}) =>
      Item(
        id: id ?? this.id,
        descricao: descricao ?? this.descricao,
        valor: valor ?? this.valor,
        quantidade: quantidade ?? this.quantidade,
      );
  @override
  String toString() {
    return (StringBuffer('Item(')
          ..write('id: $id, ')
          ..write('descricao: $descricao, ')
          ..write('valor: $valor, ')
          ..write('quantidade: $quantidade')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(id.hashCode,
      $mrjc(descricao.hashCode, $mrjc(valor.hashCode, quantidade.hashCode))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Item &&
          other.id == this.id &&
          other.descricao == this.descricao &&
          other.valor == this.valor &&
          other.quantidade == this.quantidade);
}

class ItemsCompanion extends UpdateCompanion<Item> {
  final Value<int> id;
  final Value<String> descricao;
  final Value<double> valor;
  final Value<int> quantidade;
  const ItemsCompanion({
    this.id = const Value.absent(),
    this.descricao = const Value.absent(),
    this.valor = const Value.absent(),
    this.quantidade = const Value.absent(),
  });
  ItemsCompanion.insert({
    this.id = const Value.absent(),
    @required String descricao,
    this.valor = const Value.absent(),
    this.quantidade = const Value.absent(),
  }) : descricao = Value(descricao);
  static Insertable<Item> custom({
    Expression<int> id,
    Expression<String> descricao,
    Expression<double> valor,
    Expression<int> quantidade,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (descricao != null) 'descricao': descricao,
      if (valor != null) 'valor': valor,
      if (quantidade != null) 'quantidade': quantidade,
    });
  }

  ItemsCompanion copyWith(
      {Value<int> id,
      Value<String> descricao,
      Value<double> valor,
      Value<int> quantidade}) {
    return ItemsCompanion(
      id: id ?? this.id,
      descricao: descricao ?? this.descricao,
      valor: valor ?? this.valor,
      quantidade: quantidade ?? this.quantidade,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (descricao.present) {
      map['descricao'] = Variable<String>(descricao.value);
    }
    if (valor.present) {
      map['valor'] = Variable<double>(valor.value);
    }
    if (quantidade.present) {
      map['quantidade'] = Variable<int>(quantidade.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ItemsCompanion(')
          ..write('id: $id, ')
          ..write('descricao: $descricao, ')
          ..write('valor: $valor, ')
          ..write('quantidade: $quantidade')
          ..write(')'))
        .toString();
  }
}

class $ItemsTable extends Items with TableInfo<$ItemsTable, Item> {
  final GeneratedDatabase _db;
  final String _alias;
  $ItemsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _descricaoMeta = const VerificationMeta('descricao');
  GeneratedTextColumn _descricao;
  @override
  GeneratedTextColumn get descricao => _descricao ??= _constructDescricao();
  GeneratedTextColumn _constructDescricao() {
    return GeneratedTextColumn('descricao', $tableName, false,
        minTextLength: 1, maxTextLength: 30);
  }

  final VerificationMeta _valorMeta = const VerificationMeta('valor');
  GeneratedRealColumn _valor;
  @override
  GeneratedRealColumn get valor => _valor ??= _constructValor();
  GeneratedRealColumn _constructValor() {
    return GeneratedRealColumn('valor', $tableName, false,
        defaultValue: Constant(0));
  }

  final VerificationMeta _quantidadeMeta = const VerificationMeta('quantidade');
  GeneratedIntColumn _quantidade;
  @override
  GeneratedIntColumn get quantidade => _quantidade ??= _constructQuantidade();
  GeneratedIntColumn _constructQuantidade() {
    return GeneratedIntColumn('quantidade', $tableName, false,
        defaultValue: Constant(0));
  }

  @override
  List<GeneratedColumn> get $columns => [id, descricao, valor, quantidade];
  @override
  $ItemsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'items';
  @override
  final String actualTableName = 'items';
  @override
  VerificationContext validateIntegrity(Insertable<Item> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('descricao')) {
      context.handle(_descricaoMeta,
          descricao.isAcceptableOrUnknown(data['descricao'], _descricaoMeta));
    } else if (isInserting) {
      context.missing(_descricaoMeta);
    }
    if (data.containsKey('valor')) {
      context.handle(
          _valorMeta, valor.isAcceptableOrUnknown(data['valor'], _valorMeta));
    }
    if (data.containsKey('quantidade')) {
      context.handle(
          _quantidadeMeta,
          quantidade.isAcceptableOrUnknown(
              data['quantidade'], _quantidadeMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Item map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Item.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $ItemsTable createAlias(String alias) {
    return $ItemsTable(_db, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $ItemsTable _items;
  $ItemsTable get items => _items ??= $ItemsTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [items];
}
