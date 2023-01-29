// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'completed_task.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CompletedTaskAdapter extends TypeAdapter<CompletedTask> {
  @override
  final int typeId = 4;

  @override
  CompletedTask read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CompletedTask(
      title: fields[0] as String,
      completionDate: fields[1] as DateTime,
      timeSpent: fields[2] == null ? '0' : fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, CompletedTask obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.completionDate)
      ..writeByte(2)
      ..write(obj.timeSpent);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CompletedTaskAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
