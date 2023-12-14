// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class LearnMore extends StatefulWidget {
  LearnMore({super.key});

  @override
  State<LearnMore> createState() => _LearnMoreState();
}

const borderColor = Color.fromARGB(255, 27, 27, 26);

class _LearnMoreState extends State<LearnMore> {
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
final page_controller = PageController();

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
            appBar: AppBar(
              title: Text("Manjaro Hello"),
              backgroundColor: Color.fromARGB(255, 27, 27, 26),
            ),
            backgroundColor: Color.fromARGB(255, 27, 27, 26),
            body: Container(child: Markdown(data: """
# Handling hardware

Manjaro not only supports the use of multiple kernels (selectable from the advanced options at the boot screen), but also provides access to the very latest bleeding-edge kernels as well. This can be done through the use of the Kernel module in Manjaro's graphical Settings Manager, or via the command line using the MHWD-kernel (Manjaro Hardware Detection) command.

These Manjaro tools will automatically update a newly installed kernel along with any modules currently in use with your existing kernel. For example, if you were to update from kernel 3.18 to 4.1, MHWD-kernel would automatically include the kernel 4.1 builds and all modules used with kernel 3.18. How about that!

You can configure your hardware through the Hardware Detection module in the Settings Manager or alternatively with the MHWD cli-application. With these tools, you can install for example graphical drivers, free and proprietary.

## Getting help

Although Manjaro is designed to work as much "out of the box" as possible, we don't claim it's perfect. There can be times when things go wrong, you might have questions and a desire to learn more, or just want to personalize it to suit your tastes. This page provides details of some available resources to help you!

__Search the web__

Perhaps the first place to look for generic Linux help is by using your favorite search engine. Just include words like 'Linux', 'Manjaro' or 'Arch' in your search query.

As Manjaro is based on Arch Linux, guides and tips designed for Arch usually apply to Manjaro too.

__Look in the forums__

For specific help with Manjaro we have a dedicated online forum where you can search for topics, or create one yourself! This is probably the next best place to go for collaboration, discussion and assistance. Ask for help, post your thoughts, or outline some suggestions. Don't be shy!

The Manjaro forum is divided into sub-forums for different topics and environments, please post your query in the appropriate place!

__Join us on Telegram__

Another option is to join us on [Telegram](https://t.me/manjaro_official).

**Sign up to a mailing list**

Another way to get help is to email questions to Manjaro mailing list (you can also search the history for past discussions). Simply sign up to the list you prefer and follow the instructions. There is a list dedicated to several topics, just take a look!

**Other resources**\n
- [Manjaro Germany](https://forum.manjarolinux.de "sdsd")  - Official, support for our german community.
- [AUR Repository](https://aur.archlinux.org)- Extra software not in the regular repositories, built from source.
- [Manjaro Wiki](https://wiki.manjaro.org) - Official wiki for Manjaro.
- [Arch Wiki](https://wiki.archlinux.org) - Official wiki for Arch.
- [IRC Chat](https://t.me/manjaro_official) - Live talk and help by users for users.
- [Manjaro User Guide](file:///usr/share/doc/manjaro/Beginner_User_Guide.pdf) - Over 100 page book with everything a new or advanced user can learn about Manjaro.

## Suggestions

Got a suggestion on how we can make Manjaro better? Found something you want to be included, or want to help out? Please let us know, by posting your suggestion on the forum or drop by on IRC.

Thank you!

We hope you enjoy using Manjaro!""")
                //padding: EdgeInsets.only(bottom: 50),
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
