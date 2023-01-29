// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'relation.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RelationAdapter extends TypeAdapter<Relation> {
  @override
  final int typeId = 2;

  @override
  Relation read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Relation(
      from: fields[1] as int,
      task: fields[0] as Task,
    );
  }

  @override
  void write(BinaryWriter writer, Relation obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.task)
      ..writeByte(1)
      ..write(obj.from);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RelationAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
