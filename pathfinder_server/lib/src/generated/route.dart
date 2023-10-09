/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import 'protocol.dart' as _i2;

class PathfinderRoute extends _i1.TableRow {
  PathfinderRoute({
    int? id,
    required this.name,
    required this.description,
    required this.points,
  }) : super(id);

  factory PathfinderRoute.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return PathfinderRoute(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      name: serializationManager.deserialize<String>(jsonSerialization['name']),
      description: serializationManager
          .deserialize<String>(jsonSerialization['description']),
      points: serializationManager
          .deserialize<List<_i2.VisitPoint?>>(jsonSerialization['points']),
    );
  }

  static final t = PathfinderRouteTable();

  String name;

  String description;

  List<_i2.VisitPoint?> points;

  @override
  String get tableName => 'pathfinder_route';
  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'points': points,
    };
  }

  @override
  Map<String, dynamic> toJsonForDatabase() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'points': points,
    };
  }

  @override
  Map<String, dynamic> allToJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'points': points,
    };
  }

  @override
  void setColumn(
    String columnName,
    value,
  ) {
    switch (columnName) {
      case 'id':
        id = value;
        return;
      case 'name':
        name = value;
        return;
      case 'description':
        description = value;
        return;
      case 'points':
        points = value;
        return;
      default:
        throw UnimplementedError();
    }
  }

  static Future<List<PathfinderRoute>> find(
    _i1.Session session, {
    PathfinderRouteExpressionBuilder? where,
    int? limit,
    int? offset,
    _i1.Column? orderBy,
    List<_i1.Order>? orderByList,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<PathfinderRoute>(
      where: where != null ? where(PathfinderRoute.t) : null,
      limit: limit,
      offset: offset,
      orderBy: orderBy,
      orderByList: orderByList,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<PathfinderRoute?> findSingleRow(
    _i1.Session session, {
    PathfinderRouteExpressionBuilder? where,
    int? offset,
    _i1.Column? orderBy,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findSingleRow<PathfinderRoute>(
      where: where != null ? where(PathfinderRoute.t) : null,
      offset: offset,
      orderBy: orderBy,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<PathfinderRoute?> findById(
    _i1.Session session,
    int id,
  ) async {
    return session.db.findById<PathfinderRoute>(id);
  }

  static Future<int> delete(
    _i1.Session session, {
    required PathfinderRouteExpressionBuilder where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<PathfinderRoute>(
      where: where(PathfinderRoute.t),
      transaction: transaction,
    );
  }

  static Future<bool> deleteRow(
    _i1.Session session,
    PathfinderRoute row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow(
      row,
      transaction: transaction,
    );
  }

  static Future<bool> update(
    _i1.Session session,
    PathfinderRoute row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.update(
      row,
      transaction: transaction,
    );
  }

  static Future<void> insert(
    _i1.Session session,
    PathfinderRoute row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert(
      row,
      transaction: transaction,
    );
  }

  static Future<int> count(
    _i1.Session session, {
    PathfinderRouteExpressionBuilder? where,
    int? limit,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<PathfinderRoute>(
      where: where != null ? where(PathfinderRoute.t) : null,
      limit: limit,
      useCache: useCache,
      transaction: transaction,
    );
  }
}

typedef PathfinderRouteExpressionBuilder = _i1.Expression Function(
    PathfinderRouteTable);

class PathfinderRouteTable extends _i1.Table {
  PathfinderRouteTable() : super(tableName: 'pathfinder_route');

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  final id = _i1.ColumnInt('id');

  final name = _i1.ColumnString('name');

  final description = _i1.ColumnString('description');

  final points = _i1.ColumnSerializable('points');

  @override
  List<_i1.Column> get columns => [
        id,
        name,
        description,
        points,
      ];
}

@Deprecated('Use PathfinderRouteTable.t instead.')
PathfinderRouteTable tPathfinderRoute = PathfinderRouteTable();
