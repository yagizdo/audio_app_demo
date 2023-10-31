// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PlayerController on PlayerControllerBase, Store {
  late final _$positionStreamAtom =
      Atom(name: 'PlayerControllerBase.positionStream', context: context);

  @override
  ObservableStream<Duration>? get positionStream {
    _$positionStreamAtom.reportRead();
    return super.positionStream;
  }

  @override
  set positionStream(ObservableStream<Duration>? value) {
    _$positionStreamAtom.reportWrite(value, super.positionStream, () {
      super.positionStream = value;
    });
  }

  late final _$positionDataStreamAtom =
      Atom(name: 'PlayerControllerBase.positionDataStream', context: context);

  @override
  Stream<PositionData>? get positionDataStream {
    _$positionDataStreamAtom.reportRead();
    return super.positionDataStream;
  }

  @override
  set positionDataStream(Stream<PositionData>? value) {
    _$positionDataStreamAtom.reportWrite(value, super.positionDataStream, () {
      super.positionDataStream = value;
    });
  }

  late final _$bufferedPositionStreamAtom = Atom(
      name: 'PlayerControllerBase.bufferedPositionStream', context: context);

  @override
  ObservableStream<Duration>? get bufferedPositionStream {
    _$bufferedPositionStreamAtom.reportRead();
    return super.bufferedPositionStream;
  }

  @override
  set bufferedPositionStream(ObservableStream<Duration>? value) {
    _$bufferedPositionStreamAtom
        .reportWrite(value, super.bufferedPositionStream, () {
      super.bufferedPositionStream = value;
    });
  }

  late final _$totalDurationStreamAtom =
      Atom(name: 'PlayerControllerBase.totalDurationStream', context: context);

  @override
  ObservableStream<Duration>? get totalDurationStream {
    _$totalDurationStreamAtom.reportRead();
    return super.totalDurationStream;
  }

  @override
  set totalDurationStream(ObservableStream<Duration>? value) {
    _$totalDurationStreamAtom.reportWrite(value, super.totalDurationStream, () {
      super.totalDurationStream = value;
    });
  }

  late final _$playerStateStreamAtom =
      Atom(name: 'PlayerControllerBase.playerStateStream', context: context);

  @override
  ObservableStream<PlayerState>? get playerStateStream {
    _$playerStateStreamAtom.reportRead();
    return super.playerStateStream;
  }

  @override
  set playerStateStream(ObservableStream<PlayerState>? value) {
    _$playerStateStreamAtom.reportWrite(value, super.playerStateStream, () {
      super.playerStateStream = value;
    });
  }

  late final _$sequenceStateStreamAtom =
      Atom(name: 'PlayerControllerBase.sequenceStateStream', context: context);

  @override
  ObservableStream<SequenceState?>? get sequenceStateStream {
    _$sequenceStateStreamAtom.reportRead();
    return super.sequenceStateStream;
  }

  @override
  set sequenceStateStream(ObservableStream<SequenceState?>? value) {
    _$sequenceStateStreamAtom.reportWrite(value, super.sequenceStateStream, () {
      super.sequenceStateStream = value;
    });
  }

  late final _$totalDurationAtom =
      Atom(name: 'PlayerControllerBase.totalDuration', context: context);

  @override
  Duration get totalDuration {
    _$totalDurationAtom.reportRead();
    return super.totalDuration;
  }

  @override
  set totalDuration(Duration value) {
    _$totalDurationAtom.reportWrite(value, super.totalDuration, () {
      super.totalDuration = value;
    });
  }

  late final _$initAsyncAction =
      AsyncAction('PlayerControllerBase.init', context: context);

  @override
  Future<void> init() {
    return _$initAsyncAction.run(() => super.init());
  }

  late final _$loadAsyncAction =
      AsyncAction('PlayerControllerBase.load', context: context);

  @override
  Future<void> load(String url) {
    return _$loadAsyncAction.run(() => super.load(url));
  }

  late final _$playAsyncAction =
      AsyncAction('PlayerControllerBase.play', context: context);

  @override
  Future<void> play() {
    return _$playAsyncAction.run(() => super.play());
  }

  late final _$pauseAsyncAction =
      AsyncAction('PlayerControllerBase.pause', context: context);

  @override
  Future<void> pause() {
    return _$pauseAsyncAction.run(() => super.pause());
  }

  late final _$seekToAsyncAction =
      AsyncAction('PlayerControllerBase.seekTo', context: context);

  @override
  Future<void> seekTo(Duration position) {
    return _$seekToAsyncAction.run(() => super.seekTo(position));
  }

  late final _$disposeAsyncAction =
      AsyncAction('PlayerControllerBase.dispose', context: context);

  @override
  Future<void> dispose() {
    return _$disposeAsyncAction.run(() => super.dispose());
  }

  @override
  String toString() {
    return '''
positionStream: ${positionStream},
positionDataStream: ${positionDataStream},
bufferedPositionStream: ${bufferedPositionStream},
totalDurationStream: ${totalDurationStream},
playerStateStream: ${playerStateStream},
sequenceStateStream: ${sequenceStateStream},
totalDuration: ${totalDuration}
    ''';
  }
}
