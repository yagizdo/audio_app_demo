// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'audio_cache_info.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AudioCacheInfoAdapter extends TypeAdapter<AudioCacheInfo> {
  @override
  final int typeId = 0;

  @override
  AudioCacheInfo read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AudioCacheInfo(
      fields[0] as String,
      fields[1] as int,
    );
  }

  @override
  void write(BinaryWriter writer, AudioCacheInfo obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.audioName)
      ..writeByte(1)
      ..write(obj.currentPositionInSeconds);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AudioCacheInfoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
