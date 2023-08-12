// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manjaro_hello/controller/setup_controller.dart';
import 'package:manjaro_hello/wizard_pages/software_pages/office.dart';

class SoftwareInstaller extends StatefulWidget {
  const SoftwareInstaller({super.key});

  @override
  State<SoftwareInstaller> createState() => _SoftwareInstallerState();
}

Controller controller = Get.find();
List<NavigationPaneItem> pane_items = [
  PaneItem(
      icon: Icon(FluentIcons.text_document_edit),
      title: Text("Oficina"),
      body: OfficePage()),
  PaneItem(
      icon: Icon(FluentIcons.globe),
      title: Text("Navegador"),
      body: Container()),
  PaneItem(
      icon: Icon(FluentIcons.book_answers),
      title: Text("Lectores"),
      body: Container()),
  PaneItem(
      icon: Icon(FluentIcons.text_document),
      title: Text("Editores de texto"),
      body: Container()),
  PaneItem(
      icon: Icon(FluentIcons.print),
      title: Text("Impresión"),
      body: Container()),
  PaneItem(icon: Icon(FluentIcons.pdf), title: Text("PDF"), body: Container()),
  PaneItem(
      icon: Icon(FluentIcons.media_add),
      title: Text("Creacion de graficos"),
      body: Container()),
  PaneItem(
      icon: Icon(FluentIcons.photo), title: Text("Fotos"), body: Container()),
  PaneItem(
      icon: Icon(FluentIcons.video), title: Text("Video"), body: Container()),
  PaneItem(
      icon: Icon(FluentIcons.music_note),
      title: Text("Audio"),
      body: Container()),
  PaneItem(
      icon: Icon(FluentIcons.media), title: Text("Media"), body: Container()),
  PaneItem(
      icon: Icon(FluentIcons.chat), title: Text("Chat"), body: Container()),
  PaneItem(
      icon: Icon(FluentIcons.lock),
      title: Text("Respaldos"),
      body: Container()),
  PaneItem(
      icon: Icon(FluentIcons.password_field),
      title: Text("Contraseñas"),
      body: Container()),
];

class _SoftwareInstallerState extends State<SoftwareInstaller> {
  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          body: NavigationView(
              key: GlobalKey(),
              pane: NavigationPane(
                  autoSuggestBox: AutoSuggestBox(
                      items: [], trailingIcon: Icon(Icons.search)),
                  selected: controller.soft_index.value,
                  onChanged: (value) {
                    controller.soft_index.value = value;
                  },
                  items: pane_items)),
        ));
  }
}
