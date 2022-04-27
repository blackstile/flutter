import 'dart:typed_data';

import 'package:whatsapp_web/validadores/validation_result.dart';

abstract class Validation<T> {
  static const int _PASS_MIN_SIZE = 6;
  ValidationResult validate(T form);

  bool isNotValidEmail(String? email) {
    return !isValidEmail(email);
  }
  bool isValidEmail(String? email) {
    return email != null &&
        email.trim().isNotEmpty &&
        email.contains("@") &&
        email.contains(".com");
  }

  bool isNotUploadValid(Uint8List? file){
    return !isUploadValid(file);
  }
  bool isUploadValid(Uint8List? file){
    return file != null;
  }

  bool isNotValidPassword(String? password){
    return !isValidPassword(password);
  }
  bool isValidPassword(String? password){
    return password != null && password.trim().isNotEmpty && password.length > _PASS_MIN_SIZE;
  }

  bool isNotMinSize(String? value, [int minSize=0]){
    return !isMinSize(value, minSize);
  }
  bool isMinSize(String? value, [int minSize=0]){
    return value != null && value.trim().isNotEmpty && value.length >=minSize;
  }

  bool isNotMaxSize(String? value, [int maxSize=999]){
    return isMaxSize(value, maxSize);
  }
  bool isMaxSize(String? value, [int maxSize=999]){
    return value != null && value.trim().isNotEmpty && value.length >=maxSize;
  }
}
