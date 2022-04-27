import 'package:facebook_interface/model/models.dart';
import 'package:facebook_interface/model/story.dart';
/*
* Fontes imagens: https://source.unsplash.com/
* Foto específica:
*   https://source.unsplash.com/JQFHdpOKz2k/800x600
* Foto aleatória:
*   https://source.unsplash.com/9ChfwZzv4ys/800x600
* */

/* Usuário Logado */
User loggedUser = User(
    name: "Jamilton Damasceno",
    urlPhoto: "https://source.unsplash.com/EQFtEzJGERg/800x600"
);

/* Lista de usuários online */
List<User> usuariosOnline = [
  User(
      name: "José Renato de almeida",
      urlPhoto: "https://source.unsplash.com/UJLAMjEjISo/800x600"
  ),
  User(
      name: "Maria Almeida",
      urlPhoto: "https://source.unsplash.com/0wRXAXqIp58/800x600"
  ),
  User(
      name: "Fernando Lima de albuquerque filho",
      urlPhoto: "https://source.unsplash.com/59HOrlAKTOU/800x600"
  ),
  User(
      name: "Marcela Faria",
      urlPhoto: "https://source.unsplash.com/GXzHGgzraHc/800x600"
  ),
  User(
      name: "Carlos Eduardo",
      urlPhoto: "https://source.unsplash.com/y8yimL21z8s/800x600"
  ),
  User(
      name: "Joana Santos",
      urlPhoto: "https://source.unsplash.com/PXWiHU7pbeg/800x600"
  ),
  User(
      name: "Rodrigo Caio",
      urlPhoto: "https://source.unsplash.com/MS0RHQ1enek/800x600"
  ),
  User(
      name: "Pedro do Carmo",
      urlPhoto: "https://source.unsplash.com/9ChfwZzv4ys/800x600"
  ),
];

List<Story> stories = [
  Story(
    user: usuariosOnline[0],
    imageUrl: "https://source.unsplash.com/JMWjOup32Fk/800x600",
    viewed: true
  ),
  Story(
    user: usuariosOnline[1],
    imageUrl: "https://source.unsplash.com/no_TCkPUq_s/800x600",
    viewed: true
  ),
  Story(
      user: usuariosOnline[2],
      imageUrl: "https://source.unsplash.com/6dX5TPPM34M/800x600"
  ),
  Story(
      user: usuariosOnline[3],
      imageUrl: "https://source.unsplash.com/PO7CGnoDFUI/800x600"
  ),
  Story(
      user: usuariosOnline[4],
      imageUrl: "https://source.unsplash.com/rewyZqUwAqY/800x600"
  ),
  Story(
      user: usuariosOnline[5],
      imageUrl: "https://source.unsplash.com/1HpQU1evGK8/800x600"
  ),
  Story(
      user: usuariosOnline[6],
      imageUrl: "https://source.unsplash.com/W9z_628BBpc/800x600"
  ),
  Story(
      user: usuariosOnline[7],
      imageUrl: "https://source.unsplash.com/DOb-2jd0sbc/800x600"
  ),
];

/*
/* Lista de postagens */
List<Postagem> postagens = [
  Postagem(
      usuario: usuariosOnline[0],
      descricao: "Passeio muito legal no final de semana",
      tempoAtras: "20m",
      urlImagem: "https://source.unsplash.com/DOb-2jd0sbc/800x600",
      curtidas: 30,
      comentarios: 3,
      compartilhamentos: 5
  ),
  Postagem(
      usuario: usuariosOnline[1],
      descricao: "Quero compartilhar com você algo que aconteceu...",
      tempoAtras: "40m",
      urlImagem: "https://source.unsplash.com/G0H58Z5aPog/800x600",
      curtidas: 30,
      comentarios: 3,
      compartilhamentos: 5
  ),
  Postagem(
      usuario: usuariosOnline[2],
      descricao: "Não recomendo esse lugar, não fomos bem atendidos",
      tempoAtras: "55m",
      urlImagem: "https://source.unsplash.com/1a_u4n02YNo/800x600",
      curtidas: 30,
      comentarios: 3,
      compartilhamentos: 5
  ),
  Postagem(
      usuario: usuariosOnline[3],
      descricao: "Não importa o que você sabe, mas o que faz com o que você sabe!",
      tempoAtras: "1h",
      urlImagem: "https://source.unsplash.com/sfL_QOnmy00/800x600",
      curtidas: 30,
      comentarios: 3,
      compartilhamentos: 5
  ),
  Postagem(
      usuario: usuariosOnline[4],
      descricao: "Preciso de indicações de eletricista, meu chuveiro pifou :(",
      tempoAtras: "2h",
      urlImagem: "https://source.unsplash.com/_tWMmC9CQXQ/800x600",
      curtidas: 30,
      comentarios: 3,
      compartilhamentos: 5
  ),
  Postagem(
      usuario: usuariosOnline[5],
      descricao: "Que chuva maravilhosa!",
      tempoAtras: "2d",
      urlImagem: "https://source.unsplash.com/a4wUKaaMGWQ/800x600",
      curtidas: 30,
      comentarios: 3,
      compartilhamentos: 5
  ),
  Postagem(
      usuario: usuariosOnline[6],
      descricao: "Um dia mais que especial, nos divertimos bastante ;)",
      tempoAtras: "3d",
      urlImagem: "https://source.unsplash.com/YS1OOmHAFD0/800x600",
      curtidas: 100,
      comentarios: 30,
      compartilhamentos: 3
  ),
  Postagem(
      usuario: usuariosOnline[7],
      descricao: "VOCÊ É DO TAMANHO DOS SEUS SONHOS! Lute, persista, "
          "insista, corra atrás, passe algumas noites sem dormir direito, "
          "mas nunca desista de seus sonhos, acredite que é capaz, se olhe "
          "no espelho e diga pra você: VOCÊ TEM POTENCIAL! "
          "Ninguém além de você mesmo pode torná-lo real.",
      tempoAtras: "3d",
      urlImagem: "https://source.unsplash.com/Ng2Hg1YMMuU/800x600",
      curtidas: 230,
      comentarios: 25,
      compartilhamentos: 3
  ),
];
*/