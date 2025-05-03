// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'work_site.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WorkSiteAdapter extends TypeAdapter<WorkSite> {
  @override
  final int typeId = 0;

  @override
  WorkSite read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WorkSite(
      id: fields[0] as String,
      name: fields[1] as String,
      dailyWage: fields[2] as double,
      date: fields[3] as DateTime,
      location: fields[4] as String,
      desc: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, WorkSite obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.dailyWage)
      ..writeByte(3)
      ..write(obj.date)
      ..writeByte(4)
      ..write(obj.location)
      ..writeByte(5)
      ..write(obj.desc);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WorkSiteAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
