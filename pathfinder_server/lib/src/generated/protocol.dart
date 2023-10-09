/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

library protocol; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:serverpod/serverpod.dart' as _i1;
import 'package:serverpod/protocol.dart' as _i2;
import 'route.dart' as _i3;
import 'visit_point.dart' as _i4;
import 'visit_point_image.dart' as _i5;
import 'protocol.dart' as _i6;
import 'package:pathfinder_server/src/generated/route.dart' as _i7;
export 'route.dart';
export 'visit_point.dart';
export 'visit_point_image.dart';

class Protocol extends _i1.SerializationManagerServer {
  Protocol._();

  factory Protocol() => _instance;

  static final Map<Type, _i1.constructor> customConstructors = {};

  static final Protocol _instance = Protocol._();

  static final targetDatabaseDefinition = _i2.DatabaseDefinition(tables: [
    _i2.TableDefinition(
      name: 'pathfinder_route',
      schema: 'public',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.integer,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'pathfinder_route_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'name',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'description',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'points',
          columnType: _i2.ColumnType.json,
          isNullable: false,
          dartType: 'List<protocol:VisitPoint?>',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'pathfinder_route_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'visit_point',
      schema: 'public',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.integer,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'visit_point_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'name',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'description',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'images',
          columnType: _i2.ColumnType.json,
          isNullable: false,
          dartType: 'List<protocol:VisitPointImage?>',
        ),
        _i2.ColumnDefinition(
          name: 'long',
          columnType: _i2.ColumnType.doublePrecision,
          isNullable: false,
          dartType: 'double',
        ),
        _i2.ColumnDefinition(
          name: 'lat',
          columnType: _i2.ColumnType.doublePrecision,
          isNullable: false,
          dartType: 'double',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'visit_point_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'visit_point_image',
      schema: 'public',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.integer,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'visit_point_image_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'url',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'description',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'visit_point_image_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    ..._i2.Protocol.targetDatabaseDefinition.tables,
  ]);

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;
    if (customConstructors.containsKey(t)) {
      return customConstructors[t]!(data, this) as T;
    }
    if (t == _i3.PathfinderRoute) {
      return _i3.PathfinderRoute.fromJson(data, this) as T;
    }
    if (t == _i4.VisitPoint) {
      return _i4.VisitPoint.fromJson(data, this) as T;
    }
    if (t == _i5.VisitPointImage) {
      return _i5.VisitPointImage.fromJson(data, this) as T;
    }
    if (t == _i1.getType<_i3.PathfinderRoute?>()) {
      return (data != null ? _i3.PathfinderRoute.fromJson(data, this) : null)
          as T;
    }
    if (t == _i1.getType<_i4.VisitPoint?>()) {
      return (data != null ? _i4.VisitPoint.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i5.VisitPointImage?>()) {
      return (data != null ? _i5.VisitPointImage.fromJson(data, this) : null)
          as T;
    }
    if (t == List<_i6.VisitPoint?>) {
      return (data as List).map((e) => deserialize<_i6.VisitPoint?>(e)).toList()
          as dynamic;
    }
    if (t == List<_i6.VisitPointImage?>) {
      return (data as List)
          .map((e) => deserialize<_i6.VisitPointImage?>(e))
          .toList() as dynamic;
    }
    if (t == List<_i7.PathfinderRoute>) {
      return (data as List)
          .map((e) => deserialize<_i7.PathfinderRoute>(e))
          .toList() as dynamic;
    }
    try {
      return _i2.Protocol().deserialize<T>(data, t);
    } catch (_) {}
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object data) {
    if (data is _i3.PathfinderRoute) {
      return 'PathfinderRoute';
    }
    if (data is _i4.VisitPoint) {
      return 'VisitPoint';
    }
    if (data is _i5.VisitPointImage) {
      return 'VisitPointImage';
    }
    return super.getClassNameForObject(data);
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    if (data['className'] == 'PathfinderRoute') {
      return deserialize<_i3.PathfinderRoute>(data['data']);
    }
    if (data['className'] == 'VisitPoint') {
      return deserialize<_i4.VisitPoint>(data['data']);
    }
    if (data['className'] == 'VisitPointImage') {
      return deserialize<_i5.VisitPointImage>(data['data']);
    }
    return super.deserializeByClassName(data);
  }

  @override
  _i1.Table? getTableForType(Type t) {
    {
      var table = _i2.Protocol().getTableForType(t);
      if (table != null) {
        return table;
      }
    }
    switch (t) {
      case _i3.PathfinderRoute:
        return _i3.PathfinderRoute.t;
      case _i4.VisitPoint:
        return _i4.VisitPoint.t;
      case _i5.VisitPointImage:
        return _i5.VisitPointImage.t;
    }
    return null;
  }

  @override
  _i2.DatabaseDefinition getTargetDatabaseDefinition() =>
      targetDatabaseDefinition;
}
