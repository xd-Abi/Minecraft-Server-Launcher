import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:msl/core/error.dart';
import 'package:msl/workspace/application/core/workspace.dart';
import 'package:uuid/uuid.dart';

class WorkspaceService {
  Future<Either<Workspace, AppError>> create({
    required String name,
    required String path,
    required String version,
  }) async {
    Workspace workspace;

    try {
      Directory dir = Directory(path);

      if (!(await dir.exists())) {
        return right(AppError("Directory does not exist"));
      }

      if (!await dir.list().isEmpty) {
        return right(AppError("Direcotry is not empty"));
      }

      workspace = Workspace(
        id: const Uuid().toString(),
        name: name,
        path: path,
        version: version,
      );
    } catch (e) {
      return right(AppError("Failed to create workspace"));
    }

    return left(workspace);
  }
}
