import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'light_control_app.dart';
import 'light_control_delegate.dart';

void main() {
  BlocSupervisor.delegate = LoggingDelegate();
  runApp(LightControlApp());
}



