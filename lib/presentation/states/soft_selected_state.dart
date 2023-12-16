import 'package:flutter_riverpod/flutter_riverpod.dart';

class SoftSelectedState extends StateNotifier<List> {
  SoftSelectedState(List selected_state_list) : super(selected_state_list);

  toogle_selected(String name) {
    if (state.contains(name)) {
      List new_state = List.from(state);
      new_state.remove(name);
      state = new_state;
    } else {
      List new_state = List.from(state);
      new_state.add(name);
      state = new_state;
    }
  }
}
