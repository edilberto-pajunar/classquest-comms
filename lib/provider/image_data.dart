import 'package:flutter/foundation.dart';

class ImageDataProvider with ChangeNotifier {
  var _imageBytes;

  Uint8List get imageBytes => _imageBytes;

  set imageBytes(Uint8List value) {
    _imageBytes = value;
    notifyListeners();
  }
}
