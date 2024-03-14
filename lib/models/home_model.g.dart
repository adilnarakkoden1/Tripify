// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HomeModelAdapter extends TypeAdapter<HomeModel> {
  @override
  final int typeId = 1;

  @override
  HomeModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HomeModel(
      id: fields[0] as int?,
      source: fields[1] as String,
      destination: fields[2] as String,
      type: fields[3] as String,
      startdate: fields[4] as DateTime,
      enddate: fields[5] as DateTime,
      passenger: fields[6] as String,
      time: fields[7] as DateTime,
      category: fields[8] as String,
      favourite: fields[9] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, HomeModel obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.source)
      ..writeByte(2)
      ..write(obj.destination)
      ..writeByte(3)
      ..write(obj.type)
      ..writeByte(4)
      ..write(obj.startdate)
      ..writeByte(5)
      ..write(obj.enddate)
      ..writeByte(6)
      ..write(obj.passenger)
      ..writeByte(7)
      ..write(obj.time)
      ..writeByte(8)
      ..write(obj.category)
      ..writeByte(9)
      ..write(obj.favourite);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HomeModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
