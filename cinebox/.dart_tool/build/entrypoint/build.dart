// @dart=3.6
// ignore_for_file: directives_ordering
// build_runner >=2.4.16
// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:build_runner_core/build_runner_core.dart' as _i1;
import 'package:riverpod_generator/builder.dart' as _i2;
import 'package:retrofit_generator/retrofit_generator.dart' as _i3;
import 'package:json_serializable/builder.dart' as _i4;
import 'package:envied_generator/builder.dart' as _i5;
import 'package:source_gen/builder.dart' as _i6;
import 'package:mockito/src/builder.dart' as _i7;
import 'package:build_config/build_config.dart' as _i8;
import 'dart:isolate' as _i9;
import 'package:build_runner/src/build_script_generate/build_process_state.dart'
    as _i10;
import 'package:build_runner/build_runner.dart' as _i11;
import 'dart:io' as _i12;

final _builders = <_i1.BuilderApplication>[
  _i1.apply(
    r'riverpod_generator:riverpod_generator',
    [_i2.riverpodBuilder],
    _i1.toDependentsOf(r'riverpod_generator'),
    hideOutput: true,
    appliesBuilders: const [r'source_gen:combining_builder'],
  ),
  _i1.apply(
    r'retrofit_generator:retrofit_generator',
    [_i3.retrofitBuilder],
    _i1.toDependentsOf(r'retrofit_generator'),
    hideOutput: true,
    appliesBuilders: const [r'source_gen:combining_builder'],
  ),
  _i1.apply(
    r'json_serializable:json_serializable',
    [_i4.jsonSerializable],
    _i1.toDependentsOf(r'json_serializable'),
    hideOutput: true,
    appliesBuilders: const [r'source_gen:combining_builder'],
  ),
  _i1.apply(
    r'envied_generator:envied',
    [_i5.enviedBuilder],
    _i1.toDependentsOf(r'envied_generator'),
    hideOutput: true,
    appliesBuilders: const [r'source_gen:combining_builder'],
  ),
  _i1.apply(
    r'source_gen:combining_builder',
    [_i6.combiningBuilder],
    _i1.toNoneByDefault(),
    hideOutput: false,
    appliesBuilders: const [r'source_gen:part_cleanup'],
  ),
  _i1.apply(
    r'mockito:mockBuilder',
    [_i7.buildMocks],
    _i1.toDependentsOf(r'mockito'),
    hideOutput: false,
    defaultGenerateFor: const _i8.InputSet(include: [r'test/**']),
  ),
  _i1.applyPostProcess(
    r'source_gen:part_cleanup',
    _i6.partCleanup,
  ),
];
void main(
  List<String> args, [
  _i9.SendPort? sendPort,
]) async {
  await _i10.buildProcessState.receive(sendPort);
  _i10.buildProcessState.isolateExitCode = await _i11.run(
    args,
    _builders,
  );
  _i12.exitCode = _i10.buildProcessState.isolateExitCode!;
  await _i10.buildProcessState.send(sendPort);
}
