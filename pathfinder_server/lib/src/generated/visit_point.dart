/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import 'protocol.dart' as _i2;

class VisitPoint extends _i1.TableRow {
  VisitPoint({
    int? id,
    required this.name,
    this.description,
    required this.images,
    required this.lang,
    required this.lat,
  }) : super(id);

  factory VisitPoint.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return VisitPoint(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      name: serializationManager.deserialize<String>(jsonSerialization['name']),
      description: serializationManager
          .deserialize<String?>(jsonSerialization['description']),
      images: serializationManager
          .deserialize<List<_i2.VisitPointImage?>>(jsonSerialization['images']),
      lang: serializationManager.deserialize<double>(jsonSerialization['lang']),
      lat: serializationManager.deserialize<double>(jsonSerialization['lat']),
    );
  }

  static final t = VisitPointTable();

  String name;

  String? description;

  List<_i2.VisitPointImage?> images;

  double lang;

  double lat;

  @override
  String get tableName => 'visit_point';
  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'images': images,
      'lang': lang,
      'lat': lat,
    };
  }

  @override
  Map<String, dynamic> toJsonForDatabase() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'images': images,
      'lang': lang,
      'lat': lat,
    };
  }

  @override
  Map<String, dynamic> allToJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'images': images,
      'lang': lang,
      'lat': lat,
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
      case 'images':
        images = value;
        return;
      case 'lang':
        lang = value;
        return;
      case 'lat':
        lat = value;
        return;
      default:
        throw UnimplementedError();
    }
  }

  static Future<List<VisitPoint>> find(
    _i1.Session session, {
    VisitPointExpressionBuilder? where,
    int? limit,
    int? offset,
    _i1.Column? orderBy,
    List<_i1.Order>? orderByList,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<VisitPoint>(
      where: where != null ? where(VisitPoint.t) : null,
      limit: limit,
      offset: offset,
      orderBy: orderBy,
      orderByList: orderByList,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<VisitPoint?> findSingleRow(
    _i1.Session session, {
    VisitPointExpressionBuilder? where,
    int? offset,
    _i1.Column? orderBy,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findSingleRow<VisitPoint>(
      where: where != null ? where(VisitPoint.t) : null,
      offset: offset,
      orderBy: orderBy,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<VisitPoint?> findById(
    _i1.Session session,
    int id,
  ) async {
    return session.db.findById<VisitPoint>(id);
  }

  static Future<int> delete(
    _i1.Session session, {
    required VisitPointExpressionBuilder where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<VisitPoint>(
      where: where(VisitPoint.t),
      transaction: transaction,
    );
  }

  static Future<bool> deleteRow(
    _i1.Session session,
    VisitPoint row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow(
      row,
      transaction: transaction,
    );
  }

  static Future<bool> update(
    _i1.Session session,
    VisitPoint row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.update(
      row,
      transaction: transaction,
    );
  }

  static Future<void> insert(
    _i1.Session session,
    VisitPoint row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert(
      row,
      transaction: transaction,
    );
  }

  static Future<int> count(
    _i1.Session session, {
    VisitPointExpressionBuilder? where,
    int? limit,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<VisitPoint>(
      where: where != null ? where(VisitPoint.t) : null,
      limit: limit,
      useCache: useCache,
      transaction: transaction,
    );
  }
}

typedef VisitPointExpressionBuilder = _i1.Expression Function(VisitPointTable);

class VisitPointTable extends _i1.Table {
  VisitPointTable() : super(tableName: 'visit_point');

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  final id = _i1.ColumnInt('id');

  final name = _i1.ColumnString('name');

  final description = _i1.ColumnString('description');

  final images = _i1.ColumnSerializable('images');

  final lang = _i1.ColumnDouble('lang');

  final lat = _i1.ColumnDouble('lat');

  @override
  List<_i1.Column> get columns => [
        id,
        name,
        description,
        images,
        lang,
        lat,
      ];
}

@Deprecated('Use VisitPointTable.t instead.')
VisitPointTable tVisitPoint = VisitPointTable();
