// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BoardCardAdapter extends TypeAdapter<BoardCard> {
  @override
  final int typeId = 1;

  @override
  BoardCard read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BoardCard(
      title: fields[1] as String,
      tasks: (fields[0] as List).cast<Task>(),
    );
  }

  @override
  void write(BinaryWriter writer, BoardCard obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.tasks)
      ..writeByte(1)
      ..write(obj.title);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BoardCardAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
