import 'package:whatsapp_web/validadores/cadastro_usuario/cadastro_usuario_form.dart';
import 'package:whatsapp_web/validadores/validation.dart';
import 'package:whatsapp_web/validadores/validation_result.dart';

class CadastroUsuarioValidation extends Validation<CadastroUsuarioForm> {

  ValidationResult validate(CadastroUsuarioForm form) {
    return ValidationResult()
        .addValidation(isNotUploadValid(form.uploadFile), "Por favor selecione uma foto para o cadastro do usuário")
        .addValidation(isNotValidEmail(form.email), "E-mail invalido")
        .addValidation(isNotValidPassword(form.senha), "Senha deve ter 7 caracteres")
        .addValidation(isNotMinSize(form.nome, 5), "O nome deve ter no mínimo 5 caracteres")
    ;
  }
}
