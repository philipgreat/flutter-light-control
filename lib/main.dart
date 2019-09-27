import 'package:flutter/material.dart';

import 'dart:async';
import 'package:bloc/bloc.dart';

import 'light_control_api.dart';
import 'light_control_app.dart';
import 'light_control_delegate.dart';

void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();
  runApp(LightControlApp());
}



