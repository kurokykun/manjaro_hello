// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class ReleaseNotes extends StatefulWidget {
  ReleaseNotes({super.key});

  @override
  State<ReleaseNotes> createState() => _ReleaseNotes();
}

const borderColor = Color.fromARGB(255, 27, 27, 26);

class _ReleaseNotes extends State<ReleaseNotes> {
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
# Manjaro 22.1

Since we released Sikaris in December 2022 we worked hard to get the next release of Manjaro out there. We call it Talos.

The **GNOME** edition has received several updates to Gnome 43 series. This includes a lot of fixes and polish when Gnome 43 originally was released in September 2022. You can find the changes made to each point-release here: [43.1](https://download.gnome.org/core/43/43.1/NEWS) ,[43.2](https://download.gnome.org/core/43/43.2/NEWS) , [43.3](https://download.gnome.org/core/43/43.3/NEWS), [43.4](https://download.gnome.org/core/43/43.4/NEWS) , [43.5](https://download.gnome.org/core/43/43.5/NEWS).\n
Highlights of 43 release series is:

It comes with a redesigned system status menu, which allows quickly changing commonly used settings. Settings which previously required digging into menus can now be changed with the click of button. The new design also makes it easy to see the status of your settings at a glance. 

Our in-house Layouts Switcher application has gained some new features as well as various improvements and fixes: Now you can create your own dynamic wallpaper. With Gradience you can customize your theme simple from within the application. There are many presents available to choose from or you can create your own. By toggling a radio button the Firefox Gnome theme can fetch its latest version automatically from upstream.

Additionally we managed to get our green branding back. Therefore we created some Gnome packages we tagged with Maia. This includes accent colours, colouring on the login screen, folder clours and Qt theming.

The **Plasma edition** comes with the latest Plasma 5.27 LTS series and KDE Gear 22.12. It brings exciting new improvements to your desktop.

This release includes a window tiling system, a more stylish app theme, cleaner and more usable tools, and widgets that give you more control over your machine. KDE's designers have been hard at work reducing the number of pages in Plasma's System Settings utility and moving smaller options in with other settings. Such is the case of the configuration for the animation when apps are launching, which now lives on the Cursors page. Additionally, the Highlight Changed Settings button has been moved to the hamburger menu for a cleaner look.

Migrating Plasma to the new Wayland display server technology has been no mean feat. But despite how hard the work has been, it is paying off, as Wayland opens many new ways to interact with your desktop. Plasma 5.27's Wayland support is better than ever, with many bug fixes and reliability improvements throughout!

With our **XFCE edition**, we have now Xfce 4.18. Here some highlights: A new file highlighting feature (accessed from the file properties dialog) in Thunar file manager lets you set a custom colour background and a custom foreground text colour – an effective way to call attention to specific file(s) in a directory laden with similar-looking mime types. On the subject of finding files, Thunar includes recursive search.

The panel picks up a pair of new preferences. First, panel length is now configured in pixels rather than percentages, as before. Second, there’s a new “keep panel above windows” option. This allows maximised app windows to fill the area behind the panel rather than maximise its bottom or top edge to sit flush against it.

Control Centre groups all of the desktop’s various modules for managing the system into one easy-to-use window. New options are present in many of these. For example you can disable header bars in dialogs from the Appearance module; show or hide a ‘delete’ option in file context menus from Desktop; and pick a default multi-monitor behaviour before you attach an additional screen – dead handy, that. 

Kernel 6.1 LTS is used for this release, such as the latest drivers available to date. With 5.15 LTS and 5.10 LTS we offer additional support for older hardware as needed.

We hope you enjoy this release and let us know what you think of Talos.
""")
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
