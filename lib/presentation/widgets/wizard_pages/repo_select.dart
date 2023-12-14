// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names, prefer_final_fields

import 'package:fluent_ui/fluent_ui.dart' hide Colors;
import 'package:flutter/material.dart' hide Card;
import 'package:manjaro_hello/presentation/widgets/wizard_view.dart';

class RepoView extends StatefulWidget {
  RepoView({super.key});

  @override
  State<RepoView> createState() => _RepoViewState();
}

final formKey = GlobalKey<FormState>();

class _RepoViewState extends State<RepoView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 27, 27, 26),
      body: Padding(
        padding: EdgeInsets.fromLTRB(180, 10, 180, 180),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            PageHeader(
                title: Text("Configuracion del Repositorio"), padding: 200),
            Text(
              textAlign: TextAlign.center,
              "Desea agregar un servidor proxy o utilizar en su lugar los repositorios oficiales de manjaro? Esto puede resultar util en lugares con dificil acceso a conectividad.",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w200,
                  color: Colors.white),
            ),
            SizedBox(
              height: 32,
            ),
            Form(
                key: formKey,
                child: TextFormField(
                  //Poner el controller del manejador de estados
                  autovalidateMode: AutovalidateMode.always,
                  decoration: InputDecoration(
                      errorStyle: TextStyle(height: 0),
                      prefixIcon: Icon(
                        FluentIcons.repo_solid,
                        size: 18,
                      ),
                      border: OutlineInputBorder(),
                      labelText: 'Direccion del Repositorio',
                      hintText: "http://example.com"),
                  validator: (value) {
                    var expresion = RegExp(
                        r'^https?:\/\/(?:www\.)?[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9()]{1,6}\b(?:[-a-zA-Z0-9()@:%_\+.~#?&\/=]*)$');
                    if (!expresion.hasMatch(value!)) {
                      return "** Si no sabe lo que esta haciendo puede omitir este paso";
                    }

                    return null;
                  },
                )),
          ],
        ),
      ),
    );
  }
}
