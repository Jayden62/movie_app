import 'dart:convert';

class ScreenSize {
  int width;
  int height;

  ScreenSize({this.width, this.height});

  factory ScreenSize.fromJson(Map<String, dynamic> data) {
    return ScreenSize(width: data['width'], height: data['height']);
  }

  factory ScreenSize.fromString(String data) {
    return ScreenSize.fromJson(json.decode(data));
  }

  Map<String, dynamic> toJson() => {'width': width, 'height': height};
}
