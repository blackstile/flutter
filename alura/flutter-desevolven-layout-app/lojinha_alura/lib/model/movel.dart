class Movel {
  String titulo;
  String foto;
  String descricao;
  double preco;

  Movel({
    required this.titulo,
    required this.foto,
    required this.descricao,
    required this.preco
  });

  static Movel fromJson(Map<String, dynamic> json){
    return Movel (descricao : json['descricao'],
    titulo : json['titulo'],
    foto : json['foto'],
    preco : json['preco']);
  }


}