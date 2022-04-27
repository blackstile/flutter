
class Receita {
  String titulo;
  String foto;
  String porcoes;
  String tempoPreparo;
  String ingredientes;
  String modoPreparo;

  Receita(
      this.titulo,
        this.foto,
        this.porcoes,
        this.tempoPreparo,
        this.ingredientes,
        this.modoPreparo);

  Receita.fromJson(Map<String, dynamic> json):
    titulo = json['titulo'],
    foto = json['foto'],
    porcoes = json['porcoes'],
    tempoPreparo = json['tempo_preparo'],
    ingredientes = json['ingredientes'],
    modoPreparo = json['modo_preparo'];

  Map<String, dynamic> toJson() {
    return {
      'titulo': titulo,
      'foto': foto,
      'porcoes': porcoes,
      'tempo_preparo': tempoPreparo,
      'ingredientes': ingredientes,
      'modo_preparo': modoPreparo,
    };
  }
}