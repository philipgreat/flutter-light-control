
import 'dart:async';
import 'package:bloc/bloc.dart';
import 'light_control_api.dart';


enum LightControlEvent { TOGGLE }

class LightControlBloc extends Bloc<LightControlEvent, String> {
  @override
  String get initialState => "未知状态";

  @override
  Stream<String> mapEventToState(LightControlEvent event) async* {
    switch (event) {
      case LightControlEvent.TOGGLE:
        yield "处理请求，请稍候...";
        var status = await LightAPIProvider().toggleLightWithStatus();
        yield status;
        break;
    
    }
  }
}