// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'visited_routes.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class VisitedRoutesAdapter extends TypeAdapter<VisitedRoutes> {
  @override
  final int typeId = 0;

  @override
  VisitedRoutes read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return VisitedRoutes(
      fields[0] as String,
      (fields[1] as List).cast<int>(),
    );
  }

  @override
  void write(BinaryWriter writer, VisitedRoutes obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.routeName)
      ..writeByte(1)
      ..write(obj.visitedIDs);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VisitedRoutesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
