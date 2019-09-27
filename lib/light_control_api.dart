import 'package:http/http.dart' as http;
class LightAPIProvider {
  //http://192.168.0.1/cgi-bin/toggle

  Future<String> _toggleLight() {
    final url = 'http://192.168.0.1/cgi-bin/toggle';
    return http.get(url).then((response) {
      String status = response.body;
      return status;
    });
  }
  Future<String> toggleLightWithStatus() {
    final url = 'http://192.168.0.1/cgi-bin/toggle';
    return http.get(url).then((response) {
      String content = response.body;
      if(content.contains("off")) {
        return "OFF";
      }
      return "ON";
    });
  }
}
