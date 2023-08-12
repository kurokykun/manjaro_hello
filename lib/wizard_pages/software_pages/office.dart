// ignore_for_file: prefer_const_constructors

import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart';

class OfficePage extends StatefulWidget {
  const OfficePage({super.key});

  @override
  State<OfficePage> createState() => _OfficePageState();
}

class _OfficePageState extends State<OfficePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 27, 27, 26),
    );
  }
}
