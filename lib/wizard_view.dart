import 'package:flutter/material.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:manjaro_hello/wizard_pages/system_overview.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Wizard extends StatefulWidget {
  const Wizard({super.key});

  @override
  State<Wizard> createState() => _WizardState();
}

const borderColor = Color.fromARGB(255, 27, 27, 26);

List<Widget> pages = [
  system_overview(),
  Container(
    color: Colors.black12,
  ),
  Container(
    color: Colors.black12,
  ),
  Container(
    color: Colors.black12,
  ),
  Container(
    color: Colors.black12,
  ),
  Container(
    color: Colors.black12,
  )
];

class _WizardState extends State<Wizard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WindowBorder(
        color: borderColor,
        width: 1,
        child: Row(
          children: const [RightSide()],
        ),
      ),
    );
  }
}

const backgroundStartColor = Color.fromARGB(255, 27, 27, 26);
const backgroundEndColor = Color.fromARGB(255, 27, 27, 26);
final controller = PageController();

class RightSide extends StatelessWidget {
  const RightSide({Key? key}) : super(key: key);

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
          Expanded(
              child: Scaffold(
            body: Container(
              //padding: EdgeInsets.only(bottom: 50),
              child: PageView(
                controller: controller,
                children: pages,
              ),
            ),
            bottomNavigationBar: Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(),
                  SmoothPageIndicator(
                    controller: controller,
                    count: pages.length,
                    effect: ScaleEffect(),
                  ),
                  Row(
                    children: [
                      TextButton(onPressed: () {}, child: Text("PREVIOUS")),
                      TextButton(onPressed: () {}, child: Text("NEXT"))
                    ],
                  )
                ],
              ),
            ),
          ))
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
