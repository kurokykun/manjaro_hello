// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart' hide Card, IconButton, Colors;
import 'package:get/get.dart';
import 'package:manjaro_hello/controller/setup_controller.dart';
import 'package:manjaro_hello/wizard_pages/software_pages/office.dart';

class SoftwareInstaller extends StatefulWidget {
  const SoftwareInstaller({super.key});

  @override
  State<SoftwareInstaller> createState() => _SoftwareInstallerState();
}

Controller controller = Get.find();

class _SoftwareInstallerState extends State<SoftwareInstaller> {
  _card() {
    return Card(
        child: Container(),
        borderRadius: BorderRadius.all(Radius.circular(10.0)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 27, 27, 26),
      body: Padding(
          padding: EdgeInsets.fromLTRB(100, 20, 100, 10),
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                pinned: true,
                automaticallyImplyLeading: false,
                backgroundColor: Color.fromARGB(255, 27, 27, 26),
                title: Row(
                  children: [
                    Expanded(
                      child: PageHeader(title: Text("Descubir Software")),
                    ),
                    AnimSearchBar(
                      width: 400,
                      textFieldIconColor: Colors.white,
                      searchIconColor: Colors.white,
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w400),
                      textFieldColor: Theme.of(context).primaryColor,
                      color: Theme.of(context).primaryColor,
                      textController: controller.repo_controller,
                      onSuffixTap: () {
                        controller.repo_controller.clear();
                      },
                      onSubmitted: (p0) {},
                    )
                  ],
                ),
              ),
              SliverAppBar(
                title: Text('Navegadores'),
                pinned: false,
                automaticallyImplyLeading: false,
                backgroundColor: Color.fromARGB(255, 27, 27, 26),
              ),
              SliverGrid(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 2.4,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8),
                delegate: SliverChildBuilderDelegate(
                    (context, index) => GridTile(child: _card()),
                    childCount: 6),
              )
            ],
          )),
    );
  }
}
