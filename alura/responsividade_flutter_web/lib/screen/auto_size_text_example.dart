import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:flutter/material.dart';

class AutoSizeTextExample extends StatelessWidget {
  const AutoSizeTextExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Tamanhos de textos"),
        ),
        body: Column(
          children: const [
            Text(
              "Mussum Ipsum, cacilds vidis litro abertis. Manduma pindureta quium dia nois paga. "
              "Posuere libero varius. Nullam a nisl ut ante blandit hendrerit. Aenean sit amet nisi. "
              "Quem manda na minha terra sou euzis! Praesent vel viverra nisi. "
              "Mauris aliquet nunc non turpis scelerisque, eget.",
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(
              height: 50,
            ),
            AutoSizeText(
              "Mussum Ipsum, cacilds vidis litro abertis. Delegadis gente "
              "finis, bibendum egestas augue arcu ut est. Si num tem leite "
              "então bota uma pinga aí cumpadi! Não sou faixa preta cumpadi, "
              "sou preto inteiris, inteiris. Nec orci ornare consequat. "
              "Praesent lacinia ultrices consectetur. Sed non ipsum felis.",
              // maxLines: 2,
              // minFontSize: 14,
              // style: TextStyle(fontSize: 24),
              // overflowReplacement: Text("Texto original não coube"),

              //overflow: TextOverflow.ellipsis,
              // stepGranularity: 2,
              // minFontSize: 14,

              maxLines: 3,
              presetFontSizes: [30, 22, 10],
            ),
          ],
        ));
  }
}
