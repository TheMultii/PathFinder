/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

library protocol; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'route.dart' as _i2;
import 'visit_point.dart' as _i3;
import 'visit_point_image.dart' as _i4;
import 'protocol.dart' as _i5;
import 'package:pathfinder_client/src/protocol/visit_point_image.dart' as _i6;
export 'route.dart';
export 'visit_point.dart';
export 'visit_point_image.dart';
export 'client.dart';

class Protocol extends _i1.SerializationManager {
  Protocol._();

  factory Protocol() => _instance;

  static final Map<Type, _i1.constructor> customConstructors = {};

  static final Protocol _instance = Protocol._();

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;
    if (customConstructors.containsKey(t)) {
      return customConstructors[t]!(data, this) as T;
    }
    if (t == _i2.PathfinderRoute) {
      return _i2.PathfinderRoute.fromJson(data, this) as T;
    }
    if (t == _i3.VisitPoint) {
      return _i3.VisitPoint.fromJson(data, this) as T;
    }
    if (t == _i4.VisitPointImage) {
      return _i4.VisitPointImage.fromJson(data, this) as T;
    }
    if (t == _i1.getType<_i2.PathfinderRoute?>()) {
      return (data != null ? _i2.PathfinderRoute.fromJson(data, this) : null)
          as T;
    }
    if (t == _i1.getType<_i3.VisitPoint?>()) {
      return (data != null ? _i3.VisitPoint.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i4.VisitPointImage?>()) {
      return (data != null ? _i4.VisitPointImage.fromJson(data, this) : null)
          as T;
    }
    if (t == List<_i5.VisitPoint?>) {
      return (data as List).map((e) => deserialize<_i5.VisitPoint?>(e)).toList()
          as dynamic;
    }
    if (t == List<_i5.VisitPointImage?>) {
      return (data as List)
          .map((e) => deserialize<_i5.VisitPointImage?>(e))
          .toList() as dynamic;
    }
    if (t == List<_i6.VisitPointImage>) {
      return (data as List)
          .map((e) => deserialize<_i6.VisitPointImage>(e))
          .toList() as dynamic;
    }
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object data) {
    if (data is _i2.PathfinderRoute) {
      return 'PathfinderRoute';
    }
    if (data is _i3.VisitPoint) {
      return 'VisitPoint';
    }
    if (data is _i4.VisitPointImage) {
      return 'VisitPointImage';
    }
    return super.getClassNameForObject(data);
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    if (data['className'] == 'PathfinderRoute') {
      return deserialize<_i2.PathfinderRoute>(data['data']);
    }
    if (data['className'] == 'VisitPoint') {
      return deserialize<_i3.VisitPoint>(data['data']);
    }
    if (data['className'] == 'VisitPointImage') {
      return deserialize<_i4.VisitPointImage>(data['data']);
    }
    return super.deserializeByClassName(data);
  }
}
