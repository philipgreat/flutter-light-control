
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'light_control_bloc.dart';
import 'light_control_page.dart';

class LightControlApp extends StatelessWidget {
  // This widget is the root of your application.

  Widget homeNoBuilderButErrorFoundDoesNotContainABlocOfTypeLightControlBloc(){
    // 这个的homg没有builder，后面不能用事件里面的数据
    return LightControlPage(title: '灯光控制BLoC');

  }
  Widget home(){

    return BlocProvider(
      builder: (context) => LightControlBloc(),
      child: LightControlPage(title: '灯光控制BLoC'),
    );

  }
  ThemeData theme(){

    return ThemeData(
      primarySwatch: Colors.blueGrey,
    );

  }
  String title(){
    return '控制灯光';
  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: title(),
      theme: theme(),
      home: home(),
    );
  }


}