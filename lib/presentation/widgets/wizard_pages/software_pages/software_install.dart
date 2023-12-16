// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sort_child_properties_last

import 'package:fluent_ui/fluent_ui.dart'
    hide FilledButton, ButtonStyle, Colors;
import 'package:flutter/material.dart' hide Card, IconButton;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:manjaro_hello/domain/app_data_model.dart';
import 'package:manjaro_hello/presentation/states/soft_selected_state.dart';
import 'package:manjaro_hello/presentation/widgets/app.dart' hide App;

class SoftwareInstaller extends StatefulWidget {
  const SoftwareInstaller({super.key});

  @override
  State<SoftwareInstaller> createState() => _SoftwareInstallerState();
}

late StateNotifierProvider<SoftSelectedState, List> selectedSoftProvider =
    StateNotifierProvider<SoftSelectedState, List>((ref) {
  return SoftSelectedState([]);
});

class _SoftwareInstallerState extends State<SoftwareInstaller> {
  final ScrollController _scrollController = ScrollController();

  _software_section(List<Category> soft_list) {
    List<Widget> widget_list = [];
    //Recorrer los elementos de software del manejador de estados
    for (var i = 0; i < soft_list.length; i++) {
      widget_list.add(
        SliverAppBar(
          backgroundColor: Color.fromARGB(255, 27, 27, 26),
          automaticallyImplyLeading: false,
          title: Text(soft_list[i].name),
        ),
      );
      widget_list.add(SliverGrid(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 2.4,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8),
        delegate: SliverChildBuilderDelegate(
            (context, j) => GridTile(child: _card(soft_list, i, j)),
            childCount: soft_list[i].apps.length),
      ));
    }
    return widget_list;
  }

  _card(List<Category> soft_list, int cat_index, int app_index) {
    print("assets/soft_icons/${soft_list[cat_index].apps[app_index].icon}.svg");
    return Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  "assets/soft_icons/${soft_list[cat_index].apps[app_index].icon}.svg",
                  height: 50,
                  width: 50,
                ),
              ],
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    soft_list[cat_index].apps[app_index].name,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(7, 5, 7, 5),
                    child: Text(
                      soft_list[cat_index].apps[app_index].description,
                      textAlign: TextAlign.center,
                      maxLines: 2,
                    ),
                  )
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                    padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                    child: Consumer(
                      builder: (context, ref, child) {
                        print("Buttons Cards Build");
                        var selectedSoftState = ref.watch(selectedSoftProvider);
                        bool selected = selectedSoftState.contains(
                            soft_list[cat_index].apps[app_index].name);
                        return ElevatedButton(
                          child: selected
                              ? Icon(Icons.check)
                              : Icon(
                                  Icons.download,
                                ),
                          style: ButtonStyle(
                              backgroundColor: selected
                                  ? MaterialStateProperty.all<Color>(
                                      Colors.green)
                                  : MaterialStateProperty.all<Color>(
                                      Colors.blue),
                              fixedSize:
                                  MaterialStateProperty.all<Size>(Size(30, 30)),
                              minimumSize:
                                  MaterialStateProperty.all<Size>(Size(30, 30)),
                              padding:
                                  MaterialStateProperty.all<EdgeInsetsGeometry>(
                                      EdgeInsets.zero),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              )),
                          onPressed: () async {
                            ref
                                .read(selectedSoftProvider.notifier)
                                .toogle_selected(
                                    soft_list[cat_index].apps[app_index].name);
                          },
                        );
                      },
                    )),
              ],
            )
          ],
        ),
        borderRadius: BorderRadius.all(Radius.circular(10.0)));
  }

  void _scrollToTop() {
    _scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  void initState() {
    //Crear y Modificar el estado de cuando mostrar o no el boton para scroleear al inicio
    /*_scrollController.addListener(() {
      controller.show_scroll_button.value =
          _scrollController.position.userScrollDirection ==
              ScrollDirection.reverse;
    });*/
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        var configState = ref.watch(configProvider);
        return Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(kToolbarHeight),
            child: Padding(
                padding: EdgeInsets.fromLTRB(80, 0, 80, 0),
                child: AppBar(
                    backgroundColor: Color.fromARGB(255, 27, 27, 26),
                    automaticallyImplyLeading: false,
                    shadowColor: Color.fromARGB(255, 27, 27, 26),
                    elevation: 0,
                    title: Row(
                      children: [
                        Expanded(
                          child: PageHeader(title: Text("Descubir Software")),
                        ),
                        SizedBox(
                          height: 40,
                          width: 300,
                          child: TextBox(
                            suffix: Icon(Icons.search),
                            highlightColor: Color.fromARGB(255, 27, 27, 26),
                            unfocusedColor: Color.fromARGB(255, 27, 27, 26),
                            //El text controller para el buscar en el manejador de estados
                            //controller: controller.search_controller,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16)),
                            onChanged: (text) async {
                              //Aqui manejo la logica del buscar
                              ref
                                  .read(configProvider.notifier)
                                  .filterList(text);
                            },
                          ),
                        )
                      ],
                    ))),
          ),
          backgroundColor: Color.fromARGB(255, 27, 27, 26),
          //Cuado mostrar o no el boton de scrollear al inicio
          floatingActionButton: true
              ? FloatingActionButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  tooltip: "Scroll to top",
                  onPressed: _scrollToTop,
                  child: Icon(Icons.arrow_upward),
                )
              : null,
          body: Padding(
              padding: EdgeInsets.fromLTRB(100, 20, 100, 10),
              child: CustomScrollView(
                controller: _scrollController,
                slivers: _software_section(configState.modified_app_list),
              )),
        );
      },
    );
  }
}
