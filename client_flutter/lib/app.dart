import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'app_data.dart';
import 'layout_connected.dart';
import 'layout_connecting.dart';
import 'layout_disconnected.dart';
import 'layout_disconnecting.dart';
import 'memory_game.dart'; // Importa el juego de memoria

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  AppState createState() => AppState();
}

class AppState extends State<App> {
  Widget _setLayout(BuildContext context) {
    AppData appData = Provider.of<AppData>(context);

    if (appData.isMemoryGame) {
      return MemoryGameScreen(); // Juego de memoria en línea
    }

    switch (appData.connectionStatus) {
      case ConnectionStatus.disconnecting:
        return const LayoutDisconnecting();
      case ConnectionStatus.connecting:
        return const LayoutConnecting();
      case ConnectionStatus.connected:
        return const LayoutConnected();
      default:
        return const LayoutDisconnected();
    }
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      theme: const CupertinoThemeData(brightness: Brightness.light),
      home: _setLayout(context),
    );
  }
}
