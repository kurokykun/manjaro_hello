// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:fluent_ui/fluent_ui.dart' hide Colors;
import 'package:flutter/material.dart' hide IconButton;
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:get/get.dart';
import 'package:manjaro_hello/controller/setup_controller.dart';
import 'package:manjaro_hello/hello.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

const borderColor = Color.fromARGB(255, 27, 27, 26);

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
  Controller controller = Get.find();
  RightSide({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
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
              children: [Expanded(child: MoveWindow()), const WindowButtons()],
            ),
          ),
          FutureBuilder(
            future: controller.initialize(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Hello();
              } else {
                return Expanded(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      "Estamos cargando la informacion necesaria",
                      style: TextStyle(fontWeight: FontWeight.w200),
                    )
                  ],
                ));
              }
            },
          ),
          Expanded(child: Container()),
          Padding(
            padding: EdgeInsets.all(30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Obx(() => ComboboxFormField<String>(
                      items: [
                        ComboBoxItem(child: Text("Español"), value: "Español"),
                        ComboBoxItem(
                          child: Text("English"),
                          value: "English",
                        )
                      ],
                      value: controller.saved_languaje.value,
                      onChanged: (value) {
                        controller.change_saved_languaje(value!);
                        controller.saved_languaje.value = value;
                      },
                    )),
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
                      uri: Uri.parse('https://www.facebook.com/ManjaroLinux'),
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
                      uri: Uri.parse('https://twitter.com/ManjaroLinux'),
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
                      uri: Uri.parse('https://www.reddit.com/r/ManjaroLinux/'),
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
                Obx(() => ToggleSwitch(
                      leadingContent: true,
                      content: Text("Abrir al inicio"),
                      checked: controller.launch_startup.value,
                      onChanged: (value) {
                        controller.change_launch_startup(value);
                        controller.launch_startup.value =
                            !controller.launch_startup.value;
                      },
                    ))
              ],
            ),
          ),
        ]),
      ),
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
