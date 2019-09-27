
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'light_control_bloc.dart';
class LightControlPage extends StatelessWidget {
  LightControlPage({Key key, this.title}) : super(key: key);
  final String title;


  Widget appBar(BuildContext context){
    return AppBar(
      // Here we take the value from the LightControlPage object that was created by
      // the App.build method, and use it to set our appbar title.
      title: Text(title),
    );
  }
  Widget label(BuildContext context){
    return Text(
      '当前状态:',
    );
  }
  Widget content(BuildContext context){

    return BlocBuilder<LightControlBloc, String>(
        builder: (context, status) {

          return Text(
            status,
            style: Theme.of(context).textTheme.display1,
          );

        });
  }
  Widget centerContent(BuildContext context){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        label(context),
        content(context)
      ],
    );

  }
  Widget body(BuildContext context){


    return Center(
      // Center is a layout widget. It takes a single child and positions it
      // in the middle of the parent.
      child: centerContent(context),
    );


  }

  Widget calcIcon(BuildContext context, String ligthStatus){
    if(ligthStatus=="ON"){
      return Icon(Icons.lightbulb_outline);
    }
    if(ligthStatus=="OFF"){
      return Icon(Icons.add);
    }
    return Icon(Icons.device_unknown);

  }

  void _toggleLight(BuildContext context) {

    final lightControlBloc = BlocProvider.of<LightControlBloc>(context);
    lightControlBloc.dispatch(LightControlEvent.TOGGLE);


  }
  Widget button(BuildContext context){

    return BlocBuilder<LightControlBloc, String>(
        builder: (context, status) {
          return FloatingActionButton(
            onPressed: ()=>_toggleLight(context),
            tooltip: '开或者关',
            child: calcIcon(context,status),
          );
        });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      body: body(context),
      floatingActionButton:button(context), // This trailing comma makes auto-formatting nicer for build methods.
    );

  }

}