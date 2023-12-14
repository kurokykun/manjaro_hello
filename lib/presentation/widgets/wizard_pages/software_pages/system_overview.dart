import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class system_overview extends StatefulWidget {
  const system_overview({super.key});

  @override
  State<system_overview> createState() => _system_overviewState();
}

class _system_overviewState extends State<system_overview> {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      mainAxisSpacing: 30,
      crossAxisSpacing: 30,
      padding: EdgeInsets.all(80),
      childAspectRatio: 5,
      children: [
        Card(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text("System"), Text("Manjaro")],
            ),
          ),
        ),
        Card(),
        Card(),
        Card()
      ],
    );
  }
}
