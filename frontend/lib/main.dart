import 'package:flutter/material.dart';
import 'package:msl/startup/startup.dart';
import 'package:msl/workspace/presentation/create_workspace_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await AppRunner.run(App());
}

class App extends EntryPoint {
  @override
  Widget create() {
    return const CreateWorkspaceScreen();
  }
}
