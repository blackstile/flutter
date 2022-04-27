import 'dart:typed_data';

class CadastroUsuarioForm{

  final String nome;
  final String urlFoto;
  final String email;
  final String senha;
  final Uint8List? uploadFile;

  CadastroUsuarioForm(this.nome, this.urlFoto, this.email, this.senha, this.uploadFile);

}