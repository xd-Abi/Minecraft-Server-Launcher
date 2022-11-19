import 'package:freezed_annotation/freezed_annotation.dart';

part 'workspace.freezed.dart';

@freezed
class Workspace with _$Workspace {
  factory Workspace({
    required String id,
    required String name,
    required String path,
    required String version,
  }) = _Workspace;
}
