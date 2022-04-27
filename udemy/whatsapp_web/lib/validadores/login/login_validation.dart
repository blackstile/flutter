import 'package:whatsapp_web/validadores/login/login_form.dart';
import 'package:whatsapp_web/validadores/validation.dart';
import 'package:whatsapp_web/validadores/validation_result.dart';

class LoginValidation extends Validation<LoginForm>{

  ValidationResult validate(LoginForm form) {
    return ValidationResult()
        .addValidation(isNotValidEmail(form.email), "E-mail invalido")
        .addValidation(isNotValidPassword(form.senha), "Senha deve ter 7 caracteres")
    ;
  }
}

