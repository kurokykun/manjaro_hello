// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:fluent_ui/fluent_ui.dart' hide Colors;
import 'package:flutter/material.dart' hide IconButton;
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:manjaro_hello/domain/config_model.dart';
import 'package:manjaro_hello/presentation/states/config_provider.dart';
import 'package:manjaro_hello/presentation/widgets/hello.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:manjaro_hello/aplication/config_service.dart';
import 'package:url_launcher/link.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

const borderColor = Color.fromARGB(255, 27, 27, 26);

final configDataProvider = FutureProvider<ConfigModel>((ref) async {
  final config_service = ConfigService();
  final config = await config_service.loadConfig();
  return config;
});

late StateNotifierProvider<ConfigProvider, ConfigModel> configProvider =
    StateNotifierProvider((ref) {
  final settings_data = ref.watch(configDataProvider);
  var response = settings_data.when(
    data: (data) => ConfigProvider(data),
    error: (error, stackTrace) {},
    loading: () {},
  );
  return response!;
});

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WindowBorder(
        color: borderColor,
        width: 1,
        child: Row(
          children: [RightSide()],
        ),
      ),
    );
  }
}

const backgroundStartColor = Color.fromARGB(255, 27, 27, 26);
const backgroundEndColor = Color.fromARGB(255, 27, 27, 26);

class RightSide extends StatelessWidget {
  RightSide({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final configDataState = ref.watch(configDataProvider);
        return configDataState.when(
          data: (data) {
            return Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [backgroundStartColor, backgroundEndColor],
                      stops: [0.0, 1.0]),
                ),
                child: Column(children: [
                  WindowTitleBarBox(
                    child: Row(
                      children: [
                        Expanded(child: MoveWindow()),
                        const WindowButtons()
                      ],
                    ),
                  ),
                  Hello(),
                  Expanded(child: Container()),
                  Padding(
                    padding: EdgeInsets.all(30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Consumer(
                          builder: (context, ref, child) {
                            var configState = ref.read(configProvider);
                            return ComboboxFormField<String>(
                              items: [
                                ComboBoxItem(
                                    value: "Español", child: Text("Español")),
                                ComboBoxItem(
                                  value: "English",
                                  child: const Text("English"),
                                )
                              ],
                              //Poner el valor del idioma guardado en el manejador de estado
                              value: configState.saved_languaje,
                              onChanged: (languaje) async {
                                var config_service = ConfigService();
                                await config_service.changeLanguaje(languaje!);
                                await ref
                                    .read(configProvider.notifier)
                                    .changeLanguaje(languaje);
                              },
                            );
                          },
                        ),
                        Row(
                          children: [
                            Link(
                              // from the url_launcher package
                              uri: Uri.parse('https://t.me/manjaro_official'),
                              builder: (Context, open) {
                                return IconButton(
                                  onPressed: open,
                                  icon: SvgPicture.asset(
                                    "assets/telegram.svg",
                                    height: 30,
                                    width: 30,
                                  ),
                                );
                              },
                            ),
                            Link(
                              // from the url_launcher package
                              uri: Uri.parse(
                                  'https://www.facebook.com/ManjaroLinux'),
                              builder: (Context, open) {
                                return IconButton(
                                  onPressed: open,
                                  icon: SvgPicture.asset(
                                    "assets/facebook.svg",
                                    height: 30,
                                    width: 30,
                                  ),
                                );
                              },
                            ),
                            Link(
                              // from the url_launcher package
                              uri:
                                  Uri.parse('https://twitter.com/ManjaroLinux'),
                              builder: (Context, open) {
                                return IconButton(
                                  onPressed: open,
                                  icon: SvgPicture.asset(
                                    "assets/twitter.svg",
                                    height: 30,
                                    width: 30,
                                  ),
                                );
                              },
                            ),
                            Link(
                              // from the url_launcher package
                              uri: Uri.parse(
                                  'https://www.reddit.com/r/ManjaroLinux/'),
                              builder: (Context, open) {
                                return IconButton(
                                  onPressed: open,
                                  icon: SvgPicture.asset(
                                    "assets/reddit.svg",
                                    height: 30,
                                    width: 30,
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                        ToggleSwitch(
                          leadingContent: true,
                          content: Text("Abrir al inicio"),
                          //Valor de si se abrira al inicio de manejador de estados
                          checked: true,
                          onChanged: (value) {
                            //Modificar dicho valor del manejador de estados
                          },
                        )
                      ],
                    ),
                  ),
                ]),
              ),
            );
          },
          error: (error, stackTrace) {
            return Center(
              child: Text("Ha ocurrido un error inesperado cargando los datos"),
            );
          },
          loading: () {
            return Center(
              child: ProgressRing(),
            );
          },
        );
      },
    );
  }
}

final buttonColors = WindowButtonColors(
    iconNormal: const Color(0xFF805306),
    mouseOver: const Color(0xFFF6A00C),
    mouseDown: const Color(0xFF805306),
    iconMouseOver: const Color(0xFF805306),
    iconMouseDown: const Color(0xFFFFD500));

final closeButtonColors = WindowButtonColors(
    mouseOver: const Color(0xFFD32F2F),
    mouseDown: const Color(0xFFB71C1C),
    iconNormal: const Color(0xFF805306),
    iconMouseOver: Colors.white);

class WindowButtons extends StatefulWidget {
  const WindowButtons({Key? key}) : super(key: key);

  @override
  _WindowButtonsState createState() => _WindowButtonsState();
}

class _WindowButtonsState extends State<WindowButtons> {
  void maximizeOrRestore() {
    setState(() {
      appWindow.maximizeOrRestore();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        MinimizeWindowButton(colors: buttonColors),
        appWindow.isMaximized
            ? RestoreWindowButton(
                colors: buttonColors,
                onPressed: maximizeOrRestore,
              )
            : MaximizeWindowButton(
                colors: buttonColors,
                onPressed: maximizeOrRestore,
              ),
        CloseWindowButton(colors: closeButtonColors),
      ],
    );
  }
}
