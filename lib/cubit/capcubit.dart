import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Capitalize extends Cubit<String> {
  Capitalize() : super("");

  void capIt(String text) {
    emit(text.toUpperCase());
  }
}
