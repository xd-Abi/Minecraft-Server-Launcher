import 'package:flutter/material.dart';
import 'launch/startup.dart';
import 'presentation/workspace/create_workspace_screen.dart';

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
