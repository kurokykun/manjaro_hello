// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart' hide ButtonStyle;
import 'package:fluent_ui/fluent_ui.dart' hide FilledButton, Colors;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:manjaro_hello/presentation/widgets/app.dart';
import 'package:manjaro_hello/presentation/widgets/hello_pages/learn_more.dart';
import 'package:manjaro_hello/presentation/widgets/hello_pages/releases_notes.dart';
import 'package:manjaro_hello/presentation/widgets/wizard_view.dart';

class Hello extends StatefulWidget {
  Hello({super.key});

  @override
  State<Hello> createState() => _HelloState();
}

class _HelloState extends State<Hello> {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        var configState = ref.read(configProvider);
        return Padding(
          padding: EdgeInsets.fromLTRB(150, 100, 150, 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Welcome to Manjaro!",
                  style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
              Text(
                configState.system_version,
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.green),
              ),
              SizedBox(height: 50),
              Text(
                textAlign: TextAlign.center,
                "We the developer of manjaro,hope that you will enjoy using Manjaro as much as we enjoy buiding it.Manjaro hello will help you to get started with your new operating system,So enjoy the experience,and dont hesitate to send us your feedback",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w200,
                    color: Colors.white),
              ),
              SizedBox(height: 50),
              FilledButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Wizard()));
                },
                child: Text(
                  "Let's Begin!",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w600),
                ),
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    fixedSize: const Size(140, 45),
                    backgroundColor: Colors.green),
              ),
              SizedBox(height: 20),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    HyperlinkButton(
                      child: Text('Learn More',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LearnMore()));
                      },
                    ),
                    HyperlinkButton(
                      child: Text('Releases Notes',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ReleaseNotes()));
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
