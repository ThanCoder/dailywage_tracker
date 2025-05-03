// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'work_log.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WorkLogAdapter extends TypeAdapter<WorkLog> {
  @override
  final int typeId = 1;

  @override
  WorkLog read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WorkLog(
      id: fields[0] as String,
      workSiteId: fields[1] as String,
      dailyWage: fields[4] as double,
      date: fields[5] as DateTime,
      morningWorked: fields[2] as bool,
      eveningWorked: fields[3] as bool,
      isPaid: fields[6] as bool,
      paidDate: fields[7] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, WorkLog obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.workSiteId)
      ..writeByte(2)
      ..write(obj.morningWorked)
      ..writeByte(3)
      ..write(obj.eveningWorked)
      ..writeByte(4)
      ..write(obj.dailyWage)
      ..writeByte(5)
      ..write(obj.date)
      ..writeByte(6)
      ..write(obj.isPaid)
      ..writeByte(7)
      ..write(obj.paidDate);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WorkLogAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
