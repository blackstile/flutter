class Carro {

  int id;
  String? nome;
  String? tipo;
  String? descricao;
  String? urlFoto;
  String? urlVideo;
  String? latitude;
  String? longitude;

  Carro(
      {required this.id,
        required this.nome,
        required this.tipo,
        required this.descricao,
        required this.urlFoto,
        required this.urlVideo,
        required this.latitude,
        required this.longitude});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['nome'] = nome;
    data['tipo'] = tipo;
    data['descricao'] = descricao;
    data['urlFoto'] = urlFoto;
    data['urlVideo'] = urlVideo;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    return data;
  }

  Carro.fromJson(Map<String, dynamic> json):
        id = json['id'],
        nome = json['nome'],
        tipo = json['tipo'],
        descricao = json['descricao'],
        urlFoto = json['urlFoto'],
        urlVideo = json['urlVideo'],
        latitude = json['latitude'],
        longitude = json['longitude'];

  @override
  String toString() {
    return 'Carro{id: $id, nome: $nome, tipo: $tipo, descricao: $descricao, urlFoto: $urlFoto, urlVideo: $urlVideo, latitude: $latitude, longitude: $longitude}';
  }
}
