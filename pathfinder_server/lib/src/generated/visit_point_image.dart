/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

class VisitPointImage extends _i1.TableRow {
  VisitPointImage({
    int? id,
    required this.url,
    this.description,
  }) : super(id);

  factory VisitPointImage.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return VisitPointImage(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      url: serializationManager.deserialize<String>(jsonSerialization['url']),
      description: serializationManager
          .deserialize<String?>(jsonSerialization['description']),
    );
  }

  static final t = VisitPointImageTable();

  String url;

  String? description;

  @override
  String get tableName => 'visit_point_image';
  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'url': url,
      'description': description,
    };
  }

  @override
  Map<String, dynamic> toJsonForDatabase() {
    return {
      'id': id,
      'url': url,
      'description': description,
    };
  }

  @override
  Map<String, dynamic> allToJson() {
    return {
      'id': id,
      'url': url,
      'description': description,
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
      case 'url':
        url = value;
        return;
      case 'description':
        description = value;
        return;
      default:
        throw UnimplementedError();
    }
  }

  static Future<List<VisitPointImage>> find(
    _i1.Session session, {
    VisitPointImageExpressionBuilder? where,
    int? limit,
    int? offset,
    _i1.Column? orderBy,
    List<_i1.Order>? orderByList,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<VisitPointImage>(
      where: where != null ? where(VisitPointImage.t) : null,
      limit: limit,
      offset: offset,
      orderBy: orderBy,
      orderByList: orderByList,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<VisitPointImage?> findSingleRow(
    _i1.Session session, {
    VisitPointImageExpressionBuilder? where,
    int? offset,
    _i1.Column? orderBy,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findSingleRow<VisitPointImage>(
      where: where != null ? where(VisitPointImage.t) : null,
      offset: offset,
      orderBy: orderBy,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<VisitPointImage?> findById(
    _i1.Session session,
    int id,
  ) async {
    return session.db.findById<VisitPointImage>(id);
  }

  static Future<int> delete(
    _i1.Session session, {
    required VisitPointImageExpressionBuilder where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<VisitPointImage>(
      where: where(VisitPointImage.t),
      transaction: transaction,
    );
  }

  static Future<bool> deleteRow(
    _i1.Session session,
    VisitPointImage row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow(
      row,
      transaction: transaction,
    );
  }

  static Future<bool> update(
    _i1.Session session,
    VisitPointImage row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.update(
      row,
      transaction: transaction,
    );
  }

  static Future<void> insert(
    _i1.Session session,
    VisitPointImage row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert(
      row,
      transaction: transaction,
    );
  }

  static Future<int> count(
    _i1.Session session, {
    VisitPointImageExpressionBuilder? where,
    int? limit,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<VisitPointImage>(
      where: where != null ? where(VisitPointImage.t) : null,
      limit: limit,
      useCache: useCache,
      transaction: transaction,
    );
  }
}

typedef VisitPointImageExpressionBuilder = _i1.Expression Function(
    VisitPointImageTable);

class VisitPointImageTable extends _i1.Table {
  VisitPointImageTable() : super(tableName: 'visit_point_image');

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  final id = _i1.ColumnInt('id');

  final url = _i1.ColumnString('url');

  final description = _i1.ColumnString('description');

  @override
  List<_i1.Column> get columns => [
        id,
        url,
        description,
      ];
}

@Deprecated('Use VisitPointImageTable.t instead.')
VisitPointImageTable tVisitPointImage = VisitPointImageTable();
